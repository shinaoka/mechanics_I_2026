## 力学 I — 講義ノート

[Julia 春の学校 2026 教材](https://github.com/shinaoka/julia_spring_school_2026) と同様、Quarto で HTML を生成し GitHub Pages で公開する想定のリポジトリである。

### ローカルでの確認

- `make serve` — プレビュー
- `make build` — `book/dist` にビルド

原稿は `book/*.qmd` である。

### GitHub Pages

`main` への push で [`.github/workflows/pages.yml`](.github/workflows/pages.yml) が走り、`book/dist` をデプロイする。リポジトリの Settings → Pages で GitHub Actions をソースに指定すること。
