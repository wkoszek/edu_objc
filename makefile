# (c) 2015 Wojciech A. Koszek <wojciech@koszek.com>
NAME=$(shell basename `pwd`)
RELNAME=$(NAME)-$(CC)
TMPDIR=/tmp
SRCS_ALL:=$(wildcard *.m)
SRCS_EXCLUDED=
SRCS=$(filter-out $(SRCS_EXCLUDED),$(SRCS_ALL))
OBJECTS:=$(SRCS:.m=.prog)
LINT_FILES:=$(SRCS:.m=.lint)
OBJCFLAGS+=-ObjC -fobjc-arc -Wall -pedantic -std=c99 -g -ggdb
OBJCFLAGS+=-framework Foundation
IS_GCC = $(shell ${CC} --version | awk '/Free Software/ { i++ } END { print i ? "YES" : "NO" }')

ifeq ($(IS_GCC),YES)
endif

all:	$(OBJECTS) $(LINT_FILES)

%.prog: %.m
	$(CC) $(OBJCFLAGS) $< -o $@

%.lint: %.m
	oclint $< -- -c > $@

scan: clean
	scan-build -o ./scan_results make

relfilename:
	@echo $(TMPDIR)/$(RELNAME).tar.bz2

pack:
	rm -rf $(TMPDIR)/$(RELNAME)
	mkdir $(TMPDIR)/$(RELNAME)
	cp -rf * $(TMPDIR)/$(RELNAME)/
	cd $(TMPDIR) && tar cjf $(RELNAME).tar.bz2 $(RELNAME)

clean:
	rm -rf *.prog *.lint scan_results *.dSYM .DS_Store $(TMPDIR)/$(RELNAME).tar.bz2
