---
title: ツールバーのカスタマイズ
description: ツールバーをカスタマイズする方法を説明します
source-git-commit: ef2e99db8c298d34af5777baa48886a55ac32590
workflow-type: tm+mt
source-wordcount: '894'
ht-degree: 0%

---


# ツールバーのカスタマイズ {#id172FB00L0V6}

デフォルトでは、Web エディターには、任意の DITA エディターで必要とされる最も一般的な編集機能が付属しています。 リストタイプ（番号付きまたは箇条書き）、相互参照、コンテンツ参照、テーブル、段落、文字書式の要素の挿入などの機能をエディターで使用できます。 これらの基本的な要素に加えて、 Web エディターをカスタマイズして、オーサリング環境で使用する要素を挿入できます。

Web エディタのツールバーをカスタマイズする方法は 2 つあります。

- ツールバーへの新しい機能の追加

- ツールバーから既存の機能を削除します。


## ツールバーに機能を追加する

Web エディターに機能を追加するには、主に 2 つのタスクが必要です。 *ui\_config.json* ファイルを作成し、JavaScript でバックグラウンド機能を追加する方法について説明します。

**ツールバーにアイコンを追加**

Web エディタのツールバーに機能を追加するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/clientlibs/clientlibs/xmleditor/ui_config.json`

1. 次の場所にデフォルトの設定ファイルのコピーを作成します。

   `/apps/fmdita/xmleditor/ui_config.json`

1. に移動して、を開きます。 `ui_config.json` ファイルを `apps` ノードを編集します。

1. 内 `ui_config.json` ファイルを開き、新しい機能の定義を「ツールバー」セクションに追加します。 通常は、新しいツールバーボタングループを作成し、そのグループに 1 つ以上のツールバーボタンを追加できます。 または、既存のツールバーグループ内に新しいツールバーボタンを追加できます。 新しいツールバーグループを作成するには、次の詳細が必要です。

   - **type:**Specify `blockGroup` を `type` の値です。 この値は、1 つ以上のツールバーグループを含むブロックグループを作成していることを示します。

   - **extractlass:** スペースで区切られたクラスの名前。

   - **項目：** ツールバーのすべてのグループの定義を指定します。 各グループには、1 つまたは複数のツールバーアイコンを含めることができます。 ツールバーグループ内でアイコンを定義するには、 `type` 属性 `items`を設定し、値を `buttonGroup`. で 1 つ以上のクラス名を指定します。 `extraclass` プロパティ。 フィーチャ名を `label` プロパティ。 次のスニペット： `ui_config.json` ファイルには、メインツールバーブロックの定義が表示され、その後に `buttonGroup` 定義：

      ```json
      "toolbar": {    
        "type": "blockGroup",    
        "extraclass": 
        "toolbar operations",    
          "items": [      
            {        
              "type": "buttonGroup",        
              "extraclass": "left-controls",        
              "label": "Left Controls",        
              "items": [
      ```

      内 `items` コレクションに含める場合は、1 つ以上のツールバーアイコンの定義を指定する必要があります。
ツールバーアイコンを追加するには、次のプロパティを定義する必要があります。

   - **型：** 指定 `button` を `type` の値です。 この値は、ツールバーボタンを追加しようとしていることを示します。

   - **アイコン：** ツールバーで使用する Coral アイコンの名前を指定します。

   - **バリアント：** 指定 `quiet` を `variant` の値です。

   - **タイトル：** アイコンのツールチップを指定します。

   - **オンクリック：** JavaScript ファイルで、機能に対して定義されたコマンド名を指定します。 コマンドに入力パラメータが必要な場合は、コマンド名を次のように指定します。

      ```JavaScript
      "on-click": {"name": "AUTHOR_INSERT_ELEMENT", "args": "simpletable"}
      ```

   - **表示/非表示：** 次を定義する場合、 `show` プロパティを使用して、アイコンが表示されるモードを指定します。 指定できる値は — です。 `@isAuthorMode`, `@isSourceMode`, `@isPreviewMode`, `true` \（すべてのモードで表示\）または `false` \（すべてのモードで非表示にします\）。

   の代わりに `show`を使用する場合、 `hide` プロパティ。 指定可能な値は、 `show` プロパティの値は、指定したモードではアイコンが表示されないという違いだけです。

1. の作成 *clientlib* フォルダーに追加し、このフォルダーに JavaScript を追加します。

1. の categories プロパティを更新します。 *clientlib* フォルダーを作成するには、 *apps.fmdita.xml\_editor.page\_overrides*.

1. 保存する *ui\_config.json* ファイルを作成し、Web エディタを再読み込みします。


**JavaScript のコードサンプル**

この節では、カスタム機能の追加を開始するのに役立つ、JavaScript コードの 2 つの例を示します。 次の例は、ユーザーがツールバーのバージョンを表示アイコンをクリックしたときのAEM Guides のバージョン番号を示しています。

次のコードを JavaScript ファイルに追加します。

```JavaScript
/**
* This file contains an example to show AEM Guides version 
* number when a user clicks on the Show Version icon in the toolbar. 
* Step 1. Create a clientlib folder and add save a file with your *JavaScript code into this folder. A code sample is shared below.
* Step 2: Update the categories property of the clientlib folder by *assigning it the value of 
* "apps.fmdita.xml_editor.page_overrides".
* Step 3: Add the feature in the ui_config.json file as shown after the *sample code. Save the ui_config.json file and reload the Web Editor
 */

(function (window) {
  "use strict";

  window.addEventListener('DOMContentLoaded', function () {
    fmxml.ready(function () {
      fmxml.eventHandler.subscribe({
        key: 'user.alert',
        next: function next() {
          alert("AEM Guides version x.x");
        }
      });
    });
  });
})(window);
```

ui\_config.json ファイルに次のように機能を追加します。

```json
 {
      "type": "button",
      "icon": "alert",
      "title": "About AEM Guides",
      "variant": "quiet",

  "show": "true",
      "on-click": "user.alert"
  } 
```

次の例では、作業中のファイルのドキュメントの状態を「レビュー中」に変更する方法を示します。

```JavaScript
/**
* This file contains an example to set the document state of an active *open documen to "In-Review". 
* Step 1. Create a clientlib folder and add save a file with your *JavaScript code into this folder. A code sample is shared below.
* Step 2: Update the categories property of the clientlib folder by *assigning it the value of 
* "apps.fmdita.xml_editor.page_overrides".
* Step 3: Add the feature in the ui_config.json file as shown after the *sample code. Save the ui_config.json file and reload the Web Editor
 */

(function (window) {
  "use strict";

  //Wait for the page has been completely loaded 

  window.addEventListener('DOMContentLoaded', function () {

    //Wait for the xml editor to start
    fmxml.ready(function () {

      //Subscribe to 'user.docstate.to.in-review' event
      fmxml.eventHandler.subscribe({
        key: 'user.docstate.to.in-review',
        next: function next() {
          var docstate = "In-Review"; // New docstate name
          var filePath = fmxml.curEditor.filePath; 
// Get the file path of active open file
          if (filePath) {
            //Call API to change the doc state
            $.ajax({
              type: 'POST',
              url: '/bin/fmdita/states',
              data: {
                paths: filePath,
                operation: "setdocstates",
                docstate: docstate
              }
            }).fail(function (xhr, textStatus, errorThrown) {
              console.error("Cannot update docstate to " + docstate);
            }).success(function (data) {
              console.log('docstate updated to ' + docstate);
            });
          }
        }
      });
    });
  });
})(window);
```

ui\_config.json ファイルに次のように機能を追加します。

```json
 {
      "type": "button",
      "icon": "actions",
      "title": "Change document state to In-Review",
      "variant": "quiet",
      "show": "true",
      "on-click": "user.docstate.to.in-review"
    } 
```

## ツールバーからフィーチャを削除する

Web エディタで現在利用可能なすべての機能を提供したくない場合は、不要な機能を Web エディタのツールバーから削除できます。

ツールバーから不要な機能を削除するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/clientlibs/clientlibs/xmleditor/ui_config.json`

1. 次の場所にデフォルトの設定ファイルのコピーを作成します。

   `/apps/fmdita/xmleditor/ui_config.json`

1. に移動して、を開きます。 `ui_config.json` ファイルを `apps` ノードを編集します。
この `ui_config.json` ファイルには 3 つのセクションがあります。

- **ツールバー：**   このセクションには、エディタのツールバーで使用できるすべての機能の定義が含まれます ( 番号付きリストの挿入/削除、\(file\) 閉じる、保存、コメントなど )。

- **ショートカット：**   この節では、エディターの特定の機能に割り当てられるキーボードショートカットの定義について説明します。

- **テンプレート：**   この節では、文書で使用できる DITA 要素の事前定義済みの構造を示します。 デフォルトでは、「テンプレート」セクションには、段落、単純なテーブル、テーブルおよび本文の各要素のテンプレート定義が含まれています。 任意の要素のテンプレート定義を作成するには、目的の要素に有効な XML 構造を追加します。 例えば、 `p` 新たに `li` 要素をリストに追加すると、テンプレートセクションの最後に次のコードを追加して、これを実現できます。

```HTML
"li": "<li><p></p></li>"
```

1. 「ツールバー」セクションで、ユーザーに表示しない機能のエントリを削除します。

1. 保存する *ui\_config.json* ファイルを作成し、Web エディタを再読み込みします。


**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

