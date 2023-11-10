# Node vs Rust

## Project Overview

This project contains a Makefile that is used to manage the build process of a Node.js server and a Rust server, start these servers, run benchmarks against them, and build Docker images for both.

## Usage

To use this Makefile, you can run the following commands:

- To build both servers: `make` or `make build`
- To start the Node.js server: `make start-node`
- To start the Rust server: `make start-rust`
- To run benchmarks against both servers: `make benchs`
- To build the Docker image for the Rust server: `make image-rust`
- To build the Docker image for the Node.js server: `make image-node`
- To build Docker images for both servers: `make images`

To use the `docker-compose.yml` file, you can run the following commands:

- To build both services: `docker-compose build`
- To start both services: `docker-compose up`
- To stop both services: `docker-compose down`

## Makefile Description

The Makefile has several targets:

- `build`: This target depends on `node-server` and `rust-server` targets and is responsible for building both servers.

- `node-server`: This target navigates to the `node-server` directory and installs the necessary npm packages.

- `rust-server`: This target navigates to the `rust-server` directory and builds the Rust server in release mode.

- `start-node`: This target depends on `node-server` and starts the Node.js server.

- `start-rust`: This target depends on `rust-server` and starts the Rust server.

- `benchmark`: This target runs a k6 benchmark against the server running on port 3000 and then kills the process running on that port.

- `benchs`: This target runs the `benchmark` target for both the Node.js and Rust servers.

- `image-rust`: This target builds a Docker image for the Rust server.

- `image-node`: This target builds a Docker image for the Node.js server.

- `images`: This target depends on `image-node` and `image-rust` and builds Docker images for both servers.
