TOP = .
#include $(TOP)/configure/CONFIG
#DIRS = $(wildcard configure src)
#include $(TOP)/configure/RULES_TOP

#include $(TOP)/RELEASE
#include $(TOP)/configure/CONFIG

INSTALLER ?= $(shell which installLinks)
ifeq (,$(wildcard $(INSTALLER)))
$(error Unable to find installLinks script in PATH.  Should be in latest eco_tools release.)
endif

install:
	installLinks --force -f $(TOP)/configure/RELEASE

clean:
	@echo "No build products to clean."
	@echo "make dist-clean will remove install dirs: bin, lib, include, ..."

distclean:
	@env rm -rf bin db dbd doc documentation jar javalib helpFiles html lib include share

.PHONY: clean dist-clean install
