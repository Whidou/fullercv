cv: cv_example.tex fullercv.cls
	lualatex --file-line-error-style cv_example.tex

clean:
	rm -f *.pdf *.aux *.log *.out *~
