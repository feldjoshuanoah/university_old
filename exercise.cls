\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercise}

\input{common.tex}

\titleformat{\subsection}[runin]{\sffamily\bfseries}{\thesubsection.}{1mm}{}[.\quad]

\setenumerate{label=\alph*)}
\setlist[enumerate,2]{label=(\roman*)}

\RequirePackage{ntheorem}
\theoremstyle{empty}
\theorembodyfont{\normalfont}
\newmdtheoremenv[ntheorem]{problem}{}

\endinput
