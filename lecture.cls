\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture}

\input{common.tex}

\titleformat{\subsection}{\large\sffamily\bfseries}{}{1em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries}{}{1em}{}

\RequirePackage{amsthm}
\newtheoremstyle{custom}{0}{}{\upshape}{}{\bfseries\sffamily}{.}{ }{}
\theoremstyle{custom}
\newmdtheoremenv{corollary}{\ifenglish{Corollary}\else{Korollar}\fi}
\newmdtheoremenv{definition}{Definition}
\newtheorem{example}{\ifenglish{Example}\else{Beispiel}\fi}
\newmdtheoremenv{theorem}{Theorem}
\newmdtheoremenv{lemma}{Lemma}
\newmdtheoremenv{problem}{Problem}
\newmdtheoremenv{remark}{\ifenglish{Remark}\else{Bemerkung}\fi}
\newmdtheoremenv{calcrule}{\ifenglish{Rule}\else{Regel}\fi}

\RequirePackage{etoolbox}
\AtBeginEnvironment{corollary}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{definition}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{example}{\setlist[enumerate]{label={\arabic*)}}}
\AtBeginEnvironment{theorem}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{lemma}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{lemma}{\setlist[enumerate,2]{label={\alph*)}}}
\AtBeginEnvironment{problem}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{remark}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{calcrule}{\setlist[enumerate]{label={(\roman*)}}}
\AtBeginEnvironment{proof}{\setlist[enumerate]{label={(\roman*)}}}
