#-------------------------------------------------------------------------------
# Makefile to compile cv and cover letter
# author: Marcus Albertsson @arubertoson
# paths slightly updated by @bergmul
#-------------------------------------------------------------------------------

CC = latexmk

OUTPUT_DIR = out
OUTPUT_NAME = $@

.PHONY: resume letter clean

default: resume letter clean

cv: cv.tex
	$(CC) -xelatex -output-directory=$(OUTPUT_DIR) -jobname=$(OUTPUT_NAME) $<

letter: letter.tex
	$(CC) -xelatex -output-directory=$(OUTPUT_DIR) -jobname=$(OUTPUT_NAME) $<

clean:
	latexmk -C
	@rm -rf compile
	@rm -rf *.log
