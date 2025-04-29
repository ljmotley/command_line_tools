SHELL=bash

all: ../output/freedom_data.csv

../output/freedom_data.csv: freedom_data.R ../input/efotw-2023-master-index-data-for-researchers-iso.xlsx | ../output
	Rscript $<

../input/efotw-2023-master-index-data-for-researchers-iso.xlsx: ../../downloaddata/output/efotw-2023-master-index-data-for-researchers-iso.xlsx | ../input
	ln -sf $< $@

../input:
	mkdir $@
../output:
	mkdir $@

