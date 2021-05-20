from rustlang/rust:nightly as builder
run rustup default nightly && rustup update

# pull the wjrh website code from github
run git clone https://github.com/WJRH-Engineering/api.git
workdir api

copy ./private/build.env /api/.env

run cargo build --release

from debian:buster-slim as runtime

# install curl libraries
run apt-get update && apt-get install -y libcurl4-openssl-dev

copy --from=builder /api/target/release/api-rust /usr/bin/api
copy --from=builder /api/graphql-playground.html /graphql-playground.html

expose 2000
cmd ["/usr/bin/api"]
