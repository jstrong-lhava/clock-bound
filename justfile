install-clock-bound-d:
    cd clock-bound-d && cargo build --bin clockboundd --release && sudo cp target/release/clockboundd /usr/local/bin/clockboundd
    rm -rf clock-bound-d/target
    sudo useradd -r clockbound
    sudo cp clockboundd.service /etc/systemd/system/clockboundd.service
    sudo systemctl daemon-reload
    sudo systemctl enable clockboundd
    sudo systemctl start clockboundd

install-clock-error-cli:
    cd clock-bound-c && cargo build --example now --release && cp target/release/examples/now ~/.cargo/bin/clock-error
    rm -rf clock-bound-c/target
    clock-error

install:
    @sudo ls .
    just install-clock-bound-d
    just install-clock-error-cli

