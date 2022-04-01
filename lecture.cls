\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture}

\input{common.tex}

\titleformat{\subsection}{\large\sffamily\bfseries}{}{1em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries}{}{1em}{}

\RequirePackage{amsthm}
\newtheoremstyle{custom}{0}{}{\upshape}{}{\bfseries\sffamily}{.}{ }{}
\theoremstyle{custom}
\newmdtheoremenv{definition}{Definition}
\newtheorem{example}{Beispiel}
\newmdtheoremenv{theorem}{Theorem}
\newmdtheoremenv{lemma}{Lemma}
\newmdtheoremenv{remark}{Bemerkung}
\newmdtheoremenv{corollary}{Korollar}

\RequirePackage{etoolbox}
\AtBeginEnvironment{definition}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{example}{\setlist[enumerate]{label={\arabic*)}}}
\AtBeginEnvironment{theorem}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{lemma}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{remark}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{proof}{\setlist[enumerate]{label={(\roman*)}}}
