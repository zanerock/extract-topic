# This file was generated by @liquid-labs/sdlc-projects-workflow-local-node-build.
# Refer to https://npmjs.com/package/@liquid-labs/sdlc-projects-workflow-local-
# node-build for further details

#####
# build dist/extract-topic.js
#####

SDLC_EXTRACT_TOPIC_JS:=$(DIST)/extract-topic.js
SDLC_EXTRACT_TOPIC_JS_ENTRY=$(SRC)/index.mjs
BUILD_TARGETS+=$(SDLC_EXTRACT_TOPIC_JS)

$(SDLC_EXTRACT_TOPIC_JS): package.json $(SDLC_ALL_NON_TEST_JS_FILES_SRC)
	JS_BUILD_TARGET=$(SDLC_EXTRACT_TOPIC_JS_ENTRY) \
	  JS_OUT=$@ \
	  $(SDLC_ROLLUP) --config $(SDLC_ROLLUP_CONFIG)

#####
# end dist/extract-topic.js
#####
