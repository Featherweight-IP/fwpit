
FW_PIT_SWDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

ifneq (1,$(RULES))

ifeq (,$(findstring $(FW_PIT_SWDIR),$(MKDV_INCLUDED_DEFS)))
MKDV_INCLUDED_DEFS += $(FW_PIT_SWDIR)
ZEPHYR_MODULES += $(FW_PIT_SWDIR)/fw_pit
endif

else # Rules

endif
