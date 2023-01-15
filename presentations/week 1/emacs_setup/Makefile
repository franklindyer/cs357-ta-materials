SRC=$(wildcard *.tex)
PAPER=main.tex
OUTPUT=$(PAPER:.tex=.pdf)
all: $(SRC)
	pdflatex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)
.PHONY: clean
clean:
	rm -rf main.ist main.gls main.glo main.toc 
	rm -rf main.diagnose main.kaux main.idx main.ilg main.out
	rm -rf main.log main.synctex\(busy\)
	rm -rf main.fdb_latexmk main.fls
	rm -rf main.aux main.nav main.snm
	rm -rf main.vrb
	rm -rf $(OUTPUT)
watch:
	@while true; do inotifywait $(SRC); sleep 0.01; make all; done

