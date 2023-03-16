# This .latexmkrc file is used to configure LaTeXmk, a tool for automating the
# compilation of LaTeX documents.

# Run pdflatex with the "-interaction=nonstopmode" option
# tee %B.err command pipes the output of pdflatex to both the console and a file with the same name as the LaTeX 
# source file but with the extension .err. This file will contain all of the warnings and messages generated during # the compilation, which can be useful for debugging.
$pdflatex = 'pdflatex %O -interaction=nonstopmode %S | tee %B.err';


# Clean up intermediate files after a successful compilation.
$clean_ext = 'aux bbl blg idx ilg ind lof log lot out toc synctex.gz';

# Enable continuous mode
$compiling = 1;

# LaTeX will run indefinitely if it has to rerun pdflatex
$max_repeat = 0;