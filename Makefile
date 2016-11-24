# Makefile

COMPILER=pdflatex
BIBCOMPILER=bibtex
MAINFILE=0_main
OUTPUT=manuscrit_these_HR
TEXFILE=$(addsuffix .tex,$(MAINFILE))
PDFFILE=$(addsuffix .pdf,$(OUTPUT))

all:

	$(COMPILER) -interaction=nonstopmode $(TEXFILE)
	$(BIBCOMPILER) $(MAINFILE)
	$(COMPILER) -interaction=nonstopmode $(TEXFILE)
	$(COMPILER) -interaction=nonstopmode $(TEXFILE)
	mv $(addsuffix .pdf,$(MAINFILE)) $(PDFFILE)

clean_pdf:
	find . -type f -name "*.acn" -delete
	find . -type f -name "*.acr" -delete
	find . -type f -name "*.alg" -delete
	find . -type f -name "*.aux" -delete
	find . -type f -name "*.glg" -delete
	find . -type f -name "*.glo" -delete
	find . -type f -name "*.gls" -delete
	find . -type f -name "*.glsdefs" -delete
	find . -type f -name "*.ist" -delete
	find . -type f -name "*.lof" -delete
	find . -type f -name "*.log" -delete
	find . -type f -name "*.nlo" -delete
	find . -type f -name "*.out" -delete
	find . -type f -name "*.toc" -delete

clean_biblio: clean_pdf
	find . -type f -name  *.bbl -delete
	find . -type f -name  *.blg -delete

mrproper: clean_biblio
