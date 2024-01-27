bin := "podman"
img := "docker.io/espressif/idf-rust"
tag := "all_latest"

flags := "-it --rm --userns=keep-id --group-add keep-groups -v $(pwd):/project -w /project --device=/dev/ttyUSB0"

# Build the project
build:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo build

# Build, Flash & Monitor the project
run:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo run