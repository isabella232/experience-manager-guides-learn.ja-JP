---
title: デスクトップベースの XML エディターの統合
description: デスクトップベースの XML エディターを統合する方法を説明します
source-git-commit: 5ac066bb8db32944abd046f64da11eeb1bdbe467
workflow-type: tm+mt
source-wordcount: '272'
ht-degree: 0%

---


# デスクトップベースの XML エディターの統合 {#id181GB01G0HS}

市場では多くの XML エディタが利用可能で、既に使用している可能性があります。 Adobe FrameMakerは、AEMコネクタに付属している、最も強力な XML エディターの 1 つです。 FrameMaker でAEMコネクタを使用すると、AEMリポジトリとの接続、ファイルのチェックアウトとチェックイン、FrameMaker での直接のファイルの編集を簡単に行うことができます。 Web エディターからAEM Guide を起動するように設定することもできます。 FrameMaker でファイルを開いたら、ファイルを編集して、AEMリポジトリに再度チェックインできます。

## Web エディタから FrameMaker でファイル編集を有効にする

FrameMaker またはその他の DITA エディタを使用して、DITA コンテンツを作成および更新できます。 ただし、組織で FrameMaker を DITA エディターとして使用している場合は、AEMから FrameMaker で直接 DITA 文書を開くオプションをユーザーに与えることができます。

デフォルトでは、ユーザーには **FrameMaker で開く** ボタンをAEMツールバーに追加します。 このボタンをAEMツールバーに追加するには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.xmleditor.config.XmlEditorConfig** バンドル。

   ![](assets/open-in-fm-toolbar.png){width="550" align="left"}

1. を選択します。 **FrameMaker で開くボタンを表示** オプション。

1. 「**保存**」をクリックします。


次を有効にした場合、 **FrameMaker で開くボタンを表示** オプションを選択し、 **FrameMaker で開く** ボタンがAEMリポジトリ内の任意の DITA ファイルを選択する際に表示されます。 このオプションが *無効*、 **FrameMaker で開く** ボタンは、リポジトリ内で.fm ファイルまたは.book ファイルを選択した場合にのみ表示されます。

