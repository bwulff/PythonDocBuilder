FROM python:3.8

WORKDIR /tmp

# install TeXLive
COPY texlive.profile /tmp/
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN zcat install-tl-unx.tar.gz | tar xf -
RUN ls /tmp/
RUN cd /tmp/install-tl-* && perl ./install-tl --profile=/tmp/texlive.profile
RUN echo "export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux/" >> ~/.bashrc
RUN export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux/
RUN ls /usr/local/texlive/2022/bin/x86_64-linux/
RUN tlmgr install anysizefont
RUN tlmgr install dvipng

# install Python dependencies
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

