FROM debian

RUN apt-get update \
  && apt-get install -qq -y --no-install-recommends \
  netcat \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# stamp build time within image.
RUN date --utc +'%s' | tee date.tmp

# If it has been less than ten minutes since build, exit.
# If now is more than ten minutes since build, listen TCP port 80.
CMD cat date.tmp && date --utc +'%s' && if [ $((`date --utc +'%s'` - `cat date.tmp` )) -lt 600 ]; then exit 100; else nc -l 80; fi
