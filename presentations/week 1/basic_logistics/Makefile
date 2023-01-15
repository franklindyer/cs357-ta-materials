SRC=$(wildcard *.tex)
PAPER=main.tex
OUTPUT=$(PAPER:.tex=.pdf)
all: $(SRC)
	echo $(SRC)
	pdflatex -synctex=1 $(PAPER)
	#makeindex -s main.ist -o main.gls main.glo
	rubber --pdf $(PAPER) --synctex
.PHONY: clean
clean:
	rubber --clean $(PAPER)
	rm -rf main.ist main.gls main.glo main.toc 
	rm -rf main.diagnose main.kaux main.idx main.ilg main.out
	rm -rf main.log main.synctex\(busy\)
	rm -rf main.fdb_latexmk main.fls
	rm -rf $(OUTPUT)
watch:
	@while true; do inotifywait $(SRC); sleep 0.01; make all; done

