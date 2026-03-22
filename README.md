## 力学 I — 講義ノート

ブラウザからは、[https://shinaoka.github.io/mechanics_I_2026/](https://shinaoka.github.io/mechanics_I_2026/) で確認できる。

### ローカルでの確認

- `make serve` — プレビュー
- `make build` — `book/dist` にビルド

原稿は `book/*.qmd` である。

### GitHub Pages

`main` への push で [`.github/workflows/pages.yml`](.github/workflows/pages.yml) が走り、`book/dist` をデプロイする。リポジトリの Settings → Pages で GitHub Actions をソースに指定すること。
