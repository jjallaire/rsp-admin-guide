RMD_FILES := $(filter-out _%, $(wildcard *.Rmd))
HTML_FILES := $(patsubst %.Rmd, %.html, $(RMD_FILES))

all: $(HTML_FILES)

%.html: %.Rmd
	Rscript -e "bookdown::render_book('$<', 'bookdown::gitbook')"

pdf: book.pdf

%.pdf: %.Rmd $(RMD_FILES)
	Rscript -e "bookdown::render_book('$<', 'bookdown::pdf_book')"
