FILE = modelo

.PHONY: default
default: main clean

.PHONY: main
main:
	pdflatex $(FILE).tex
	bibtex $(FILE).aux
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex

.PHONY: clean
clean:
	rm -f *.aux **/*.aux *.bak *.bbl *.blg *.dvi *.ilg *.lof *.log *.lot  *.out *.toc

.PHONY: open
open: main clean
	open $(FILE).pdf
