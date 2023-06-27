---
title: Web エディターでの翻訳機能の設定
description: Web エディターで翻訳機能を設定する方法を説明します。
source-git-commit: 6051181e243cf71919901093c1b5590f21832545
workflow-type: tm+mt
source-wordcount: '154'
ht-degree: 0%

---


# Web エディターでの翻訳機能の設定 {#id21BONI0J0YR}

Web エディターは、コンテンツを複数の言語に翻訳するための強力な翻訳機能を提供します。

以下を使用して、 **管理** 」タブをクリックして、コンテンツを翻訳します。 このタブは、デフォルトで使用可能です。

を非表示にするには **管理** Web エディターの「 」タブで、次の手順を実行します。

1. ログイン **Adobe Experience Manager** 管理者として。
1. をクリックします。 **Adobe Experience Manager** 上部のリンクをクリックし、「 」を選択します。 **ツール**.
1. 選択 **ガイド** ツールのリストから、 **フォルダープロファイル**.
1. をクリックします。 **グローバルプロファイル** タイル。
1. クリック **XML エディター設定**.
1. クリック **編集** アイコンをクリックします。
1. をダウンロードします。 `ui\_config.json` file.ダウンロードしたファイルから次のコードスニペットを削除します。

   ```json
   {
       "component":"tab",
       "id":"workflow",
       "title":"Manage",
       "on-click":"APP_MODE_CHANGE",
       "items":
       [
           {
               "component":"label",
               "label":"Manage"
           }
       ]
   },
   ```

1. 更新した ui\_config.json ファイルをアップロードします。

なお、 **管理** フィルターは使用できなくなりました。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

