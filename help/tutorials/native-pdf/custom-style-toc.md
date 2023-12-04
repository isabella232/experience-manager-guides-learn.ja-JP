---
title: ネイティブPDF公開機能 | TOC エントリとトピックコンテンツにカスタムスタイルを適用
description: スタイルシートを作成し、コンテンツのスタイルを作成する方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '356'
ht-degree: 0%

---

# TOC エントリとトピックコンテンツにカスタムスタイルを適用

TOC エントリや特定のトピックにカスタムスタイルを適用する必要が生じる場合があります。 これは、 `outputclass` 属性に `<topicref>` 要素が DITA マップに含まれています。 また、トピック全体にカスタムフォーマットを適用する場合は、CSS で属性のスタイル定義を拡張して適用することもできます。

レビュー用に送信する新しいトピックの例を見てみましょう。 更新されたトピックを簡単に識別するには、 `outputclass` 属性 `<topicref>` 要素を DITA マップに追加し、CSS で同じカスタムスタイルを定義します。

次の例では、 *フライトの履歴* トピックが割り当てられました `outputclass` 属性は `new-topic`.

<img src="./assets/new-topic-attribute-in-map.png" width="500">

のクラス定義 `new-topic` CSS では、次の項目のスタイルを定義できます。
* 目次のメインエントリまたはミニ目次の項目
* メインコンテンツのトピックのタイトル
* タイトルを含む、トピックのコンテンツ全体

CSS でこれらの各シナリオを定義する方法を見てみましょう。 以下の CSS 定義 ( `new-topic` クラスの場合、テキストの色が変更されました。

```css
…
.new-topic {
  color: #CC5309
}
…
```

この定義は、目次のテキストの色とトピックのタイトルを制御します。 次のPDF出力は、TOC エントリに適用される様々な色を示しています。

<img src="./assets/pdf-output-toc-entry.jpg" width="500">

トピックのタイトルも、同じ色を使用してスタイル設定されます。

<img src="./assets/pdf-output-topic-title.jpg" width="500">

TOC エントリとトピックのタイトルに異なるスタイルを設定する場合は、次に示すように、それぞれを個別に定義できます。

```css
...
/*for styling TOC entry */
.new-topic {
  color: #CC3509
}

/* for styling topic's title */
.new-topic.title {
  color: #092ACC
}
...
```

最後に、トピック内のコンテンツ全体にスタイルを適用することもできます。 この場合は、「`-content`」をクラス名に追加します。 次の例では、トピックのコンテンツ全体に変更バーが追加されています。

```css
...
/* for styling the topic's content */
.new-topic-content {
  -ro-change-bar-color: #A609CC;
}
...
```

上記のスタイル属性を使用すると、変更バーが *飛行歴* トピックに含まれます。

<img src="./assets/pdf-output-topic-content.jpg" width="500">
