% ======================================================================
% Assignment solution template by Harish Rajagopal
% ======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solution}[2018/08/25 Assignment solution class]
\LoadClass[11pt,a4paper]{article}

\newcommand{\useroboto}{true}
\DeclareOption{noroboto}{\renewcommand{\useroboto}{false}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[margin=2.5cm]{geometry}  % For setting margins
\RequirePackage{environ}  % For custom math environments
\RequirePackage[gray]{xcolor}  % Make the document grayscale and define custom colors
\RequirePackage{minted}  % For code
\RequirePackage[fleqn]{amsmath}  % For the align environment used in custom math environments
\RequirePackage{enumitem}  % Setting options for itemize and enumerate
\RequirePackage{mdframed}  % Boxes for custom math environments
\RequirePackage{ifthen}  % If-else in latex
\RequirePackage{array,multirow,booktabs,longtable}  % For tabular environments
\RequirePackage{fontspec}  % For setting default fonts, if available
\RequirePackage[plain]{algorithm}  % For the algorithm environment used in pseudocode
\RequirePackage{algpseudocode}  % For the default formatting used in pseudocode
\RequirePackage{fullwidth}  % Set width and left-right margins on pseudocode
\RequirePackage{hyperref}  % For coloring links and setting PDF info
\RequirePackage{titlesec}  % For formatting sections, subsections, etc.
\RequirePackage{pgffor}  % foreach loop in latex

\renewcommand{\familydefault}{\sfdefault}
\ifthenelse{\equal{\useroboto}{true}}
{%
    \RequirePackage[light]{roboto}
    \RequirePackage[light,scale=0.85]{roboto-mono}
}{}
\linespread{1.1}

% Code Blocks
\newenvironment{code}[1]
{%
    \VerbatimEnvironment%
    \definecolor{codegray}{gray}{0.9}
    \noindent\begin{minipage}{16.6cm}
        \renewcommand{\theFancyVerbLine}
        {
            \ttfamily\textcolor[gray]{0.5}
            {\scriptsize{\arabic{FancyVerbLine}}}
        }
        \begin{minted}
        [
            bgcolor=codegray,
            baselinestretch=1.0,
            fontseries=l,
            frame=single,
            framerule=0pt,
            framesep=0.5mm,
            linenos,
            numbersep=1mm,
            xleftmargin=9mm,
            autogobble,
        ]
        {#1}%
}
{
    \end{minted}%
    \end{minipage}%
}

% Pseudocode
\algrenewcommand\alglinenumber[1]{\small\upshape\ttfamily#1\hspace*{2mm}}
\renewcommand{\algorithmiccomment}[1]{\hfill// #1}
\newcommand{\MyCall}[2]{\textsc{#1(}#2\textsc{)}}% chktex 9
\newcommand{\Null}{\textsc{Null}}
\newenvironment{pseudocode}[2]
{%
    \ifthenelse{\equal{#1}{continue}}
        {\newpage}
        {\noindent{\textsc{#1} (\textit{#2})\par}}
    \vspace{-12mm}
    \begin{flushleft}\rule{16.59cm}{0.7pt}\end{flushleft}
    \vspace{-10mm}
    \begin{fullwidth}[width=\linewidth-12mm,leftmargin=0cm,rightmargin=1cm]
        \begin{algorithm}[H]
            \begin{algorithmic}[1]
                \slshape
}
{
            \end{algorithmic}
        \end{algorithm}
    \end{fullwidth}
    \vspace{-15mm}
    \begin{flushleft}\rule{16.59cm}{0.7pt}\end{flushleft}
    \vspace{-2mm}
}

% Math box
\RenewEnviron{math}[1][normal]  % environ package used to avoid errors
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{+7mm}
    \ifthenelse{\equal{#1}{lower}}
        {\newmdenv[topline=false]{myframe}}
        {\newmdenv[topline=true,bottomline=true]{myframe}}
    \begin{myframe}[userdefinedwidth=16.6cm,linewidth=0.45pt,leftmargin=0mm,innerleftmargin=1mm,innertopmargin=1mm,innerbottommargin=1mm]
        \begin{minipage}[c]{15.55cm}
            \vspace{-2mm}
            \small
            \begin{align}
                \BODY
            \end{align}
            \vspace{-3mm}
        \end{minipage}
        \vspace{-1mm}
    \end{myframe}
    \vspace{+3mm}
}
% Without numbering
\NewEnviron{math*}[1][normal]  % environ package used to avoid errors
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{+7mm}
    \ifthenelse{\equal{#1}{lower}}
        {\newmdenv[topline=false]{myframe}}
        {\newmdenv[topline=true,bottomline=true]{myframe}}
    \begin{myframe}[userdefinedwidth=16.6cm,linewidth=0.45pt,leftmargin=0mm,innerleftmargin=1mm,innertopmargin=1mm,innerbottommargin=1mm]
        \begin{minipage}[c]{15.55cm}
            \vspace{-2mm}
            \small
            \begin{align*}
                \BODY
            \end{align*}
            \vspace{-3mm}
        \end{minipage}
        \vspace{-1mm}
    \end{myframe}
    \vspace{+3mm}
}

% Lists
\setlist[itemize,1]{leftmargin=0mm,rightmargin=-0.5mm}
\setlist[enumerate,1]{leftmargin=0mm,itemsep=-1mm}

% Used for "solution" environment and "\maketitle" command
\newcommand{\centerrule}{\begin{center}\rule{45mm}{0.5pt}\end{center}}

% Problem Solution Environment
\newcounter{SolutionCount}
\newenvironment{solution}[1][Question \arabic{SolutionCount}]
{
    \ifthenelse{\equal{\arabic{SolutionCount}}{0}}{}{\newpage}
    \stepcounter{SolutionCount}
    \noindent\textbf{\Large #1:}\par
}
{\centerrule}

% For tabular environment
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}
\aboverulesep=0ex
\belowrulesep=0ex
\renewcommand{\arraystretch}{1.3}

% For sections, subsections and subsubsections
\titleformat{\section}{\vspace{-3mm}\large}{\thesection}{2mm}{\underline}[\vspace{-2mm}]
\titleformat{\subsection}{\itshape}{\thesubsection}{2mm}{}[\vspace{-2mm}]% chktex 6
\titleformat{\subsubsection}{}{\thesubsubsection}{2mm}{}

% Lengths
\setlength{\voffset}{-2mm}
\setlength{\footskip}{35pt}
\setlength{\parindent}{8mm}
\setlength{\parskip}{2mm}

% Default author
\author{%
    Harish Rajagopal\\
    160552
}

% Set details
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
            Author={Harish Rajagopal --- 160552},
            Title={{\CourseNo}: {\AssignName} {\SolutionName}},
            Subject={Solution of {\AssignName} for {\CourseNo}: {\CourseName}}
        }
    }
}

% My Modified Title
\renewcommand{\maketitle}
{%
    \begin{center}
        \rmfamily
        {\huge \SolutionName}\\[+2mm]
        {\Large \CourseNo: \CourseName\\[+2mm]
                \AssignName}\\[+3mm]
        \makeatletter
        {%
            \large
            \begin{tabular}[t]{c}
                \@author%
            \end{tabular}
        }
        \makeatother\\[+3mm]
    \end{center}
    \centerrule\vspace{1mm}
}
