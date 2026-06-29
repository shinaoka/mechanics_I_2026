BOOK_DIR := book

.PHONY: build serve clean enrollment-pdf exercises-pdf exercises-pdf-w1 exercises-pdf-w2 exercises-pdf-w3 exercises-pdf-w4 exercises-pdf-w5 exercises-pdf-w6 exercises-pdf-w7 exercises-pdf-w8 exercises-pdf-w9 exercises-pdf-w10 exercises-pdf-w11 exercises-pdf-w12 preview-pdf preview-pdf-folder

# 演習 PDF をプレビュー（macOS の既定アプリ, 通常は Preview）. 例: make preview-pdf WEEK=3
WEEK ?= 1
preview-pdf:
	open "$(BOOK_DIR)/pdf/week$(WEEK)-exercises.pdf"

# book/pdf を Finder で開く
preview-pdf-folder:
	open "$(BOOK_DIR)/pdf"

# 受講の注意スライド（Typst）→ book/pdf/enrollment-notice.pdf
enrollment-pdf:
	mkdir -p $(BOOK_DIR)/pdf
	typst compile $(BOOK_DIR)/enrollment-notice-slides.typ $(BOOK_DIR)/pdf/enrollment-notice.pdf

build:
	cd $(BOOK_DIR) && quarto render

serve:
	cd $(BOOK_DIR) && quarto preview

# 演習問題を週ごとの PDF にし, book/pdf/weekN-exercises.pdf に置く
exercises-pdf: exercises-pdf-w1 exercises-pdf-w2 exercises-pdf-w3 exercises-pdf-w4 exercises-pdf-w5 exercises-pdf-w6 exercises-pdf-w7 exercises-pdf-w8 exercises-pdf-w9 exercises-pdf-w10 exercises-pdf-w11 exercises-pdf-w12

# 隔離サブプロジェクト（book/pdf-weekly/wN）で ltjsarticle により週だけを PDF 化
exercises-pdf-w1:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w1 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w1/build.pdf $(BOOK_DIR)/pdf/week1-exercises.pdf

exercises-pdf-w2:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w2 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w2/build.pdf $(BOOK_DIR)/pdf/week2-exercises.pdf

exercises-pdf-w3:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w3 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w3/build.pdf $(BOOK_DIR)/pdf/week3-exercises.pdf

exercises-pdf-w4:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w4 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w4/build.pdf $(BOOK_DIR)/pdf/week4-exercises.pdf

exercises-pdf-w5:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w5 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w5/build.pdf $(BOOK_DIR)/pdf/week5-exercises.pdf

exercises-pdf-w6:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w6 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w6/build.pdf $(BOOK_DIR)/pdf/week6-exercises.pdf

exercises-pdf-w7:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w7 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w7/build.pdf $(BOOK_DIR)/pdf/week7-exercises.pdf

exercises-pdf-w8:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w8 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w8/build.pdf $(BOOK_DIR)/pdf/week8-exercises.pdf

exercises-pdf-w9:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w9 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w9/build.pdf $(BOOK_DIR)/pdf/week9-exercises.pdf

exercises-pdf-w10:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w10 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w10/build.pdf $(BOOK_DIR)/pdf/week10-exercises.pdf

exercises-pdf-w11:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w11 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w11/build.pdf $(BOOK_DIR)/pdf/week11-exercises.pdf

exercises-pdf-w12:
	mkdir -p $(BOOK_DIR)/pdf
	cd $(BOOK_DIR)/pdf-weekly/w12 && quarto render build.qmd --to pdf
	cp $(BOOK_DIR)/pdf-weekly/w12/build.pdf $(BOOK_DIR)/pdf/week12-exercises.pdf

clean:
	rm -rf $(BOOK_DIR)/dist $(BOOK_DIR)/dist-exercises-pdf $(BOOK_DIR)/dist-weekly-pdf-tmp
	rm -f $(BOOK_DIR)/pdf-weekly/w*/build.pdf
