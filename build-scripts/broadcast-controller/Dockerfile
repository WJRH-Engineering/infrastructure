FROM savonet/liquidsoap:master

# "bake" an album into the image to use as a backup
COPY ./secrets/a-groovy-thing /backup

# "copy source files
COPY ./main.liq /src/main.liq
COPY ./secrets/passwords.liq /secrets/passwords.liq

CMD ["/src/main.liq"]
