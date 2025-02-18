\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[2015/11/54 PhD thesis class for LaTeX]

\RequirePackage{xkeyval}

\DeclareOptionX{11pt}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{a4paper}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{twoside}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX{openright}{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOptionX*{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\ExecuteOptionsX{11pt,a4paper,twoside,openright}

\ProcessOptionsX
\LoadClass{memoir}







%-------------------------------------------------------------------------------
% Required packages
%-------------------------------------------------------------------------------

\PassOptionsToPackage{final}{graphicx}
\RequirePackage{xspace} % spaces in macros
\RequirePackage{xcolor}

%-------------------------------------------------------------------------------
% Math mode
%-------------------------------------------------------------------------------

\RequirePackage[fleqn]{mathtools}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage[makeroom]{cancel}

% allow page breaks in math mode
\allowdisplaybreaks

%-------------------------------------------------------------------------------
% Font setup
%-------------------------------------------------------------------------------

\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{csquotes}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[greek, british]{babel}     % British hypernation
\usepackage{textalpha}
\RequirePackage{tikz}
\defaultfontfeatures{Scale=MatchLowercase}
\setmainfont[Ligatures={Common, TeX}]{Linux Libertine O}

%\setmainfont[Ligatures={Common, TeX}]{Lora}
%\usepackage[T1]{fontenc}
%\setmainfont[Ligatures={Common, TeX}]{TeX Gyre Pagella}
%\setmathfont{TeX Gyre Pagella Math}
\setmathfont{Cambria Math}


\RequirePackage{microtype}
\microtypesetup{final, babel=true, factor=1200}

\RequirePackage{ifluatex}
\ifluatex
	\microtypesetup{tracking=true}
	
	% correct smallcaps
	\expandafter\def\expandafter\scshape\expandafter{\scshape\microtypesetup{tracking=false}}

	% disable ligatures in smallcaps
	\DisableLigatures[ff,ffi,fj,fi,th]{encoding = *, family = sc* }
\fi

% protrusion for superscript numbers
\SetProtrusion{encoding={*},family={bch},series={*},size={6,7}}
              {1={ ,750},2={ ,500},3={ ,500},4={ ,500},5={ ,500},
               6={ ,500},7={ ,600},8={ ,500},9={ ,500},0={ ,500}}

% double spacing
\RequirePackage{setspace}
\OnehalfSpacing
\setlength{\parindent}{1em} % paragraph indent
\setlength{\parskip}{0pt plus 0.1em} % stop parskip
\setlength{\mathindent}{\parindent} % set indent to paragraph indent

%-------------------------------------------------------------------------------
% Titles
%-------------------------------------------------------------------------------

% section numbers hanging into left margin
\hangsecnum
\chapterstyle{hangnum}

% fonts
\renewcommand*{\chaptitlefont}{\Huge\raggedright}
\setsecheadstyle{\LARGE\raggedright}
\setsubsecheadstyle{\Large\raggedright}
\setsubsubsecheadstyle{\large\raggedright}

%-------------------------------------------------------------------------------
% Page geometry
%-------------------------------------------------------------------------------

\RequirePackage{geometry}

\geometry{top=40mm, bottom=45mm, outer=40mm, inner=40mm,
		  marginparwidth=25mm, marginparsep=5mm, headsep=5mm,
		  footskip=15mm}
		  
\reversemarginpar

%-------------------------------------------------------------------------------
% Headers and footers
%-------------------------------------------------------------------------------

% headers
\nouppercaseheads
\createmark{chapter}{left}{nonumber}{}{}
\createmark{section}{right}{nonumber}{}{}

\newlength{\pagenumpadd}
\setlength{\pagenumpadd}{11pt}
\addtolength{\pagenumpadd}{5mm}

% plain style
\makeevenhead{plain}{\hspace{-\pagenumpadd}\makebox[\pagenumpadd]{\thepage}\textsc{\leftmark}}{}{}
\makeoddhead{plain}{}{}{\textsc{\rightmark}\makebox[\pagenumpadd]{\hfill\thepage}\hspace{-\pagenumpadd}}
\makeoddfoot{plain}{}{}{}
\makeevenfoot{plain}{}{}{}

% chapter style
\makepagestyle{chapter}
\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{\hspace{-\pagenumpadd}\makebox[\pagenumpadd]{\thepage}}{}{}
\makeoddhead{chapter}{}{}{\makebox[\pagenumpadd]{\hfill\thepage}\hspace{-\pagenumpadd}}

\pagestyle{plain}

%-------------------------------------------------------------------------------
% Table of contents
%-------------------------------------------------------------------------------

% font
\renewcommand*{\cftchapterfont}{\large}
\renewcommand*{\cftchapterpagefont}{\large}
\renewcommand{\cftchapterdotsep}{\cftdotsep}

% dot mark
\renewcommand{\cftdot}{.}

% section depth
\setsecnumdepth{subsubsection}
\maxtocdepth{subsubsection}

%-------------------------------------------------------------------------------
% Figures and captions
%-------------------------------------------------------------------------------

\RequirePackage[figuresright]{rotating} % rotated figures
\RequirePackage{array,booktabs} % more table options
\RequirePackage{multirow}
\DisemulatePackage{caption}
\RequirePackage{caption,subcaption}	% better (sub)caption controls

\DeclareCaptionSubType*{figure}
\DeclareCaptionSubType*{table}

% make floats appear quickly
\renewcommand{\floatpagefraction}{.1}

% make subfigures capital lettered
\renewcommand\thesubfigure{\Alph{subfigure}}
\makeatletter\renewcommand\p@subfigure{\thefigure}\makeatother

% setup captions
\captionsetup{indention=\parindent, labelfont={bf}, labelsep=quad}

% setup subcaptions
\captionsetup[subfigure]{labelformat=simple, labelsep=quad,
						 labelfont=bf, singlelinecheck=off,
						 justification=raggedright}
					
% \subcap for referring to subcaptions in the main caption
\newcommand{\subcap}[1]{\textbf{\protect\subref{#1}}\xspace}

%-------------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------------

\RequirePackage[backend=biber, bibencoding=utf8, useprefix=true,%
				uniquename=false, uniquelist=false, %
				style=authoryear, firstinits=true, dashed=false %
				maxcitenames=2, maxbibnames=99]{biblatex}
				
% bibliography paragraphs
\setlength{\bibhang}{\parindent}
\setlength{\bibitemsep}{\parskip}
\renewcommand*{\bibfont}{\raggedright}

% remove month
\AtEveryBibitem{\clearfield{month}}

% final and = &
\renewcommand*{\finalnamedelim}{%
  \ifnumgreater{\value{liststop}}{2}{\addcomma}{}%
  \addspace\&\space}
  
% no "In: "
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

% volume (number)
\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}%
  \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}}
\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}

% no page prefix
\DeclareFieldFormat{pages}{#1}

% all names last-first
\DeclareNameAlias{sortname}{last-first}
                               		
%-------------------------------------------------------------------------------
% Labels
%-------------------------------------------------------------------------------

\RequirePackage{hyperref}
\hypersetup{final, colorlinks, linkcolor=black, citecolor=black,
			urlcolor=black}
\urlstyle{same} % same font for hyperlinks

\RequirePackage[noabbrev]{cleveref}
\creflabelformat{equation}{#2#1#3}
\crefrangelabelformat{equation}{#3#1#4 to #5#2#6}
   
%-------------------------------------------------------------------------------
% Abbreviations
%-------------------------------------------------------------------------------
\usepackage[acronym, toc, nonumberlist, nomain]{glossaries}
   
%-------------------------------------------------------------------------------
% Sequences
%-------------------------------------------------------------------------------                      
                           
\RequirePackage{texshade}           
        
%-------------------------------------------------------------------------------
% Algorithms and roman numerals
%-------------------------------------------------------------------------------     
\usepackage{algpseudocode,algorithm,algorithmicx}
\newcommand*\Let[2]{\State #1 $\gets$ #2}
\algrenewcommand\algorithmicrequire{\textbf{Precondition:}}
\algrenewcommand\algorithmicensure{\textbf{Postcondition:}}
\def\rightarrowfill@@{\arrowfill@@\relax\relbar\rightarrow}
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}     
\makeatletter
\def\BState{\State\hskip-\ALG@thistlm}
\makeatother

\renewcommand{\algorithmicforall}{\textbf{for each}}
                               		
%-------------------------------------------------------------------------------
% Table of contents
%-------------------------------------------------------------------------------

\RequirePackage{ifthen}

\def\thedegree{Doctor of Philosophy}
\def\theuniversity{}
\def\theprimarysv{}
\def\thesecondarysv{}
\newcommand{\university}[1]{\def\theuniversity{#1}}
\newcommand{\degree}[1]{\def\thedegree{#1}}
\newcommand{\primarysupervisor}[1]{\def\theprimarysv{#1}}
\newcommand{\secondarysupervisor}[1]{\def\thesecondarysv{#1}}

%\renewcommand{\maketitle}[1]{%
%\begin{titlingpage*}%
%    \vspace*{\fill}%
%    \begin{center}%
%    \begin{minipage}{1.0\textwidth}%
%        {\HUGE\renewcommand{\baselinestretch}{2}\thetitle}\par%
%        \vspace{1.25cm}%
%        \emph{\LARGE\theauthor}\par%
%	    \vspace{1.25cm}%
%	    A thesis submitted in partial fulfilment of the\\requirements for the degree of:\par%
%	    \vspace{0.5cm}%
%	    {\LARGE\emph{\thedegree} \ifthenelse{\equal{\theuniversity}{}}{}{of\\[0.3cm]\emph{\theuniversity}}}\par%
%	    \vspace{0.5cm}%
%	    {\LARGE\the\year}\par%
%    	\vspace{2.5cm}%
%    	\ifthenelse{\equal{\theprimarysv}{}}{}{Primary supervisor:\\\emph{\theprimarysv}\par}%
%    	\ifthenelse{\equal{\thesecondarysv}{}}{}{\vspace{0.5cm}Secondary supervisor:\\\emph{\thesecondarysv}\par}%
%	\end{minipage}%
%    \end{center}%
%    \vspace*{\fill}%
%\end{titlingpage*}%
%\cleardoublepage%
%
%\thispagestyle{chapter}%
%\vspace*{\fill}%
%\begin{quote}
%    \textit{I, \theauthor, confirm that the work presented in this thesis
%is my own. Where information has been derived from other sources,
%I confirm that this has been indicated in the thesis.}
%\end{quote}%
%\vspace*{\stretch{2}}}
                               		
%-------------------------------------------------------------------------------
% Other preamble
%-------------------------------------------------------------------------------
%Avoids the problem of latex trying to fill a page vertically before a float (and leaving massive blank spaces between paragraphs)

\RequirePackage{pifont}% http://ctan.org/pkg/pifont
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%
\RequirePackage{fixltx2e}


\raggedbottom

%have greek letters in text mode
\RequirePackage{textgreek}
\RequirePackage{siunitx}
\DeclareSIUnit{\molar}{M}
\DeclareSIUnit{\unit}{U}
\RequirePackage[version=3]{mhchem}
%\usepackage{gensymb}
\renewenvironment{abstract}{\cleardoublepage\chapter*{Abstract}\itshape}{}
\newenvironment{acknowledgements}{\thispagestyle{chapter}\chapter*{Acknowledgements}\markboth{Acknowledgements}{}}{}

\let\savedtocdef\tableofcontents
\renewcommand{\tableofcontents}{\cleardoublepage\thispagestyle{chapter}\savedtocdef}

\let\savedtofdef\listoffigures
\renewcommand{\listoffigures}{\cleardoublepage\thispagestyle{chapter}\savedtofdef}

\let\savedtotdef\listoftables
\renewcommand{\listoftables}{\cleardoublepage\thispagestyle{chapter}\savedtotdef}

\endinput