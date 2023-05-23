---
title: Web エディターでのファイルの自動保存の設定
description: Web エディターでファイルを自動保存する設定方法を説明します
source-git-commit: 801c306fa120e7889d4b9428fd5bee2849bf1956
workflow-type: tm+mt
source-wordcount: '197'
ht-degree: 1%

---


# Web エディターでのファイルの自動保存の設定 {#id199CC0J0M5Z}

ブラウザーベースのエディターで最も一般的な機能の 1 つは、特定の期間が経過した後にデータを保存できる機能です。 AEM Guides の Web エディターでは、指定した時間間隔でのトピックおよびマップファイルの自動保存もサポートしています。 この機能をトリガーすると、トピックまたはマップの作業用コピーが保存されます。 トピックまたはマップの新しいバージョンが作成されません。 新しいバージョンを作成するには、Web エディタのツールバーの「リビジョンを保存」アイコンをクリックする必要があります。

自動保存機能はデフォルトでは有効になっていないので、configMgr から有効にする必要があります。 Web エディターで自動保存機能を有効にするには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.xmleditor.config.XmlEditorConfig** バンドル。

1. 内 *XmlEditorConfig* 設定で、 **自動保存** オプション。

1. 内 **自動保存間隔** 「 」フィールドで、自動保存機能のトリガー間隔を秒単位で指定します。

1. 「**保存**」をクリックします。


**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

