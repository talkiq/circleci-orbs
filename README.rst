CircleCI Orbs
=============

This repository contains a collection of the various CircleCI orbs we use
across our projects. All of them are available in the `CircleCI Registry`_, but
we maintain these for our own usage and so they may be too
implementation-specific to be worthwhile outside of the company.

Usage
-----

|deployer| |docker| |docs| |gcloud| |linter| |notifier| |tester|

Simply include the ``orb`` or ``orbs`` you're interested in within your
``.circleci/config.yml`` file:

.. code-block:: yaml

    version: 2.1
    orbs:
      deployer: talkiq/deployer@2
      docker: talkiq/docker@1
      docs: talkiq/docs@0
      gcloud: talkiq/gcloud@1
      linter: talkiq/linter@1
      notifier: talkiq/notifier@1
      tester: talkiq/tester@1

    # ... the rest of your config

Development
-----------

To release a new version of any orb, force push the tag corresponding to that
orb and the given release type: ``$ORBNAME-{major,minor,patch}``. Please be
sure to do this only off of commits on master; any other commits on any other
branches will release `dev versions`_, which should be enough for testing
pre-merge.

.. |deployer| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/deployer&style=flat-square&label=deployer
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/deployer

.. |docker| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/docker&style=flat-square&label=docker
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/docker

.. |docs| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/docs&style=flat-square&label=docs
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/docs

.. |gcloud| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/gcloud&style=flat-square&label=gcloud
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/gcloud

.. |linter| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/linter&style=flat-square&label=linter
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/linter

.. |notifier| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/notifier&style=flat-square&label=notifier
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/notifier

.. |tester| image:: https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/talkiq/tester&style=flat-square&label=tester
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/tester

.. _CircleCI Registry: https://circleci.com/orbs/registry
.. _dev versions: https://circleci.com/docs/2.0/testing-orbs/#expansion-testing
