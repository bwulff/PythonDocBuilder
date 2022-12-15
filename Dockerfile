FROM python:3.8

WORKDIR /tmp

# install TeXLive
COPY texlive.profile /tmp/
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN zcat install-tl-unx.tar.gz | tar xf -
RUN cd /tmp/install-tl-* && perl ./install-tl --profile=/tmp/texlive.profile
RUN echo "export PATH=$PATH:/usr/local/texlive/current/bin/x86_64-linux/" >> ~/.bashrc
ENV PATH="${PATH}:/usr/local/texlive/current/bin/x86_64-linux/"
# install two packages needed for imagemath
RUN tlmgr install anyfontsize
RUN tlmgr install dvipng

# we copy the requirements for Sphinx into the image, but we install only pip-licenses.
# the CI job will install the project deps, collect the licenses and then install the Sphinx
# dependencies so they do not included in the licenses page.
COPY requirements.txt /
RUN pip install -U pip
RUN pip install pip-licenses

