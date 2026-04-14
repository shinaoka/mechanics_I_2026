## 力学 I — 講義ノート

ブラウザからは, [https://shinaoka.github.io/mechanics_I_2026/](https://shinaoka.github.io/mechanics_I_2026/) で確認できる. 

### ローカルでの確認

- `make serve` — プレビュー
- `make build` — `book/dist` にビルド

原稿は `book/*.qmd` である. 

### GitHub Pages

`main` への push で [`.github/workflows/pages.yml`](.github/workflows/pages.yml) が走り, `book/dist` をデプロイする. リポジトリの Settings → Pages で GitHub Actions をソースに指定すること. 

ビルド後に `book/dist/pdf/enrollment-notice.pdf` と `book/dist/pdf/week*-exercises.pdf` の存在を検査する. 受講の注意スライドは `make enrollment-pdf`（Typst）で, 演習 PDF は `make exercises-pdf` で生成し, `book/pdf/` に置いたうえでコミットする（CI では LaTeX / Typst を入れず HTML のみビルドする）. `index.html`（はじめに）から受講の注意 PDF へ, サイト上部ナビの「演習 PDF」から各週の演習 PDF に飛べる. 
