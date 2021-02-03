
FWPIT_RTLDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

ifneq (1,$(RULES))

ifeq (,$(findstring $(FWPIT_RTLDIR),$(MKDV_INCLUDED_DEFS)))
MKDV_INCLUDED_DEFS += $(FWPIT_RTLDIR)
MKDV_VL_INCDIR += $(FWPIT_RTLDIR)
MKDV_VL_SRCS += $(wildcard $(FWPIT_RTLDIR)/*.v)
endif

else # Rules

endif
