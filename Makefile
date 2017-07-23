PROJECT = Harry_Potter_i_Metody_Racjonalizmu
TARGET = $(PROJECT).pdf

PANDOC ?= pandoc
RUBBER ?= rubber
SED ?= sed
ASPELL ?= aspell

LANG = pl
ASPELL_PERSONAL = ./.aspell.ignore

TEXS = $(filter-out %.md.tex,$(wildcard *.tex))
DEPS = $(TEXS:=.dep)
MDS = $(wildcard *.md)

include $(DEPS)

all: $(TARGET)

%.tex.dep: %.tex
	$(SED) -n 's/\\include{\([^}]*\)}/$*.pdf: \1.tex/gp' $< > $@

%.md.tex: %.md
	$(PANDOC) --chapters $< -o $@

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

test: $(addprefix __test__,$(TEXS) $(MDS))

__test__%.tex:
	@echo "Test $*.tex"
	@if $(ASPELL) --encoding=utf-8 --lang=$(LANG) --personal=$(ASPELL_PERSONAL) --mode tex list < $*.tex | grep . ; then echo "SPELLCHECK FAILED FOR $*.md"; false; else true; fi

__test__%.md:
	@echo "Test $*.md"
	@if $(ASPELL) --encoding=utf-8 --lang=$(LANG) --personal=$(ASPELL_PERSONAL) list < $*.md | grep . ; then echo "SPELLCHECK FAILED FOR $*.md"; false; else true; fi

check: $(addprefix __check__,$(TEXS) $(MDS))

__check__%.tex:
	$(ASPELL) --encoding=utf-8 --lang=$(LANG) --personal=$(ASPELL_PERSONAL) --mode tex check $*.tex

__check__%.md:
	$(ASPELL) --encoding=utf-8 --lang=$(LANG) --personal=$(ASPELL_PERSONAL) check $*.md

.PHONY: all clean
.DEFAULT_GOAL = all
