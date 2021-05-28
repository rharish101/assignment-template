# XeLaTeX support
$pdf_mode = 5;

# Add the `-shell-escape` flag for the `minted` package
set_tex_cmds("--shell-escape %O %S");

# Specify more extensions to remove when cleaning (either -c or -C)
$clean_ext = "xdv";
