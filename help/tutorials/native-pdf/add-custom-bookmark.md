---
title: ネイティブPDF公開機能 | TOC エントリとトピックコンテンツにカスタムスタイルを適用
description: スタイルシートを作成し、コンテンツのスタイルを作成する方法を説明します。
source-git-commit: fbb81704ea8d9d2793b066fa159b405460fa1dcf
workflow-type: tm+mt
source-wordcount: '182'
ht-degree: 0%

---


# カスタムブックマークをPDF出力に追加

一般に、DITA マップ内の TOC は、最終的なPDF出力でブックマークとして複製されます。 この TOC は、DITA マップのトピックまたはセクションのタイトルから作成されます。 ナビゲーションを容易にするために、PDF出力の特定のコンテンツにカスタムブックマークを追加する必要が生じる場合があります。 これは、 `outputclass` 属性を要素に適用し、次の属性を適用する必要があります。

`bookmark-level: 3`

ここで、 `bookmark-level` は属性と数値です `3` には、ブックマークが追加されるブックマーク階層のレベルを示す値を指定します。 次の例では、第 1 レベルのトピック「連絡先」に、 `outputclass` 属性は `custom-bookmark`.

<img src="./assets/custom-bookmark-attribute.png" width="500">

次の定義は、 `custom-bookmark` クラスが CSS ファイルに追加されます。

```css
…
/*Adding a custom bookmark*/
.custom-bookmark{
    bookmark-level: 2
}
…
```

PDF出力で、 *連絡先リスト* 次に示すように、PDFのブックマークリストの第 2 レベルに表が追加されます。

<img src="./assets/custom-bookmark-in-pdf-output.png" width="500">
