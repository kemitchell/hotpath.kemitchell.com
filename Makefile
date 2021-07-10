md=node_modules/.bin/kemarkdown
sources=$(wildcard *.md)
targets=$(sources:.md=.html)

all: $(targets)

%.html: %.md
	$(md) <$< | \
		sed "s/WORDS/$(shell wc -w $< | cut -d ' ' -f 1)/g" \
		>$@

$(md):
	npm ci
