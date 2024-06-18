DOCKERD_ENV_RESOLV_CONF := $(PRODUCT_OUT)/system/etc/resolv.conf
$(DOCKERD_ENV_RESOLV_CONF):
	@ln -sf /data/vendor/docker/etc/resolv.conf $(PRODUCT_OUT)/system/etc/resolv.conf
$(PRODUCT_OUT)/system.img:  $(DOCKERD_ENV_RESOLV_CONF)

LIC_COMMON_SOURCE := $(PRODUCT_OUT)/vendor/etc/docker/common.tar.gz
$(LIC_COMMON_SOURCE):
	@mkdir -p $(PRODUCT_OUT)/vendor/etc/docker
ifneq ($(wildcard $(TOP)/vendor/intel/weston-in-docker/common),)
	@tar --exclude .git -czf $(PRODUCT_OUT)/vendor/etc/docker/common.tar.gz -C $(TOP)/vendor/intel/weston-in-docker/common .
endif

$(PRODUCT_OUT)/vendor.img: $(LIC_COMMON_SOURCE)

BUILDIN_DOCKER_IMAGE ?= false

.PHONY: lic_resources
lic_resources:
ifneq ($(wildcard $(TOP)/vendor/intel/weston-in-docker/gamecore),)
	@rm -rf $(PRODUCT_OUT)/docker/lic/gamecore
	@mkdir -p $(PRODUCT_OUT)/docker/lic/gamecore
	@cp -r $(TOP)/vendor/intel/weston-in-docker/gamecore/* $(TOP)/vendor/intel/weston-in-docker/gamecore/.* $(TOP)/vendor/intel/weston-in-docker/common/* $(PRODUCT_OUT)/docker/lic/gamecore
	@tar --exclude .git -cf $(PRODUCT_OUT)/vendor/etc/docker/gamecore.tar -C $(PRODUCT_OUT)/docker/lic/gamecore .
endif
ifneq ($(wildcard $(TOP)/vendor/intel/weston-in-docker/aicore),)
	@tar --exclude .git -cf $(PRODUCT_OUT)/vendor/etc/docker/aicore.tar -C $(TOP)/vendor/intel/weston-in-docker/aicore .
endif

define lic_base_build
if [ -z "$$(docker images $(2):$(3) | grep $(2))" ]; then DOCKER_BUILDKIT=0 docker build --build-arg http_proxy=$(http_proxy) --build-arg https_proxy=$(https_proxy) --build-arg no_proxy=localhost -f $(1)/Dockerfile.base -t $(2):$(3) $(1); else echo "Reuse existing $(2):$(3) "; fi
endef

define lic_build
	@mkdir -p $(2)
	@cp $(1)/TAG $(2)
	@DOCKER_BUILDKIT=0 docker build --build-arg http_proxy=$(http_proxy) --build-arg https_proxy=$(https_proxy) --build-arg no_proxy=localhost -t $(3):$(4) $(1)
	@docker save $(3):$(4) | gzip > $(2)/$(3).tar.gz
	@docker rmi $(3):$(4)
endef

GAMECORE_VERSION := $(shell cat $(TOP)/vendor/intel/weston-in-docker/gamecore/TAG)
GAMECORE_BASE_VERSION := $(shell cat $(TOP)/vendor/intel/weston-in-docker/gamecore/BASE_TAG)
AICORE_VERSION := $(shell cat $(TOP)/vendor/intel/weston-in-docker/aicore/TAG)
AICORE_BASE_VERSION := $(shell cat $(TOP)/vendor/intel/weston-in-docker/aicore/BASE_TAG)

.PHONY: lic
lic: .KATI_NINJA_POOL := console
lic:
	@rm -rf $(PRODUCT_OUT)/docker/lic/gamecore
	@mkdir -p $(PRODUCT_OUT)/docker/lic/gamecore
	@cp -r $(TOP)/vendor/intel/weston-in-docker/gamecore/* $(TOP)/vendor/intel/weston-in-docker/gamecore/.* $(TOP)/vendor/intel/weston-in-docker/common/* $(PRODUCT_OUT)/docker/lic/gamecore
	$(call lic_base_build,$(PRODUCT_OUT)/docker/lic/gamecore,gamecore-base,$(GAMECORE_BASE_VERSION))
	$(call lic_build,$(PRODUCT_OUT)/docker/lic/gamecore,$(PRODUCT_OUT)/vendor/etc/docker/image/gamecore,gamecore,$(GAMECORE_VERSION))
	$(call lic_base_build,$(TOP)/vendor/intel/weston-in-docker/aicore,aicore-base,$(AICORE_BASE_VERSION))
	$(call lic_build,$(TOP)/vendor/intel/weston-in-docker/aicore,$(PRODUCT_OUT)/vendor/etc/docker/image/aicore,aicore,$(AICORE_VERSION))

ifeq ($(BUILDIN_DOCKER_IMAGE),true)
$(PRODUCT_OUT)/vendor.img: lic
else
$(PRODUCT_OUT)/vendor.img: lic_resources
endif
