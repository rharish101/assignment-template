% SPDX-FileCopyrightText: 2019 Harish Rajagopal <harish.rajagopals@gmail.com>
%
% SPDX-License-Identifier: MIT

% ======================================================================
% Assignment solution template by Harish Rajagopal
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solution}[2018/08/25 Assignment solution class]
\LoadClass[11pt,a4paper]{report}

% Add a new option "nobreak" for this class, which avoids page breaks between questions
\newcommand{\qbreak}{true}
\DeclareOption{nobreak}{\renewcommand{\qbreak}{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[margin=2.5cm]{geometry}  % For setting margins
\RequirePackage[gray]{xcolor}  % Make the document grayscale and define custom colors
\RequirePackage{fontspec}  % For setting default fonts, if available
\RequirePackage{unicode-math}  % For setting math fonts
\RequirePackage{ifthen}  % If-else in latex
\RequirePackage{minted}  % For code
\RequirePackage[plain]{algorithm}  % For the algorithm environment used in pseudocode
\RequirePackage{algpseudocode}  % For the default formatting used in pseudocode
\RequirePackage{environ}  % For custom math environments
\RequirePackage{mdframed}  % Boxes for custom math environments
\RequirePackage{tabulary}  % For custom auto-size columns in tables
\RequirePackage{booktabs}  % For customizing horizontal lines in tables
\RequirePackage{caption}  % For customizing caption spacing in tables
\RequirePackage{titling}  % For formatting the title
\RequirePackage{titlesec}  % For formatting sections, subsections, etc.
\RequirePackage{enumitem}  % Setting options for itemize and enumerate
\RequirePackage{hyperref}  % For coloring links and setting PDF info
\RequirePackage{nccmath}  % For the aligned environments used in custom math environments (NOTE: must be loaded after hyperref)

\setmainfont{TeX Gyre Pagella}
\setmathfont{TeX Gyre Pagella Math}
\setmonofont[Scale=0.85]{Fira Mono}
\linespread{1.1}


% ======================================================================
% Code Blocks
% ======================================================================

% Background color for code blocks
\definecolor{codegray}{gray}{0.95}

% Default style for minted
\setminted{
    autogobble,
    baselinestretch=1.0,
    breaklines,
    bgcolor=codegray,
    fontseries=l,
    frame=single,
    framerule=0pt,
    framesep=0.5mm,
    linenos,
    numbersep=0pt,
    xleftmargin=6mm,
}

% Change line numbering style for code blocks
\renewcommand{\theFancyVerbLine}
{
    \texttt{\textcolor[gray]{0.5}{\scriptsize{\arabic{FancyVerbLine}}}}
}

% Inline code
% Args:
%   #1: The custom options for the minted environment
%   #2: The programming language
\newenvironment{code}[2][]
{\VerbatimEnvironment\begin{minted}[#1]{#2}}
{\end{minted}}%chktex 31

% Code from a file
% Args:
%   #1: The custom options for the minted environment
%   #2: The programming language
%   #3: The input file path
\newcommand{\inputcode}[3][]{\inputminted[#1]{#2}{#3}}


% ======================================================================
% Pseudocode
% ======================================================================

% Custom formatting for pseudocode
\algrenewcommand{\alglinenumber}[1]{\small\upshape\ttfamily\hspace*{5mm}#1\hspace*{3mm}}
\renewcommand{\algorithmiccomment}[1]{\hfill// #1}

% Custom commands for pseudocode
\newcommand{\MyCall}[2]{\textsc{#1(}#2\textsc{)}}% chktex 9
\newcommand{\Null}{\textsc{Null}}

% Args:
%   #1: The name of the function
%   #2: The function's arguments
\newenvironment{pseudocode}[2]
{%
    \vspace{2mm}
    \ifthenelse{\equal{#1}{continue}}
        {\newpage}
        {\noindent{\textsc{#1} (\textit{#2})\par}}
    \vspace{-2mm}
    \noindent\rule{\textwidth}{0.7pt}
    \vspace{-5mm}
    \begin{algorithm}[H]
        \begin{algorithmic}[1]
            \slshape
}
{
        \end{algorithmic}
    \end{algorithm}
    \vspace{-10mm}
    \noindent\rule{\textwidth}{0.7pt}
    \vspace{-3mm}
}


% ======================================================================
% Math Box
% ======================================================================

% Allow equations across multiple pages
\allowdisplaybreaks%

% Formatting for math environments
\setlength{\jot}{2mm}  % line spacing in amsmath

% With equation numbering
% Args:
%   #1: The underlying amsmath environment to use (eg. align, gather)
\RenewEnviron{math}[1][gather]  % environ package used to avoid errors
{%
    \vspace{2mm}
    \begin{mdframed}%
    [
        linewidth=0.45pt,
        innerleftmargin=4mm,
        innertopmargin=-1mm,
        innerbottommargin=3mm,
        nobreak=false,
    ]%
        \small
        \begin{fleqn}
            \ifthenelse{\equal{#1}{align}}
                {\begin{align} \BODY \end{align}}
                {\begin{gather} \BODY \end{gather}}
        \end{fleqn}
    \end{mdframed}
    \vspace{1mm}
}

% Without equation numbering
% Args:
%   #1: The underlying amsmath environment to use (eg. align, gather)
\NewEnviron{math*}[1][gather]  % environ package used to avoid errors
{%
    \vspace{2mm}
    \begin{mdframed}%
    [
        linewidth=0.45pt,
        innerleftmargin=4mm,
        innertopmargin=-1mm,
        innerbottommargin=3mm,
        nobreak=false,
    ]%
        \small
        \begin{fleqn}
            \ifthenelse{\equal{#1}{align}}
                {\begin{align*} \BODY \end{align*}}
                {\begin{gather*} \BODY \end{gather*}}
        \end{fleqn}
    \end{mdframed}
    \vspace{1mm}
}


% ======================================================================
% Tables
% ======================================================================

% Patch for tabulary to have fixed width tables:
% https://tex.stackexchange.com/a/87111/147074
\makeatletter
\patchcmd\TY@checkmin%
{\def\TY@ratio{1}}
{%
    \@tempdima\dimexpr\p@*\TY@linewidth/\TY@tablewidth\relax
    \edef\TY@ratio{\strip@pt\@tempdima}%
}{}{}
\let\TY@@checkmin\TY@checkmin%
\makeatother

% Increase cell height
\renewcommand{\arraystretch}{1.3}

% Increase spacing between table and its caption
\captionsetup[table]{skip=2mm}


% ======================================================================
% Formatting
% ======================================================================

% Chapter is used for formatting the solution environment
\titleformat{\chapter}{\bfseries\Large}{}{0mm}{}
\titlespacing{\chapter}{0mm}{1mm}{1mm}

% For sections, subsections and subsubsections
\titleformat{\section}{\bfseries\large}{\thesection}{2mm}{}
\titlespacing{\section}{0mm}{1mm}{1mm}
\titleformat{\subsection}{\itshape}{\thesubsection}{2mm}{}% chktex 6
\titlespacing{\subsection}{0mm}{0mm}{0mm}
\titleformat{\subsubsection}{}{\thesubsubsection}{2mm}{}

% Lengths
\setlength{\voffset}{-2mm}
\setlength{\footskip}{35pt}
\setlength{\parindent}{8mm}
\setlength{\parskip}{2mm}

% Used for "solution" environment and "\maketitle" command
\newcommand{\centerrule}{\begin{center}\rule{45mm}{0.5pt}\end{center}}


% ======================================================================
% Miscellaneous
% ======================================================================

% Lists
\setlist[itemize,1]{leftmargin=0mm,rightmargin=-0.5mm}
\setlist[enumerate,1]{leftmargin=0mm,itemsep=-1mm}

% Problem Solution Environment
% Args:
%   #1: The title for the question
\newenvironment{solution}[1][Question \thechapter]
{
    % If page breaks after questions are disabled
    \ifthenelse{\equal{\qbreak}{false}}
        {\let\clearpage\relax}  % disable page break
        {
            % If the question is the first one
            \ifthenelse{\equal{\thechapter}{0}}
                {\let\clearpage\relax}  % disable page break
                {}
        }
    \chapter{#1:}
}
{\centerrule}


% ======================================================================
% Document Details
% ======================================================================

% Default author
\newcommand{\authorname}{Harish Rajagopal}
\newcommand{\authorid}{20-946-349}%chktex 8
\author{\authorname\\\authorid}

% Set details
% Args:
%   #1: The title for the document
%   #2: The course number
%   #3: The course title
%   #4: The name of the assignment
\newcommand{\setdetails}[4][Solution]
{%
    \newcommand{\SolutionName}{#1}
    \newcommand{\CourseNo}{#2}
    \newcommand{\CourseName}{#3}
    \newcommand{\AssignName}{#4}
    \hypersetup%
    {%
        colorlinks,
        pdfinfo={%
            Author={\authorname{} --- \authorid},
            Title={{\CourseNo}: {\AssignName} {\SolutionName}},
            Subject={Solution of {\AssignName} for {\CourseNo}: {\CourseName}}
        }
    }
}

% My Modified Title
\renewcommand{\maketitle}
{%
    \begin{center}
        {\huge \SolutionName}\\[+2mm]
        {\Large \CourseNo: \CourseName\\[+2mm] \AssignName}\\[+3mm]
        \begin{tabular}[t]{c}
            \large\theauthor%
        \end{tabular}\\[+3mm]
    \end{center}
    \centerrule\vspace{1mm}
}
