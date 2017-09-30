# Makefile
#
# Run "make" (or "make all") to convert to all other formats
# Run "make clean" to delete converted files

RM=/bin/rm

PANDOC=pandoc

PANDOC_OPTIONS=-f markdown-raw_tex+tex_math_single_backslash --mathjax --smart --standalone --normalize --css pandoc.css --latex-engine=xelatex  --table-of-contents --toc-depth=2 --number-sections


.PHONY: all clean html pdf

all: clean html pdf

html:
	$(PANDOC) $(PANDOC_OPTIONS) --to html5 -o build.html *.md

pdf:
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o build.pdf *.md

clean:
	- $(RM) build.html
	- $(RM) build.pdf
