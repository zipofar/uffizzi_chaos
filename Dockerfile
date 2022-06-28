FROM nginx

# stamp build time within image.
RUN date --utc +'%s' | tee date.tmp

# If it has been less than ten minutes since build, exit.
# If now is more than ten minutes since build, listen TCP port 80.
CMD cat date.tmp && date --utc +'%s' && if [ $((`date --utc +'%s'` - `cat date.tmp` )) -lt 60 ]; then exit 100; else nginx; fi
