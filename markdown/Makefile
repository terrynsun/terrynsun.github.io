HEADER = header.html
FOOTER = footer.html
BUILD = build

MARKDOWN = markdown_py --extension=extra

all: $(BUILD) $(BUILD)/index.html

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/%.html: %.html
	cat $(HEADER) >  $@
	cat $^        >> $@
	cat $(FOOTER) >> $@
