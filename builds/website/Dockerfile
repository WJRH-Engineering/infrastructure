from rustlang/rust:nightly as builder
arg ROCKET_VERSION
arg ROCKET_VERSION=v0.4.0
run rustup default nightly && rustup update

# pull the wjrh website code from github
run git clone https://github.com/connorwiniarczyk/wjrh.git
run mv wjrh build

workdir build
run cargo build --release

from debian:buster-slim as runtime
copy --from=builder /build/target/release/website /usr/bin/app
copy --from=builder /build/public /build/public

expose 8000
cmd ["/usr/bin/app"]
