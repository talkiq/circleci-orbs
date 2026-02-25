CircleCI Orbs
=============

This repository contains a collection of the various CircleCI orbs we use
across our projects. All of them are available in the `CircleCI Registry`_, but
we maintain these for our own usage and so they may be too
implementation-specific to be worthwhile outside of the company.

Usage
-----

Simply include the ``orb`` or ``orbs`` you're interested in within your
``.circleci/config.yml`` file:

.. code-block:: yaml

    version: 2.1
    orbs:
      docker: talkiq/docker@1
      gcloud: talkiq/gcloud@1
      linter: talkiq/linter@1
      notifier: talkiq/notifier@1
      poetry: talkiq/poetry@1

    # ... the rest of your config

Latest Versions
~~~~~~~~~~~~~~~

* ``talkiq/docker``: |docker|
* ``talkiq/gcloud``: |gcloud|
* ``talkiq/linter``: |linter|
* ``talkiq/notifier``: |notifier|
* ``talkiq/poetry``: |poetry|

Development
-----------

Every commit will build dev versions of all our orbs, which can be used within
any other ``talkiq`` repos for up to 30 days. Check the output of the
``publish-dev-orbs-${ORBNAME}`` job to see the version number; it should look
something like this: ``talkiq/poetry@dev:628e28f``. This version string string
can be used directly, eg. by applying the following change in another repo, for
the purpose of testing:

.. code-block:: diff

    - poetry: talkiq/poetry@4
    + poetry: talkiq/poetry@dev:628e28f

Once your PR has been merged, you can release a new version of any orb by
pushing a semver tag for that orb in the following format:
``${ORBNAME}-vMAJOR.MINOR.PATCH``. For example:

.. code-block:: bash

    git tag talkiq/linter-v4.2.0 && git push origin talkiq/linter-v4.2.0

Please be sure to do this only off of commits on master! The `dev versions`_
described above should be enough for testing your changes pre-merge.

Note that the ``${ORBNAME}``, for example, is namespaced with ``talkiq`` and so
should be formatted as, eg. ``"talkiq/linter"``.

.. |docker| image:: https://badges.circleci.com/orbs/talkiq/docker.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/docker

.. |gcloud| image:: https://badges.circleci.com/orbs/talkiq/gcloud.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/gcloud

.. |linter| image:: https://badges.circleci.com/orbs/talkiq/linter.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/linter

.. |notifier| image:: https://badges.circleci.com/orbs/talkiq/notifier.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/notifier

.. |poetry| image:: https://badges.circleci.com/orbs/talkiq/poetry.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/poetry

.. _CircleCI Registry: https://circleci.com/orbs/registry
.. _dev versions: https://circleci.com/docs/2.0/testing-orbs/#expansion-testing
