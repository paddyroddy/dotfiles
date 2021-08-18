# https://mg.readthedocs.io/latexmk.html
case "$OSTYPE" in
darwin*)
    $pdf_previewer = 'open -a Skim';
    $pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
    @generated_exts = (@generated_exts, 'synctex.gz');
    ;;
linux*)
    $dvi_previewer = 'start xdvi -watchfile 1.5';
    $ps_previewer  = 'start gv --watch';
    $pdf_previewer = 'start evince';
    ;;
esac


