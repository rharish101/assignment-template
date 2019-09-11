% ======================================================================
% Assignment solution template by Harish Rajagopal
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solution}[2018/08/25 Assignment solution class]
\LoadClass[11pt,a4paper]{article}

% Add a new option "noroboto" for this class, which avoids using roboto
\newcommand{\useroboto}{true}
\DeclareOption{noroboto}{\renewcommand{\useroboto}{false}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[margin=2.5cm]{geometry}  % For setting margins
\RequirePackage[gray]{xcolor}  % Make the document grayscale and define custom colors
\RequirePackage{fontspec}  % For setting default fonts, if available
\RequirePackage{ifthen}  % If-else in latex
\RequirePackage{minted}  % For code
\RequirePackage[plain]{algorithm}  % For the algorithm environment used in pseudocode
\RequirePackage{algpseudocode}  % For the default formatting used in pseudocode
\RequirePackage[fleqn]{amsmath}  % For the align environment used in custom math environments
\RequirePackage{environ}  % For custom math environments
\RequirePackage{mdframed}  % Boxes for custom math environments
\RequirePackage{titlesec}  % For formatting sections, subsections, etc.
\RequirePackage{enumitem}  % Setting options for itemize and enumerate
\RequirePackage{tabularx}  % For custom auto-size columns in tables
\RequirePackage{booktabs}  % For good-looking horizontal lines in tables
\RequirePackage{hyperref}  % For coloring links and setting PDF info

\renewcommand{\familydefault}{\sfdefault}
\ifthenelse{\equal{\useroboto}{true}}
{%
    \RequirePackage[light]{roboto}
    \RequirePackage[light,scale=0.85]{roboto-mono}
}{}
\linespread{1.1}


% ======================================================================
% Code Blocks
% ======================================================================

% Background color for code blocks
\definecolor{codegray}{gray}{0.9}

% Inline code
\newenvironment{code}[1]
{%
    \VerbatimEnvironment%
    \renewcommand{\theFancyVerbLine}
    {
        \texttt{\textcolor[gray]{0.5}{\scriptsize{\arabic{FancyVerbLine}}}}
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
        breaklines,
    ]
    {#1}%
}
{
    \end{minted}%
    \vspace{-8mm}%
}

% Code from a file
\newcommand{\inputcode}[2]
{%
    \renewcommand{\theFancyVerbLine}
    {%
        \texttt{\textcolor[gray]{0.5}{\scriptsize{\arabic{FancyVerbLine}}}}
    }
    \inputminted%
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
        breaklines,
    ]%
    {#1}{#2}%
    \vspace{-8mm}%
}


% ======================================================================
% Pseudocode
% ======================================================================

% Custom formatting for pseudocode
\algrenewcommand{\alglinenumber}[1]{\small\upshape\ttfamily\hspace*{5mm}#1\hspace*{3mm}}
\renewcommand{\algorithmiccomment}[1]{\hfill// #1}

% Custom commands for pseudocode
\newcommand{\MyCall}[2]{\textsc{#1(}#2\textsc{)}}% chktex 9
\newcommand{\Null}{\textsc{Null}}

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

% With equation numbering
\RenewEnviron{math}  % environ package used to avoid errors
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{2mm}
    \begin{mdframed}%
    [
        linewidth=0.45pt,
        innerleftmargin=1mm,
        innertopmargin=-1mm,
        innerbottommargin=3mm,
    ]%
        \small
        \begin{align}
            \BODY
        \end{align}
    \end{mdframed}
    \vspace{1mm}
}

% Without equation numbering
\NewEnviron{math*}  % environ package used to avoid errors
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{2mm}
    \begin{mdframed}%
    [
        linewidth=0.45pt,
        innerleftmargin=1mm,
        innertopmargin=-1mm,
        innerbottommargin=3mm,
    ]%
        \small
        \begin{align*}
            \BODY
        \end{align*}
    \end{mdframed}
    \vspace{1mm}
}


% ======================================================================
% Tables
% ======================================================================

% Vertically align tabularx columns
\renewcommand{\tabularxcolumn}[1]{m{#1}}

% Columns for horizontal alignment
% NOTE: To be used only in tabularx
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

% Remove separation before and after horizontal lines in a table
\aboverulesep=0ex
\belowrulesep=0ex

% Increase cell height
\renewcommand{\arraystretch}{1.3}


% ======================================================================
% Formatting
% ======================================================================

% For sections, subsections and subsubsections
\titleformat{\section}{\vspace{-3mm}\large}{\thesection}{2mm}{\underline}[\vspace{-2mm}]
\titleformat{\subsection}{\itshape}{\thesubsection}{2mm}{}[\vspace{-2mm}]% chktex 6
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
\newcounter{SolutionCount}
\newenvironment{solution}[1][Question \arabic{SolutionCount}]
{
    \ifthenelse{\equal{\arabic{SolutionCount}}{0}}
        {}{\newpage}
    \stepcounter{SolutionCount}
    \noindent\textbf{\Large #1:}\par
}
{\centerrule}


% ======================================================================
% Document Details
% ======================================================================

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
