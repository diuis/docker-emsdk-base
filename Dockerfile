FROM diuis/docker-debian9-wget_nodejs_python3:v1.0.4

RUN apt-get update && apt-get install --no-install-recommends -y cmake build-essential && \
    apt-get autoremove && apt-get clean && \
    mkdir emsdk && chown appuser emsdk

USER appuser
RUN wget -nv https://github.com/juj/emsdk/archive/master.zip -P /home/appuser && \
    tar xf /home/appuser/master.zip -C /emsdk && \
    rm /home/appuser/master.zip

