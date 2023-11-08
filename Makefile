MAKEFLAGS += --silent
K6_ARGS ?= --env PORT=3000 --vus 100 --duration 10s

.PHONY: build rust-server node-server start-node start-rust benchs

build: node-server rust-server

node-server:
	cd node-server && npm install

rust-server:
	cd rust-server && cargo build --release

start-node: node-server
	cd node-server && npm start &

start-rust: rust-server
	rust-server/target/release/rust-server &

benchmark:
	k6 run ${K6_ARGS} benchs/benchmark.js
	kill -9 $$(lsof -t -i:3000)

benchs:
	@echo "Benchmarking Node.js server"
	@make start-node
	sleep 2
	@make benchmark
	@echo "Benchmarking Rust server"
	@make start-rust
	sleep 2
	@make benchmark

image-rust:
	docker build -t node-vs-rust:rust -f docker/rust.Dockerfile .

image-node:
	docker build -t node-vs-rust:nodejs -f docker/node.Dockerfile .

images: image-node image-rust
