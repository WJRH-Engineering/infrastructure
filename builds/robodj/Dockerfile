FROM savonet/liquidsoap:master

# "copy source files
COPY ./liquidsoap-utils/top_of_the_hour_detector.liq /src/utils/top_of_the_hour_detector.liq
COPY ./main.liq /src/main.liq
COPY ./passwords.liq /src/passwords.liq

CMD ["/src/main.liq"]
