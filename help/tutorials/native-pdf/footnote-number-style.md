---
title: ネイティブPDF公開機能 |脚注のカスタムスタイルを使用する
description: 脚注の番号にスタイルを適用する方法を説明します。
source-git-commit: ef562c43f5b70d3fe425427108ad8277e1456f24
workflow-type: tm+mt
source-wordcount: '171'
ht-degree: 0%

---

# 脚注でのカスタムスタイルの使用

脚注とは、ページの下部に配置され、テキストの指定された部分に対してコメントを付けたり、参照を付けたりするメモです。

トピックコンテンツに含まれる脚注呼び出しの番号や、ページの下部にある脚注マーカーのスタイルを設定できます。 例えば、数字の周囲に角括弧を付けたり、色を変更したりできます。 これらのスタイルは、ドキュメント内の脚注を簡単に識別するのに役立ちます。

```css
...
.footnote::footnote-call { 
content: "(" counter(footnote, decimal) ")"; 
} 

.footnote::footnote-marker { 
content: "(" counter(footnote, decimal) ")"; 
} 

...
```

上記の例では、脚注呼び出しと脚注マーカーの前後に括弧が追加されます。

* コンテンツ属性を使用して、プレフィックス「（」とサフィックス「）」を追加します。 `footnote-call` スタイル：トピックコンテンツの脚注番号の周囲に括弧を追加します。
* コンテンツ属性を使用して、プレフィックス「（」とサフィックス「）」を追加します。 `footnote-marker` ページの一番下の脚注番号の周囲に括弧を追加するスタイル。

<img src="./assets/pdf-output-footer-numbers.png" alt="PDF出力のフッター" width="500">
