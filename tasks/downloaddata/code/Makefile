SHELL=bash

all: ../output/efotw-2023-master-index-data-for-researchers-iso.xlsx

# Download Economic Freedom of the World data
../output/efotw-2023-master-index-data-for-researchers-iso.xlsx: ../output
	wget -O $@ https://www.fraserinstitute.org/sites/all/modules/custom/ftw_maps_pages/files/efotw-2023-master-index-data-for-researchers-iso.xlsx

../output:
	mkdir $@
