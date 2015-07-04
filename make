FILE = modelo

.PHONY: default
default: main clean

.PHONY: main
main:
	pdflatex $(FILE).tex
	bibtex $(FILE).aux
	makeindex $(FILE).nlo -s nomencl.ist -o $(FILE).nls
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex

.PHONY: clean
clean:
	rm -f *.aux **/*.aux *.bak *.bbl *.blg *.dvi *.ilg *.lof *.log *.lot *.nlo *.out *.toc

.PHONY: open
open: main clean
	open $(FILE).pdf
