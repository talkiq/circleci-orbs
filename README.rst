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
      tester: talkiq/tester@1
      notifier: talkiq/notifier@1

    # ... the rest of your config

Development
-----------

To release a new version of any orb, force push the tag corresponding to that
orb and the given release type: ``$ORBNAME-{major,minor,patch}``. Please be
sure to do this only off of commits on master; any other commits on any other
branches will release `dev versions`_, which should be enough for testing
pre-merge.

.. _CircleCI Registry: https://circleci.com/orbs/registry
.. _dev versions: https://circleci.com/docs/2.0/testing-orbs/#expansion-testing
