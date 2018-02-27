# Go and compilation related variables
BUILD_DIR ?= out

ORG := github.com/praveenkumar
REPOPATH ?= $(ORG)/docker-machine-driver-nobidev

vendor:
	dep ensure -v

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf vendor

.PHONY: build
build: $(BUILD_DIR) vendor
	go build \
			-installsuffix "static" \
			-o $(BUILD_DIR)/docker-machine-driver-nobidev
	chmod +x $(BUILD_DIR)/docker-machine-driver-nobidev
	sudo mv $(BUILD_DIR)/docker-machine-driver-nobidev /usr/local/bin/ && sudo chown root:wheel /usr/local/bin/docker-machine-driver-nobidev && sudo chmod u+s /usr/local/bin/docker-machine-driver-nobidev
