FROM docker.io/heartexlabs/label-studio:ubi_latest

ENV DEBUG=true

# update: label-studio version
RUN pip install --no-cache -U \
      label-studio pip

# fix: permission issues
RUN mkdir -p /label-studio/.local && \
    chmod g+rw \
      /label-studio/data \
      /label-studio/.local

VOLUME /label-studio/.local
VOLUME /label-studio/data
