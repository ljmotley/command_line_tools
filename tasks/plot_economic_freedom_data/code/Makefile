SHELL=bash

all: ../output/freedom_plot.png

../output/freedom_plot.png: freedom_plot.R ../input/freedom_data.csv | ../output
	Rscript $<

../input/freedom_data.csv: ../../clean_economic_freedom_data/output/freedom_data.csv | ../input
	ln -sf $< $@

../input:
	mkdir $@
../output:
	mkdir $@
