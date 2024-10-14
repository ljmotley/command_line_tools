#!/bin/bash
#This script allow you to review hardcoded numbers appearing in the manuscript

for file in $(find ../sections -name '*.tex')
do
	echo '===' ${file} '==='
	cat ${file} | 
	sed '/begin{equation}/,/end{equation}/d' | sed '/begin{equation\*}/,/end{equation\*}/d' | sed '/begin{align}/,/end{align}/d' | sed '/begin{align\*}/,/end{align\*}/d' | #Remove equation environments
	sed 's/\\input{[A-Za-z0-9_\/\.]*}//g' | # Drop input files that might contain numbers
	grep -v 'includegraphics' | #Drop lines that are graphics filepaths or numbers setting the figure size
	sed 's/[0-9\.]*\\textwidth//g' | sed 's/[0-9\.]*\\textheight//g' |
	sed 's/\$[A-Za-z0-9+=_{}\ ]*\$//g' |  #Drop inline equations that may contain numbers
	sed 's/\\cite[p]*{[A-Za-z0-9:,\-]*}//g' | #Drop citations with \cite{} that may contain numbers
	sed 's/\\citealt{[A-Za-z0-9:\-]*}//g' |  #Drop citations with \citealt{} that may contain numbers
	sed 's/\\citep\[[0-9p\.]*\]{[A-Za-z0-9:\-]*}//g' |  #Drop citations with \citep{} that may contain numbers
	sed 's/\\citet\[[0-9p\.]*\]{[A-Za-z0-9:\-]*}//g' |  #Drop citations with \citet{} that may contain numbers
	sed 's/\itemsep[0-9]*//' | grep -v 'vspace{' | sed 's/only<[0-9]>//g' | sed 's/visible<[0-9]>//g' | # Drop visual layout tweaks that contain numbers
	grep -v 'hypertarget' | grep -v 'hyperlink' | #Drop links that may contain numbers
	grep '[0-9]'
done
