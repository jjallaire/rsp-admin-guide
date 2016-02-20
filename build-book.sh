#! /usr/bin/env Rscript

# ensure that devtools is installed
if (!require("devtools"))
  install.packages("devtools", repos = "https://cran.rstudio.com")

# ensure that the latest bookdown and dependencies are installed
devtools::install_github("rstudio/bookdown")

# remove existing _book
unlink('_book', recursive = TRUE)

# render html and pdf versions
bookdown::render_book('index.Rmd', 'bookdown::gitbook')
bookdown::render_book('index.Rmd', 'bookdown::pdf_book')

# copy pdf to root directory
pdf <- list.files(path = '_book',
                  pattern = glob2rx("rstudio-server-pro-*.pdf"),
                  full.names = TRUE)
file.copy(pdf, ".")

