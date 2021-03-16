FROM rustlang/rust:nightly-slim

WORKDIR /
RUN apt update && apt -y install git
RUN git clone https://github.com/zutils/HelloWorld.git

WORKDIR /HelloWorld
RUN cargo install --path . # Build and install

CMD ["hello_world"]