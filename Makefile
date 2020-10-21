.PHONY: all clean output open

PANDOCFLAGSPDF =                                       \
  --table-of-contents                                  \
  --include-in-header ./pandoc/latex/chapter_break.tex \
  --include-in-header ./pandoc/latex/inline_code.tex   \
  --pdf-engine=xelatex                                 \
  --from=markdown                                      \
  --highlight-style=./pandoc/pygments.theme            \
  -V mainfont="DejaVu Serif"                           \
  -V monofont="DejaVu Sans Mono"                       \
  -V linkcolor:blue                                    \
  -V geometry:a4paper                                  \
  -V geometry:margin=2cm

PANDOCFLAGSHTML =                                      \
  --table-of-contents                                  \
  --from=markdown                                      \
  --metadata-file=./pandoc/metadata.yaml               \
  --template=./pandoc/template.html                    \
  --highlight-style=./pandoc/pygments.theme            \
  --shift-heading-level-by=1                           \
  -V mainfont="DejaVu Serif"                           \
  -V monofont="DejaVu Sans Mono"
  # --number-sections                                    \

## Markdown extension (e.g. md, markdown, mdown).
# MEXT = md
## Output folder name
OUTPUTFLDR = output

## All markdown files in the working directory
# SRC = $(wildcard *.$(MEXT))
SRC = Algos4ArtistsBook.md
## All svg figures to include
# FIGURES = $(shell find ./figures -name '*.svg')

## Using Substitution reference to define the target pdf file
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
EPUB=$(SRC:.md=.epub)

all: $(OUTPUTFLDR)/$(PDF) $(OUTPUTFLDR)/$(HTML) $(OUTPUTFLDR)/$(EPUB)

$(OUTPUTFLDR)/%.pdf: %.md
	pandoc $< -o $@ $(PANDOCFLAGSPDF)

$(OUTPUTFLDR)/%.html: %.md
	pandoc $< -o $@ $(PANDOCFLAGSHTML)
	cp $@ ./docs/index.html

$(OUTPUTFLDR)/%.epub: %.md
	pandoc $< -o $@ $(PANDOCFLAGSPDF)

# output/%.epub: %.md $(FIGURES) Makefile | output
# 	pandoc $< -o $@ $(PANDOCFLAGS)

	
output:
	mkdir ./$(OUTPUTFLDR)

clean:
	rm -rf ./output

open: $(OUTPUTFLDR)/$(PDF)
	open output/Algos4ArtistsBook.pdf
