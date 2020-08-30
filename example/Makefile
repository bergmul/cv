CC = latexmk

OUTPUT_DIR = output
OUTPUT_NAME = example_$@_`date +%m-%Y`

.PHONY: resume letter clean

default: resume letter clean

resume: resume.tex
	$(CC) -xelatex -output-directory=$(OUTPUT_DIR) -jobname=$(OUTPUT_NAME) $<

letter: cover_letter.tex
	$(CC) -xelatex -output-directory=$(OUTPUT_DIR) -jobname=$(OUTPUT_NAME) $<

clean:
	latexmk -C
	@rm -rf compile
	@rm -rf *.log
