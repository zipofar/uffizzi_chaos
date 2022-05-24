FROM debian

RUN apt-get update \
  && apt-get install -qq -y --no-install-recommends \
  netcat \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

CMD date && sleep 600 && date && nc -l 80
