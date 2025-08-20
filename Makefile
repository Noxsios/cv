%.pdf: cv.typ
	typst compile $< $@

%.png: cv.typ
	typst compile $< $@

watch:
	typst watch cv.typ

clean:
	rm -f *.pdf *.png

.DEFAULT_GOAL = cv.pdf
.PHONY: watch clean
