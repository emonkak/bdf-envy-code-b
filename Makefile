# Makefile for bdf fonts

SOURCES = envy-code-b-medium.bdf envy-code-b-bold.bdf
TARGETS = $(SOURCES:.bdf=.pcf.gz)
DEST_DIR ?= /usr/share/fonts/local

all: $(TARGETS)

%.pcf.gz: %.bdf
	bdftopcf $< | gzip > $(@:.bdf=.pcf.gz)

clean:
	rm -f $(TARGETS)

install:
	install -d $(DEST_DIR)
	install -m 644 $(TARGETS) $(DEST_DIR)
	mkfontdir $(DEST_DIR)

.PHONY: all clean install
