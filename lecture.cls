\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture}

\input{common.tex}

\titleformat{\subsection}{\large\sffamily\bfseries}{}{1em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries}{}{1em}{}

\RequirePackage{amsthm}
\newtheoremstyle{custom}{0}{}{\upshape}{}{\bfseries\sffamily}{.}{ }{}
\theoremstyle{custom}
\newmdtheoremenv{corollary}{Korollar}
\newmdtheoremenv{definition}{Definition}
\newtheorem{example}{Beispiel}
\newmdtheoremenv{theorem}{Theorem}
\newmdtheoremenv{lemma}{Lemma}
\newmdtheoremenv{problem}{Problem}
\newmdtheoremenv{remark}{Bemerkung}
\newmdtheoremenv{calcrule}{Regel}

\RequirePackage{etoolbox}
\AtBeginEnvironment{corollary}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{definition}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{example}{\setlist[enumerate]{label={\arabic*)}}}
\AtBeginEnvironment{theorem}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{lemma}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{problem}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{remark}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{calcrule}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{proof}{\setlist[enumerate]{label={(\roman*)}}}
