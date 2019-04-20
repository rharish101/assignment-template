% ======================================================================
% Assignment solution template by Harish Rajagopal
% ======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solution}[2018/08/25 Assignment solution class]
\LoadClass[11pt]{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage{anyfontsize}
\RequirePackage{environ}
\RequirePackage[gray]{xcolor}
\RequirePackage{minted}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage{mdframed}
\RequirePackage{ifthen}
\RequirePackage{array,multirow,booktabs,longtable}
\RequirePackage{fontspec}
\RequirePackage{algpseudocode}
\RequirePackage[plain]{algorithm}
\RequirePackage{fullwidth}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{pgffor}

\renewcommand{\familydefault}{\sfdefault}
% Set default fonts, if they exist
\IfFontExistsTF{Roboto Light}{\setsansfont{Roboto Light}}{}
% Iterate over possible Roboto Mono fonts to see which exists
\def\robomonolist{
    RobotoMono Nerd Font,
    Roboto Mono Light for Powerline,
    Roboto Mono Light
}
\foreach \robomonofont in \robomonolist% chktex 1
{%
    \IfFontExistsTF{\robomonofont}
    {%
        \setmonofont[Scale=0.8]{\robomonofont}
        \breakforeach%
    }{}
}
\setmonofont[Scale=0.8]{RobotoMono Nerd Font}
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
            baselinestretch=0.9,
            fontseries=l,
            frame=single,
            framerule=0pt,
            framesep=0.5mm,
            linenos,
            numbersep=3mm,
            xleftmargin=1.3cm,
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
\NewEnviron{pseudocode}[2]
{%
    \ifthenelse{\equal{#1}{continue}}
        {\newpage}
    \noindent{\textsc{#1} (\textit{#2})\par}
    \vspace{-7mm}
    \begin{flushleft}\rule{16.59cm}{0.7pt}\end{flushleft}
    \vspace{-9mm}
    \begin{fullwidth}[width=\linewidth-12mm,leftmargin=0cm,rightmargin=1cm]
        \begin{algorithm}[H]
            \begin{algorithmic}[1]
                \fontsize{11}{15}\selectfont\slshape\BODY%
            \end{algorithmic}
        \end{algorithm}
    \end{fullwidth}
    \vspace{-9mm}
    \begin{flushleft}\rule{16.59cm}{0.7pt}\end{flushleft}
    \vspace{-2mm}
}

% Math box
\RenewEnviron{math}[1][normal]
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{+7mm}
    \ifthenelse{\equal{#1}{lower}}
        {\newmdenv[topline=false]{myframe}}
        {\newmdenv[topline=true,bottomline=true]{myframe}}
    \begin{myframe}[userdefinedwidth=16.6cm,linewidth=0.45pt,leftmargin=0mm,innerleftmargin=1mm,innertopmargin=1mm,innerbottommargin=1mm]
    {%
        \begin{minipage}[c]{15.55cm}
            \vspace{-2mm}
            {\small
            \begin{align}
                \BODY
            \end{align}
            }%
            \vspace{-3mm}
        \end{minipage}
        \vspace{-1mm}
    }
    \end{myframe}
    \vspace{+3mm}
}
% Without numbering
\NewEnviron{math*}[1][normal]
{%
    \setlength{\mathindent}{3mm}
    \setlength{\jot}{2mm}
    \vspace{+7mm}
    \ifthenelse{\equal{#1}{lower}}
        {\newmdenv[topline=false]{myframe}}
        {\newmdenv[topline=true,bottomline=true]{myframe}}
    \begin{myframe}[userdefinedwidth=16.6cm,linewidth=0.45pt,leftmargin=0mm,innerleftmargin=1mm,innertopmargin=1mm,innerbottommargin=1mm]
    {%
        \begin{minipage}[c]{15.55cm}
            \vspace{-2mm}
            {\small
            \begin{align*}
                \BODY
            \end{align*}
            }%
            \vspace{-3mm}
        \end{minipage}
        \vspace{-1mm}
    }
    \end{myframe}
    \vspace{+3mm}
}

% Unordered Lists
\let\olditemize\itemize%
\let\endolditemize\enditemize%
\RenewEnviron{itemize}
{%
    \vspace{-4mm}
    \olditemize[leftmargin=0mm,rightmargin=-0.5mm]
        \BODY%
    \endolditemize%
    \vspace{-3mm}
}

% Ordered Lists
\let\oldenumerate\enumerate%
\let\endoldenumerate\endenumerate%
\RenewEnviron{enumerate}
{%
    \vspace{-4mm}
    \oldenumerate[leftmargin=0mm]
        \setlength{\itemsep}{-0.5mm}
        \BODY%
    \endoldenumerate%
    \vspace{-3mm}
}

% Used for "solution" environment and "\maketitle" command
\newcommand{\centerrule}{\begin{center}\rule{45mm}{0.5pt}\end{center}}

% Problem Solution Environment
\newcounter{SolutionCount}
\newenvironment{solution}[1][Question \arabic{SolutionCount}]
{
    \ifthenelse{\equal{\arabic{SolutionCount}}{0}}{}{\newpage}
    \stepcounter{SolutionCount}
    \noindent\textbf{\fontsize{14}{17}\selectfont #1:}\par
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
