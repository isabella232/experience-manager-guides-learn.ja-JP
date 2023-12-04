---
title: ネイティブPDF公開機能 |カスタムの変更バースタイルを使用する
description: 変更バーにスタイルを適用する方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '348'
ht-degree: 0%

---

# カスタムの変更バースタイルを使用する

変更バーは、新しいコンテンツや改訂されたコンテンツを視覚的に識別する縦線です。 AEMガイドでは、トピック内の変更されたコンテンツの左側に変更バーを表示し、PDF出力の目次に変更されたトピックも表示できます。

変更バーの表示の詳細については、 *公開済みPDF間の変更バーを使用したバージョンの作成* 設定 [公開PDF出力](../web-editor/native-pdf-web-editor.md).

## トピック内の変更済みコンテンツ

変更バーは、挿入、変更または削除されたトピックのコンテンツの左側に表示されます。

次のスタイルを変更して、変更されたコンテンツを表示し、変更バーを含むコンテンツを表示できます。


>[!NOTE]
>
>これらのスタイルは、 `layout.css` ファイルに保存し、必要に応じて編集できます。

例えば、 `.inserted-block` スタイル：挿入したコンテンツを公開済みPDF出力に表示する方法を定義します。


```css
...
.inserted-block { 
  color: #2ECC40; 
  display: inline; 
  -ro-comment-content: " "; 
  -ro-comment-style: underline; 
  -ro-comment-title: "Inserted"; 
  -ro-comment-date: attr(data-time); 
  -ro-comment-dateformat: "yyyy/dd/MM HH:mm:ss"; 
} 
...
```

同様に、 `.deleted-block` スタイル：削除したコンテンツを公開済みPDF出力に表示する方法を定義します。

```css
...
.deleted-block { 
  display: inline; 
  color: #FF6961; 
  text-decoration: line-through; 
  -ro-comment-content: " "; 
  -ro-comment-style: strikeout; 
  -ro-comment-title: "Deleted"; 
  -ro-comment-date: attr(data-time); 
  -ro-comment-dateformat: "yyyy/dd/MM HH:mm:ss"; 
} 
...
```

以下を使用できます。 `.inserted-change-bar` および `.deleted-change-bar` スタイル：更新されたコンテンツの左側に表示される変更バーの外観を変更します。

例えば、 `-ro-change-bar-color` 属性 `.inserted-change-bar` style：挿入した変更バーを緑色で表示します。 また、 `-ro-change-bar-color` 属性 `.deleted-change-bar` style ：削除した変更バーを赤色で表示します。

```css
...
.inserted-change-bar { 
  -ro-change-bar-color: #2ECC40; 
} 

.deleted-change-bar { 
  -ro-change-bar-color: #FF6961; 
  } 
...
```

<img src="./assets/changed-bar-content.png" alt="変更されたバートピックの内容" width="500">

## 目次 (TOC) の変更済みトピック

また、PDF出力の目次に、変更されたトピックの左側に変更バーを追加できます。 以下を使用できます。 `-ro-change-bar-color` 属性 `.changed-topic` スタイル：目次リストの更新済みトピックに対して、選択した色の変更バーを追加します。

例えば、緑色の変更バーを追加できます。

```css
...
.changed-topic { 
 -ro-change-bar-color: #2ECC40; 
}  
...
```


これにより、目次内のすべてのトピックに対して緑色の変更バーが表示されます。一部の更新が完了しています。 目次で変更されたトピックをクリックし、詳細な変更を表示できます。

<img src="./assets/changed-bar-TOC.png" alt="変更されたバーの目次" width="500">
