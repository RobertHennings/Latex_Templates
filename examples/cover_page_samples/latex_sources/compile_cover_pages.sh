#! /bin/bash
set -e

# first run

for i in *.tex;
    do
        if [ "$i" != "abstract.tex" ] ; then
            lualatex "$i";
        fi;
    done

# second run

for i in *.tex;
    do
        if [ "$i" != "abstract.tex" ] ; then
            lualatex "$i";
        fi;
    done

# clean up

# mkdir pdffiles
# mv *.pdf pdffiles
mv *.pdf ..//
rm -f *.aux
rm -f *.bcf
# rm -f *.gz
rm -f *.html
rm -f *.log
rm -f *.out
rm -f *.run.xml
rm -f *.toc