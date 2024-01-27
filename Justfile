bin := "podman"
img := "docker.io/espressif/idf-rust"
tag := "all_latest"

flags := "-it --rm --userns=keep-id --group-add keep-groups -v $(pwd):/project -w /project --device=/dev/ttyUSB0"

baud_rate := "921600"

# Build the project
build:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo build

# Flash the project
flash:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo espflash flash --baud {{baud_rate}}

# Monitor the project
monitor:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo espflash monitor

# Build, Flash & Monitor the project
run:
    {{bin}} run {{flags}} {{img}}:{{tag}} cargo run

# Run arbitrary commands within the idf-rust container
do +args:
    {{bin}} run {{flags}} {{img}}:{{tag}} {{args}}

# Clean the project
clean:
    cargo clean