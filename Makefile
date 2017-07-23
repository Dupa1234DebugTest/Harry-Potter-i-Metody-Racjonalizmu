PROJECT = Harry_Potter_i_Metody_Racjonalizmu
TARGET = $(PROJECT).pdf

PANDOC ?= pandoc
RUBBER ?= rubber
SED ?= sed
ASPELL ?= aspell

TEXS = $(filter-out %.md.tex,$(wildcard *.tex))
DEPS = $(TEXS:=.dep)
MDS = $(wildcard *.md)

include $(DEPS)

all: $(TARGET)

%.tex.dep: %.tex
	$(SED) -n 's/\\include{\([^}]*\)}/$*.pdf: \1.tex/gp' $< > $@

%.md.tex: %.md
	$(PANDOC) --top-level-division=chapter $< -o $@

%.pdf: %.tex
	$(RUBBER) --pdf $<

clean:
	$(RM) *.aux
	$(RM) *.dvi
	$(RM) *.log
	$(RM) *.toc
	$(RM) *.pdf
	$(RM) *.dep
	$(RM) *.md.tex

check:
	$(ASPELL) check 

.PHONY: all clean
.DEFAULT_GOAL = all
