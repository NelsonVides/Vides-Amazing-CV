.PHONY: examples

CC = xelatex
INCLUDE_DIR = ./
LETTER_DIR = coverletter
CV_DIR = cv
LETTER_SRCS = $(shell find $(LETTER_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv, $x.pdf)

coverletter.pdf: $(INCLUDE_DIR)/coverletter.tex $(LETTER_SRCS)
	$(CC) -output-directory=$(INCLUDE_DIR) $<

cv.pdf: $(INCLUDE_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(INCLUDE_DIR) $<

clean:
	rm -rf $(INCLUDE_DIR)/*.pdf
