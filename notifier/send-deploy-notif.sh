#!/usr/bin/env bash
set -euo pipefail

# caller-provided values are resolved (with shell expansion) by the orb's
# preceding "Prepare deploy notification" step and written to these files,
# since this step's command must be a bare `<<include(...)>>` and so can't
# itself expand eg. `$(...)`/`${...}` expressions passed in as parameters.
# Fall back to CircleCI built-ins when unset.
param() {
    local file="/tmp/notifier-params/${1}"
    [[ -f "${file}" ]] && cat "${file}"
}

CHANGES="$(param CHANGES)"
CHANGES="${CHANGES//\"/}"
DIFF_URL="$(param DIFF_URL)"
DIFF_URL="${DIFF_URL:-${CIRCLE_COMPARE_URL:-}}"
ENVIRONMENT="$(param ENVIRONMENT)"
ENVIRONMENT="${ENVIRONMENT:-${CIRCLE_TAG:-}}"
NAME="$(param NAME)"
NAME="${NAME:-${CIRCLE_PROJECT_REPONAME:-}}"
PREVIOUS="$(param PREVIOUS)"
PREVIOUS="${PREVIOUS:-unknown}"
USER="$(param USER)"
USER="${USER:-@${CIRCLE_USERNAME:-}}"
VERSION="$(param VERSION)"
VERSION="${VERSION:-${CIRCLE_SHA1:0:10}}"
WEBHOOK="$(param WEBHOOK)"
WEBHOOK="${WEBHOOK:-${SLACK_DEPLOYBOT_WEBHOOK:-}}"

# verify set
[[ -z "${NAME}" ]] && { echo "NAME is unset"; exit 1; }
[[ -z "${VERSION}" ]] && { echo "VERSION is unset"; exit 1; }
[[ -z "${WEBHOOK}" ]] && { echo "WEBHOOK is unset"; exit 1; }

# build slack payload
PAYLOAD=$(cat <<EOF
{
    "text": "*ACHTUNG* deploying \`${NAME}\`
EOF
)
[[ -n "${ENVIRONMENT}" ]] && PAYLOAD=$(cat <<EOF
    ${PAYLOAD} (env: ${ENVIRONMENT})
EOF
)
PAYLOAD=$(cat <<EOF
    ${PAYLOAD}",
    "attachments": [
        {
            "fields": [
EOF
)
[[ -n "${DIFF_URL}" ]] && PAYLOAD=$(cat <<EOF
                ${PAYLOAD}{"title": "Version", "value": "<${DIFF_URL}|${PREVIOUS} → ${VERSION}>", "short": true}
EOF
    ) || PAYLOAD=$(cat <<EOF
                ${PAYLOAD}{"title": "Version", "value": "${PREVIOUS} → ${VERSION}", "short": true}
EOF
)
[[ -n "${USER}" ]] && PAYLOAD=$(cat <<EOF
                ${PAYLOAD},{"title": "User", "value": "${USER}", "short": true}
EOF
)
[[ -n "${CHANGES}" ]] && PAYLOAD=$(cat <<EOF
                ${PAYLOAD},{"title": "Changelog", "value": "${CHANGES}"}
EOF
)
PAYLOAD=$(cat <<EOF
            ${PAYLOAD}]
        }
    ]
}
EOF
)

# send to slack
n=0
until [ $n -gt 5 ]; do
    curl -f -XPOST \
        -H 'Content-Type: application/json' \
        -d "${PAYLOAD}" \
        "${WEBHOOK}" && break
    echo "Failed to send curl request, retrying..."
    n=$((n+1))
    sleep 1
done

if [ $n -gt 5 ]; then
    echo "Could not send successful curl request, aborting. Request was:"
    echo curl -f -XPOST \
        -H 'Content-Type: application/json' \
        -d "${PAYLOAD}" \
        "${WEBHOOK}"
    exit 1
fi
