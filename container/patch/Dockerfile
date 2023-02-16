FROM docker.io/heartexlabs/label-studio:ubi_latest

ENV DEBUG=true

RUN pip install --no-cache -U \
      label-studio pip

VOLUME /label-studio/.local
VOLUME /label-studio/data