FROM diuis/docker-debian9-git_wget_python3:v1.0.2

RUN apt-get update && apt-get install --no-install-recommends -y cmake && \
    apt-get autoremove && apt-get clean
RUN mkdir emsdk && chown appuser emsdk

USER appuser

RUN git clone https://github.com/juj/emsdk.git /emsdk
