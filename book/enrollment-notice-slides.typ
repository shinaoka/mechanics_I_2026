// 受講の注意（横長スライド・16:9）
#set document(title: "受講の注意（力学I・物理学演習ⅠA）")
#set text(
  lang: "ja",
  font: ("Hiragino Mincho ProN", "Times", "Arial Unicode MS"),
  size: 16pt * 1.2,
)
#set page(
  paper: "presentation-16-9",
  margin: (x: 7%, y: 6%),
  numbering: none,
)
#set heading(numbering: none)
#set par(justify: true, leading: 0.72em)
#set list(indent: 1.2em, spacing: 0.45em)
#show heading.where(level: 1): it => {
  set text(size: 1.35em, weight: "bold")
  block(above: 0.5em, below: 0.65em, it)
}

#align(center)[
  #text(size: 1.5em, weight: "bold")[受講の注意]
  #v(0.45em)
  #text(size: 1.05em, fill: rgb("#333"))[力学I・物理学演習ⅠA]
]

#pagebreak()

= 履修・学習について

#block(inset: (left: 0.5em))[
  *セット履修の推奨* \
  力学Iと物理学演習ⅠAは *セットで履修* することを *強くお勧め* します．

  #v(0.75em)

  *自主的な学習* \
  高校までの講義とは異なり，授業だけでは足りません．*自主的な勉強* が前提です．

  #v(0.75em)

  *復習* \
  *次回のテストに向けて，復習は必須* です．
]

#pagebreak()

= 力学と数学

#block(inset: (left: 0.5em))[
  高校までの物理とは違って，大学の力学では *数学を駆使* します．\
  ベクトル，微分，積分などがその *言語* になります．\
  *これらをちゃんと使いこなせるようにすることがとても重要* です．
]

#pagebreak()

= 輪講（小グループ）

#block(inset: (left: 0.5em))[
  *形式* \
  小グループに分かれ，*輪講形式* で進めます．各グループで毎回 *担当者（おおよそ2名）* が発表し，他の受講者は聴講しつつ *討論* します．

  #v(0.5em)

  *役割分担* \
  担当者の決め方などは *各グループに委ねます*．

  #v(0.5em)

  *予習* \
  その回の発表担当でない受講者も，*予習は必須* です．
]

#pagebreak()

= 講義の進め方（力学I・物理学演習ⅠA）

#align(center)[
  #table(
    columns: (1fr, 2.2fr),
    inset: 14pt,
    stroke: 0.5pt + rgb("#ccc"),
    fill: (x, y) => if calc.even(y) { rgb("#f7f7f7") },
    [*時間帯*], [*内容*],
    [最初の30分], [小テスト],
    [（回による）], [当該週の内容に関する説明],
    [$1 + 1.5$ 時間], [輪講],
  )
]

#v(0.9em)

#block(inset: (left: 0.5em))[
  *演習・レポート* \
  演習問題を物理学演習ⅠAの時間に *グループで一緒に解くかどうか* は，*各グループの判断* に任せます．\
  ただし，演習問題を解いた *レポートは次回まで* に WebClass へ提出してください．
]
