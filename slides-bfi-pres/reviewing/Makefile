SHELL=bash

all: repeatedwords labelsreferenced acronyms_usedanddefined

hardcodednumbers: hardcodednumbers.sh
	bash $<

repeatedwords:
	egrep "(\b[a-zA-Z]+) \1\b" ../sections/*.tex -n

labelsreferenced:
	diff --side-by-side --suppress-common-lines <(grep -o --no-filename 'ref{[A-Za-z0-9:_]*}' ../sections/*.tex | sed 's/ref//' | sort | uniq) <(grep -o --no-filename 'label{[A-Za-z0-9:_]*}' ../sections/*.tex | sed 's/label//' | sort | uniq)

acronyms_usedanddefined:
	diff --side-by-side --suppress-common-lines  <(grep -o --no-filename -E ' \(+[A-Z]+[A-Z]+\)' ../sections/*.tex | sort | uniq | sed 's/[()]//g' | sed 's/ //g') <(grep --no-filename -v '^%' ../sections/*.tex | sed 's/\.\.\/input\/[A-Za-z0-9_]*//' | grep -o -E ' [A-Z]+[A-Z]+ ' | sort | uniq | sed 's/ //g')

hyperlinksandtargets:
	diff --side-by-side --suppress-common-lines <(grep -o --no-filename 'hyperlink{[A-Za-z0-9:_]*}' ../sections/*.tex | sed 's/hyperlink//' | sort | uniq) <(grep -o --no-filename 'hypertarget{[A-Za-z0-9:_]*}' ../sections/*.tex | sed 's/hypertarget//' | sort | uniq)
