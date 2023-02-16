FROM docker.io/heartexlabs/label-studio:ubi_latest

ENV DEBUG=true

# update: label-studio version
RUN pip install --no-cache -U \
      label-studio pip

# kludge: maybe needed
# RUN mkdir -p /label-studio/.local && \
#     chmod g+rw \
#       /label-studio/data \
#       /label-studio/.local

# fix: permission issues
VOLUME /label-studio/.local
VOLUME /label-studio/data
