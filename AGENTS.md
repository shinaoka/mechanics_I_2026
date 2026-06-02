# このリポジトリでの執筆ルール

- 日本語の句読点は `、` と `。` ではなく, `, ` と `. ` を用いること.
- 力学の用語は厳密に区別すること: 加速度はベクトル, 加速度の大きさは非負のスカラー, 速度はベクトル, 速さは非負のスカラー.
- Codex/Superpowers などの設計メモ, 作業計画, 一時的な仕様書は `docs/` 以下に保存しないこと. 必要な方針確認はチャット上で行い, リポジトリには講義ノート, 演習問題, ビルド設定, 公開に必要な成果物だけを残す.

## 演習問題（`week*-exercises.qmd`）と PDF

- **番号付き小問の改行:** CommonMark では, `$$ ... $$` の表示数式や長い続きの文の直後に `2.` や `3.` が続き, そのあいだに**空行がない**と, 次の番号が前のリスト項目の続きと解釈され, HTML / PDF で**番号と本文が 1 行にくっついたり**, PDF で意図しない組版になることがある. **小問の番号行の直前に空行を 1 行入れる**（特に数式ブロックのあとで次の `N.` に移るとき）.
- **演習ページの PDF リンク:** 印刷用 PDF には「同じ内容の PDF」などの自己参照が不要なので, `::: {.content-visible when-format="html"}` で囲み, **HTML のときだけ**リンクを出す.
- **PDF の生成:** 週ごとの PDF は `book/pdf-weekly/wN/build.qmd`（`ltjsarticle`）から `make exercises-pdf` でビルドし, `book/pdf/weekN-exercises.pdf` にコピーする. 演習の本文を直したら PDF も再生成すること.
- **公開サイトと CI:** `book/_quarto.yml` の `project.resources` で `book/pdf/*.pdf` を `dist/pdf/` に同梱する. `index.qmd` のトップから `pdf/enrollment-notice.pdf`（受講の注意スライド）へ, 各週とナビバーの「演習 PDF」から相対パス `pdf/weekN-exercises.pdf` でリンクする. GitHub Actions は `make build` のあと `dist/pdf/enrollment-notice.pdf` と週別演習 PDF の存在を検査するので, **更新した PDF はリポジトリにコミットすること**（CI では LaTeX / Typst を入れず PDF は再生成しない）.
- **受講の注意 PDF:** 原稿は `book/enrollment-notice-slides.typ`（Typst）. 変更したら `make enrollment-pdf` で `book/pdf/enrollment-notice.pdf` を再生成し, その PDF をコミットする.

## ローカルでビルドしてから commit し, サイトを更新する

1. 原稿を編集する（主に `book/*.qmd`）.
2. **演習問題**（`week*-exercises.qmd`）を変えたら, LaTeX ありの環境で `make exercises-pdf` を実行し, `book/pdf/week*-exercises.pdf` を更新する. **受講の注意**（`book/enrollment-notice-slides.typ`）を変えたら `make enrollment-pdf` で `book/pdf/enrollment-notice.pdf` を更新する. どちらも触らない変更ならこの手順は省略してよい.
3. 任意で `make build` とし, `book/dist/` の HTML をブラウザで確認する（`book/dist` は `.gitignore` されておりコミットしない）.
4. **`git status` を確認する.** `book/dist/`, `book/.quarto/`, ビルドログ, `*.aux` / `*.log` / 一時スクリプトなどが stage されていないこと. 必要なのは原稿・`book/pdf/*.pdf`・`book/pdf-weekly/`・設定ファイルなどだけである.
5. `git add` で必要なファイルだけをステージし, `git commit` する.
6. `git push origin main` する. GitHub Actions（`.github/workflows/pages.yml`）が `make build` を走らせ, `book/dist` を GitHub Pages に載せる. 数分後に公開 URL（例: README にある Pages の URL）が更新される.
