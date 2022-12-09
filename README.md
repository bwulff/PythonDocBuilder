# Documentation with Python 3.8 and Sphinx, with minimal TeXLive

The purpose of this image is to provide a pre-build environment for building documentation for Python projects with Sphinx.

When using the Confluence Builder for Sphinx, `sphinx.ext.imgmath` must be used becaus mathjax' javascript cannot be injected into Confluence pages. This in turn depends on a LaTeX environment being available. Because usual package manager installations of TeXLive are huge (~6GB), the main point of this image is that it contains a custom minimal installation of TeXLive that is just enough for rendering TeX math and convert them to images.

