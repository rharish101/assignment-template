# SPDX-FileCopyrightText: 2020 Harish Rajagopal <harish.rajagopals@gmail.com>
#
# SPDX-License-Identifier: CC0-1.0

# LuaLaTeX support
$pdf_mode = 4;

# Add the `-shell-escape` flag for the `minted` package
set_tex_cmds("--shell-escape %O %S");
