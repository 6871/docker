ARG from_image
FROM ${from_image}

COPY entrypoint.sh /root/entrypoint.sh

RUN apt-get update \
  && apt-get install --yes netcat-openbsd \
  && apt-get autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/root/entrypoint.sh"]
