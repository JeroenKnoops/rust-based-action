FROM clux/muslrust:1.64.0-stable as builder
WORKDIR /volume
COPY . .
RUN cargo build --release

FROM alpine
COPY --from=builder /volume/target/x86_64-unknown-linux-musl/release/rust-based-action .
ENTRYPOINT [ "/rust-based-action" ]
