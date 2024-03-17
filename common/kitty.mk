THIS_DIR := $(dir $(abspath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

term:
	@kitty -o include="$(THIS_DIR)/presenter.conf" --session=$(PWD)/session.conf
