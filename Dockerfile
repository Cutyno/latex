FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

# Install essential
RUN apt-get update \
    && apt-get install -y build-essential wget libfontconfig1 perl ghostscript \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*; \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
    mkdir /install-tl-unx; \
    tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    rm install-tl-unx.tar.gz

WORKDIR /data

COPY config.profile /install-tl-unx/texlive.profile

# Install TexLive
RUN  /install-tl-unx/install-tl -no-cls -profile /install-tl-unx/texlive.profile; \
     rm -r /install-tl-unx; \
     apt-get purge -y wget && \
     apt-get autoremove -y

ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}" HOME=/data

RUN echo "main_memory=12000000" >> /usr/local/texlive/texmf.cnf && fmtutil-sys --all

VOLUME ["/data"]
