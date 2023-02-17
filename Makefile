# SPDX-FileCopyrightText: 2021 Harish Rajagopal <harish.rajagopals@gmail.com>
#
# SPDX-License-Identifier: CC0-1.0

example.pdf: example.tex solution.cls
	latexmk example.tex

.PHONY: clean clean-all

clean:
	latexmk -c
	rm -rf _minted-example

clean-all: clean
	latexmk -C
