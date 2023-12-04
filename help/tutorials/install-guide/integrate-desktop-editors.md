---
title: デスクトップベースの XML エディターの統合
description: デスクトップベースの XML エディターを統合する方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '272'
ht-degree: 0%

---

# デスクトップベースの XML エディターの統合 {#id181GB01G0HS}

市場では多くの XML エディタが利用可能で、既に使用している可能性があります。 Adobe FrameMakerは、AEMコネクタに付属する、最も強力な XML エディターの 1 つです。 FrameMakerでAEMコネクタを使用すると、AEMリポジトリとの接続、ファイルのチェックアウトとチェックイン、およびFrameMakerでの直接のファイルの編集を簡単におこなえます。 AEMガイドを設定して、Web エディターからFrameMakerを起動することもできます。 ファイルをFrameMakerで開いたら、ファイルを編集し、AEMリポジトリに再度チェックインできます。

## Web エディターからFrameMakerでのファイル編集を有効にする

FrameMakerまたはその他の DITA エディターを使用して、DITA コンテンツを作成および更新できます。 ただし、組織でFrameMakerを DITA エディターとして使用している場合は、AEMからFrameMakerで DITA 文書を直接開くオプションをユーザーに与えることができます。

デフォルトでは、ユーザーには **「開く」FrameMaker** ボタンをAEMツールバーに追加します。 このボタンをAEMツールバーに追加するには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.xmleditor.config.XmlEditorConfig** バンドル。

   ![](assets/open-in-fm-toolbar.png){width="550" align="left"}

1. を選択します。 **「開くFrameMaker」ボタンを表示** オプション。

1. 「**保存**」をクリックします。


次を有効にした場合、 **「開くFrameMaker」ボタンを表示** オプションを選択し、 **「開く」FrameMaker** ボタンがAEMリポジトリ内の任意の DITA ファイルを選択する際に表示されます。 このオプションが *無効*、 **「開く」FrameMaker** ボタンは、リポジトリ内で.fm ファイルまたは.book ファイルを選択した場合にのみ表示されます。
