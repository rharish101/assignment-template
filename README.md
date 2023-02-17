<!--
SPDX-FileCopyrightText: 2019 Harish Rajagopal <harish.rajagopals@gmail.com>

SPDX-License-Identifier: MIT
-->

# Assignment Solution Template

This repository contains my template for assignment submissions.

## Features
* `code` environment: For writing code.
  It takes one argument for language.
  It uses the `minted` environment inside it.
  It supports breaking across pages.

  The `inputcode` command can be used to input code from a file.
  It takes two arguments: the first is the language, while the second is the path to the input file.

* `pseudocode` environment: For writing pseudocode of functions.
  It takes two arguments: the first is the name of the function, while the second is the list of arguments.
  It uses the `algorithmic` environment from the `algpseudocode` package inside it.

  It does not support breaking across pages.
  Thus, for functions spanning pages, two environments can be used, with the first argument for the second environment as "continue" (the second is ignored).
  For consistent line numbering across two environments breaking across pages, use the `algstore` and `algrestore` commands.

* `math` environment: For writing math equations.
  It uses either the `align` (by default) or the `gather` amsmath environment inside it.
  It takes one optional argument, which is the choice of the underlying amsmath environment.
  It supports breaking across pages.
  For omitting numbering of equations (like the `align*` or `gather*` enviroments), use the `math*` environment (with the same arguments as for `math`).

* New columns for tables: `L`, `C`, `R` are provided for left, center and right horizontal alignment with centered vertical alignment.
  These are auto-sizing columns to be used with the `tabularx` environment.

  For tables spanning multiple pages, use the `ltablex` environment (not included in the class), with the `keepXColumns` argument (to preserve tabularx's column behaviour).

* `solution` environment: For writing solutions to individual questions.
  It takes one optional argument for the title of the question.
  At the start of a `solution` environment (except for the first one), a `\newpage` command is inserted, so that solutions to different questions start on new pages.

* `\setdetails` command: For setting details used in the overriden `\maketitle` command.
  It takes 3 compulsory arguments and an optional argument.

  The first argument is for the course number.
  The second argument is for the course title.
  The third argument is for the name of the assignment (like "Assignment 1").

  The optional argument sets the title of the document (by default "Solution").

## Compiling
This template is intended to be used with LuaLaTeX.
Since the template uses the `minted` package for code blocks, the `-shell-escape` argument is required for compilation.

A `.latexmkrc` file is provided in the root of this repository for the default configuration.

To compile, run:
```sh
make
```

To clean-up extra files generated during compilation, run:
```sh
make clean
```

To clean-up all files generated during compilation (including the PDFs), run:
```sh
make clean-all
```

## Licenses
This repository uses [REUSE](https://reuse.software/) to document licenses.
Each file has a header containing copyright and license information.
The license files that are used in this project can be found in the [LICENSES](./LICENSES) directory.

The MIT license is placed in [LICENSE](./LICENSE), to signify that it constitutes the majority of the codebase, and for compatibility with GitHub.
