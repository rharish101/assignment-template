# LuaLaTeX support
$pdf_mode = 4;

# Add the `-shell-escape` flag for the `minted` package
set_tex_cmds("--shell-escape %O %S");
