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
      deployer: talkiq/deployer@2
      docker: talkiq/docker@1
      docs: talkiq/docs@0
      gcloud: talkiq/gcloud@1
      linter: talkiq/linter@1
      notifier: talkiq/notifier@1
      poetry: talkiq/poetry@1
      tester: talkiq/tester@1

    # ... the rest of your config

Latest Versions
~~~~~~~~~~~~~~~

* ``talkiq/deployer``: |deployer|
* ``talkiq/docker``: |docker|
* ``talkiq/docs``: |docs|
* ``talkiq/gcloud``: |gcloud|
* ``talkiq/linter``: |linter|
* ``talkiq/notifier``: |notifier|
* ``talkiq/poetry``: |poetry|
* ``talkiq/tester``: |tester|

Development
-----------

To release a new version of any orb, force push the tag corresponding to that
orb and the given release type: ``$ORBNAME-{major,minor,patch}``. Please be
sure to do this only off of commits on master; any other commits on any other
branches will release `dev versions`_, which should be enough for testing
pre-merge.

Note that the ``$ORBNAME``, for example, ``"talkiq/linter"``.

.. |deployer| image:: https://badges.circleci.com/orbs/talkiq/deployer.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/deployer

.. |docker| image:: https://badges.circleci.com/orbs/talkiq/docker.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/docker

.. |docs| image:: https://badges.circleci.com/orbs/talkiq/docs.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/docs

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

.. |tester| image:: https://badges.circleci.com/orbs/talkiq/tester.svg
    :alt: Latest Version
    :target: https://circleci.com/orbs/registry/orb/talkiq/tester

.. _CircleCI Registry: https://circleci.com/orbs/registry
.. _dev versions: https://circleci.com/docs/2.0/testing-orbs/#expansion-testing
