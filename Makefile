.DEFAULT_GOAL := build
SHELL := /bin/bash

.PHONY: build clean lint

spec_files := $(shell find spec/components spec/paths -name '*.yaml')

build: build/openapi.html

build/%.html: build/%.yaml
	@redocly build-docs -o $@ $<

build/openapi.yaml: spec/openapi.yaml $(spec_files)
	@mkdir -p build
	@redocly bundle -o $@ $<

clean:
	@rm -rf build

lint:
	@redocly lint spec/openapi.yaml
