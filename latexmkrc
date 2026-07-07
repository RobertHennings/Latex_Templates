$pdf_mode = 5;
$bibtex_use = 2;

$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$biber = 'biber %O %B';

$max_repeat = 5;

$clean_ext .= ' %R.bbl %R.bcf %R.blg %R.fdb_latexmk %R.fls %R.run.xml %R.synctex.gz %R.toc %R.out %R.nav %R.snm %R.vrb';