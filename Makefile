
ipefigs=$(wildcard figs/*.ipe)
slidefigs=$(wildcard figs/*.ipe)

franklin.pdf : figs franklin.tex franklin.bib $(ipefigs)
	latexmk -pdf franklin.tex 	

figs: $(ipefigs)
	(cd figs; make)

install: franklin.pdf
	scp franklin.pdf cglab.ca:public_html/publications/drafts/franklin/

clean :
	rm -f franklin.pdf figs/*.pdf
