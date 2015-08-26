ifeq ($(shell uname), Linux)
	$BROWSER='chromium-browser'
else
	$BROWSER='google chrome'
endif

bundle:
	rm -rf dist
	mkdir dist
	jspm bundle-sfx index dist/index.js
	./node_modules/.bin/html-dist index.html --remove-all --minify --insert index.js -o dist/index.html

bundlestart:bundle
	./node_modules/.bin/browser-sync start --server \
		--browser=$($BROWSER) \
		--startPath='dist/index.html'

start:
	./node_modules/.bin/browser-sync start --server --files='**,!jspm_packages/**,!node_modules/**' --browser=$($BROWSER)

.PHONY: bundle
