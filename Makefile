example.pdf: example.tex solution.cls
	latexmk example.tex

.PHONY: clean clean-all

clean:
	latexmk -c
	rm -rf _minted-example

clean-all: clean
	latexmk -C
