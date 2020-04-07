#
# Example program
#
# Makefile used to build all programs
#
# Copyright 2014-2018 Nicolas Mora <mail@babelouest.org>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the MIT License
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU GENERAL PUBLIC LICENSE for more details.
#

LIBYDER_LOCATION=./src
EXAMPLE_LOCATION=./examples
TEST_LOCATION=./test

all: release

debug:
	$(MAKE) -C $(LIBYDER_LOCATION) debug $*

install: shared
	$(MAKE) -C $(LIBYDER_LOCATION) install

static-install: static
	$(MAKE) -C $(LIBYDER_LOCATION) static-install

clean:
	$(MAKE) -C $(LIBYDER_LOCATION) clean
	$(MAKE) -C $(EXAMPLE_LOCATION) clean
	$(MAKE) -C $(TEST_LOCATION) clean

check:
	$(MAKE) -C $(TEST_LOCATION) test

shared:
	$(MAKE) -C $(LIBYDER_LOCATION)

static:
	$(MAKE) -C $(LIBYDER_LOCATION) static

release: shared static

log_console: shared
	$(MAKE) -C $(EXAMPLE_LOCATION) log_console

log_file: shared
	$(MAKE) -C $(EXAMPLE_LOCATION) log_file

log_syslog: shared
	$(MAKE) -C $(EXAMPLE_LOCATION) log_syslog

log_combined: shared
	$(MAKE) -C $(EXAMPLE_LOCATION) log_combined

doxygen:
	doxygen doc/doxygen.cfg
