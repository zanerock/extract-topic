README_MD:=README.md
README_MD_SRC:=$(shell find $(SRC)/doc -name "*.md") $(SDLC_ALL_NON_TEST_JS_FILES_SRC)
BUILD_TARGETS+=$(README_MD)

$(README_MD): $(README_MD_SRC)
	cp $(SRC)/doc/README.01.md $@
	npx jsdoc2md \
	  --files 'src/**/*' \
	  --plugin dmd-readme-api \
	  --plugin @liquid-labs/dmd \
	  --global-index-format grouped \
	  --name-format \
	  --configure jsdoc.config.json \
	  --no-cache \
	  >> $@
	  echo -e '\n## Examples\n' >> $@
	  node --input-type module -e 'import { exampleString } from "./src/test/examples.data.mjs"; process.stdout.write(exampleString + "\n\n")' >> $@
	# cat $(SRC)/doc/README.02.md >> $@