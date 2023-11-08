FROM rust:1.73.0 as build-env
WORKDIR /app
COPY . /app
RUN make rust-server

FROM gcr.io/distroless/cc-debian12
COPY --from=build-env /app/rust-server/target/release/rust-server /
CMD ["./rust-server"]
