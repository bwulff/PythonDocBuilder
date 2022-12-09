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

# install Python dependencies
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

