\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercise}

\input{common.tex}

\pretocmd{\section}{%
	\ifnum\value{section}=0 \else\clearpage\fi
	\stepcounter{section}
}{}{}

\titleformat{\subsection}[runin]{\sffamily\bfseries}{\thesubsection.}{1mm}{}[.\quad]

\setenumerate{label=\alph*)}
\setlist[enumerate,2]{label=(\roman*)}

\RequirePackage{ntheorem}
\theoremstyle{empty}
\theorembodyfont{\normalfont}
\newmdtheoremenv[ntheorem]{problem}{}

\endinput
