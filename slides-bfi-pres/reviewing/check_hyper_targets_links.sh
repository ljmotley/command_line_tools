cd ../
grep '\\input{' slides.tex | grep -v '%.*\\input' | sed 's/^.*\\input{\(.*\.tex\).*/\1/' | xargs grep 'hypertarget' --no-filename | grep -v '^%' | sed 's/\\hypertarget{//' | sed 's/}{}//' | sed 's/^[[:space:]]*//' | sort > reviewing/targets.txt
grep '\\input{' slides.tex | grep -v '%.*\\input' | sed 's/^.*\\input{\(.*\.tex\).*/\1/' | xargs grep 'hyperlink' --no-filename | grep -v '^%' | grep -o 'hyperlink{[A-Za-z0-9:]*}' --no-filename | sed 's/^hyperlink{//' | sed 's/}$//' | sort | uniq > reviewing/links.txt
cd reviewing
diff -y --suppress-common-lines links.txt targets.txt 
rm links.txt targets.txt
