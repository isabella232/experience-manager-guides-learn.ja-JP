---
title: ネイティブPDF公開機能 | JavaScript を使用してコンテンツやスタイルを操作
description: スタイルシートを作成し、コンテンツのスタイルを作成する方法を説明します。
source-git-commit: 09918abbdade934468dea1c55d0ca2cd60622b35
workflow-type: tm+mt
source-wordcount: '425'
ht-degree: 1%

---


# JavaScript を使用したコンテンツやスタイルの操作

ネイティブPDF公開機能を使用すると、JavaScript を実行して、最終PDFが生成される前に、コンテンツに適用されたコンテンツやスタイルを操作できます。 この機能を使用すると、最終的な出力の生成方法を完全に制御できます。 例えば、別のPDFにあるPDF出力に法的通知情報を追加する場合があります。 JavaScript を使用すると、基本コンテンツ用のPDFが作成された後、ただし最終PDFが生成される前に、法的通知情報を追加できます。\
JavaScript の実行をサポートするために、ネイティブPDF公開機能では、次のコールバック関数を使用できます。

* `window.pdfLayout.onBeforeCreateTOC(callback)`:このコールバック関数は、TOC が生成される前に実行されます。
* `window.pdfLayout.onBeforePagination(callback)`:このコールバック関数は、TOC の生成後、ページが改行される前にPDFされます。
* `window.pdfLayout.onAfterPagination(callback)`:このコールバック関数は、TOC と改ページがPDFに追加された後に実行されます。

>[!NOTE]
>
>内部的には、これらの引き出し線関数の実行順序が維持されます。 最初に、 onBeforeCreateTOC が実行され、その後に onBeforePagination が実行され、最後に onAfterPagination が実行されます。

実行するコンテンツのタイプまたはスタイルの変更に基づいて、使用するコールバック関数を選択できます。 例えば、コンテンツを追加する場合は、目次が生成される前にコンテンツを追加することをお勧めします。 同様に、スタイル設定を更新する場合は、ページネーションの前または後に更新を行うことができます。

次の例では、図タイトルの位置が、画像の上から下に変更されます。 この場合は、プリセットで「 JavaScript 実行」オプションを有効にする必要があります。 これには、次の手順を実行します。

1. 編集するプリセットを開きます。
1. 次に移動： **詳細** タブをクリックします。
1. を選択します。 **JavaScript を有効にする** オプション。
1. プリセットを保存して閉じます。

次に、次のコードを含む JavaScript ファイルを作成し、テンプレートのリソースフォルダー内に保存します。

```css
...
/*
* DITA only allows the figure title to be placed above images 
* This JavaScript code is used to move the figure title below the image
* */
window.addEventListener('DOMContentLoaded', function () {
    window.pdfLayout.onBeforeCreateTOC(function() {
        var titleNodes = document.querySelectorAll('.fig > .title')
        for (var i = 0; i < titleNodes.length; i++) {
            var titleNode = titleNodes[i]
            var figNode = titleNode.parentNode
            var imageNode = figNode.querySelector('.image')
            if(imageNode && imageNode.parentNode !== figNode) {
              imageNode = imageNode.parentNode
            }
            if (figNode && imageNode && imageNode.parentNode === figNode) {
                figNode.insertBefore(imageNode, titleNode)
            }
        }
    })
});
...
```

>[!NOTE]
>
>この `window.addEventListener('DOMContentLoaded', function ()` 関数は、コールバック関数を使用する前に呼び出す必要があります。

次に、このスクリプトは、テンプレート出力の生成に使用されるテンプレートファイルから呼び出す必要がありますPDF。 この例では、TOC テンプレートに追加します。 次を確認します。 `<script>` タグが事前定義の `<div>` タグを `<body>` タグを使用します。 これを `<head>` タグまたはタグの外側 `<body>` タグを使用する場合、スクリプトは実行されません。

<img src="./assets/js-added-resources-template.png" width="500">

このコードを使用して生成された出力と、テンプレートには画像の下の図タイトルが表示されます。

<img src="./assets/fig-title-below-image.png" width="500">
