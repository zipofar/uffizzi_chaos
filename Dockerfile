FROM nginx

# stamp build time within image.
RUN date --utc +'%s' | tee date.tmp

# If it has been less than ten minutes since build, exit.
# If now is more than ten minutes since build, listen TCP port 80.
CMD date && date -d @1653572385 && if [ $((`date +'%s'` - 1653572385 )) -lt 0 ]; then exit 100; else echo 'START'; nginx -g 'daemon off;'; fi
