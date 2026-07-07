#! /bin/bash
set -e

for i in *.tex;
    do
        lualatex "$i";
        lualatex "$i";
    done

mv *.pdf ..//
rm -f *.aux
rm -f *.bbl
rm -f *.bcf
rm -f *.blg
rm -f *.log
rm -f *.out
rm -f *.run.xml
rm -f *.toc