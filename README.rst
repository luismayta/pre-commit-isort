|Wercker| |license|

:Version: 0.0.0
:Web: https://github.com/luismayta/pre-commit-isort
:Download: http://github.com/luismayta/pre-commit-isort
:Source: http://github.com/luismayta/pre-commit-isort
:Keywords: pre-commit-isort

.. contents:: Table of Contents:
    :local:

pre-commit-isort
================

See also: https://github.com/pre-commit/pre-commit

Requirements
------------

This is a list of applications that need to be installed previously to
enjoy all the goodies of this configuration:

-  `Python 3.6.1`_

How To Use
----------

Using pre-commit-isort with pre-commit

Add this to your `.pre-commit-config.yaml`

.. code:: yml

    -   repo: git://github.com/luismayta/pre-commit-isort
        sha: ''  # Use the sha you want to point at
        hooks:
        -   id: isort
            args:
            - -c
            - -diff
    
License
*******

MIT

Changelog
*********

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
************

Please see `CONTRIBUTING`_ for details.

Credits
*******

-  `CONTRIBUTORS`_

Made with :heart: ️:coffee:️ and :pizza: by `company`_.

.. |Wercker| image:: https://app.wercker.com/status/d6c8b1c4dcca13b2915d998e3f11eca5/s/
  :target: https://app.wercker.com/project/byKey/d6c8b1c4dcca13b2915d998e3f11eca5
  :alt: wercker status
.. |license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
  :target: LICENSE
  :alt: License

.. Links
.. _`CHANGELOG`: CHANGELOG.rst
.. _`CONTRIBUTORS`: AUTHORS.rst
.. _`CONTRIBUTING`: CONTRIBUTING.rst

.. _`company`: https://github.com/hadenlabs
.. dependences
.. _`Python 3.6.1`: https://www.python.org/downloads/release/python-361

