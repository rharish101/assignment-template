# Assignment Solution Template

This repository contains my template for assignment submissions.
This template is intended to be used with XeLaTeX.

## Features
* `code` environment: For writing code.
  It takes one argument for language.
  It uses the `minted` environment inside it.

* `pseudocode` environment: For writing pseudocode of functions.
  It takes two arguments: the first is the name of the function, while the second is the list of arguments.
  It uses the `algorithmic` environment from the `algpseudocode` package inside it.

  Additionally, for functions spanning pages, two environments can be used, with the first argument for the second environment as "continue" (the second is ignored).

* `math` environment: For writing math equations.
  It uses the `align` environment inside it.

  It takes one optional argument, which is used for math spanning pages.
  For math spanning pages, two environments can be used, with the first argument for the second environment as "lower".

  For omitting numbering of equations (like the `align*` enviroment), use the `math*` environment.

* `solution` environment: For writing solutions to individual questions.
  It takes one optional argument for the question name.
  At the start of a `solution` environment (except for the first one), a `\newpage` command is inserted, so that solutions to different questions start on new pages.

* New columns for tables: `L`, `C`, `R` are provided for left, center and right horizontal alignment with centered vertical alignment.

* `\setdetails` command: For setting details used in the overriden `\maketitle` command.
  It takes 3 compulsory arguments and an optional argument.

  The first argument is for the course number.
  The second argument is for the course name.
  The third argument is for the name of the assignment (like "Assignment 1").

  The optional argument states the type of assignment (by default "Solution").

## Fonts
I use the following fonts, and if installed, the solution class picks it up.
* Roboto Light
* Roboto Mono Light (or one of Roboto Mono Light for Powerline and RobotoMono Nerd Font)
