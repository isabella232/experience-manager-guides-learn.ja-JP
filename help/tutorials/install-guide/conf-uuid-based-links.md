---
title: UUID ベースのリンクの表示の設定
description: UUID ベースのリンクの表示を設定する方法について説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '209'
ht-degree: 0%

---

# UUID ベースのリンクの表示の設定 {#id2035G20M0QN}

デフォルトでは、Web エディターの「参照を挿入」または「コンテンツを再利用を挿入」オプションを使用してリンクを作成すると、リンクは参照されるコンテンツの UUID を使用して作成されます。 The **リンク** プロパティ\（プロパティパネル\内）を設定して、参照されるコンテンツまたは UUID の相対ファイルパスを表示できます。 この表示は、 **UUID の有効化** オプションを使用して、設定されます。 デフォルトではオンになっています。これは、参照されるコンテンツの UUID がプロパティパネルに表示されることを意味します。

次の手順を実行して、参照されるコンテンツの相対パスまたは UUID を Web エディターに表示します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.xmleditor.config.XmlEditorConfig** バンドル。

1. Adobe Analytics の *XmlEditorConfig* 設定、 **UUID の有効化** オプションはデフォルトで有効になっています。 これは、参照されるコンテンツの UUID が **リンク** プロパティを使用します。

   リンクされたコンテンツの相対パスを表示する場合は、「 **UUID の有効化** オプション。

1. 「**保存**」をクリックします。


**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)
