---
title: Web エディターでのファイルの自動保存の設定
description: Web エディターでファイルを自動保存する設定方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '182'
ht-degree: 1%

---

# Web エディターでのファイルの自動保存の設定 {#id199CC0J0M5Z}

ブラウザーベースのエディターで最も一般的な機能の 1 つは、特定の期間が経過した後にデータを保存できる機能です。 AEM Guides Web Editor は、指定した時間間隔でのトピックおよびマップファイルの自動保存もサポートしています。 この機能をトリガーすると、トピックまたはマップの作業用コピーが保存されます。 トピックまたはマップの新しいバージョンが作成されません。 新しいバージョンを作成するには、Web エディタのツールバーの「リビジョンを保存」アイコンをクリックする必要があります。

自動保存機能はデフォルトでは有効になっていないので、設定ファイルを使用して有効にする必要があります。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。 設定ファイルで、ファイルの自動保存と自動保存時間間隔を設定する次の\（プロパティ\）の詳細を指定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.xmleditor.config.XmlEditorConfig` | `xmleditor.autosave` | ブール値\(true/false\)。<br> **デフォルト値**: false |
| `xmleditor.autosaveinterval` | 自動保存機能のトリガー間隔を秒単位で指定します。 |

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)
