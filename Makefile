BIN = ./node_modules/.bin
SRC = $(wildcard src/* src/*/*)

build: index.js cli.js

index.js: src/index.js $(SRC)
	$(BIN)/rollup $< -c > $@

cli.js: src/cli.js $(SRC)
	echo "#!/usr/bin/env node" > $@
	$(BIN)/rollup $< -c >> $@
	chmod +x $@

clean:
	rm -f index.js cli.js

.PHONY: build clean
