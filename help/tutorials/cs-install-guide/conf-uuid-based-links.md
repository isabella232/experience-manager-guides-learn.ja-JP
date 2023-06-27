---
title: UUID ベースのリンクの表示の設定
description: UUID ベースのリンクの表示を設定する方法について説明します
source-git-commit: 4f15166b1b250578f07e223b0260aacf402224be
workflow-type: tm+mt
source-wordcount: '160'
ht-degree: 1%

---


# UUID ベースのリンクの表示の設定 {#id2035G20M0QN}

デフォルトでは、Web エディターの「参照を挿入」または「コンテンツを再利用を挿入」オプションを使用してリンクを作成すると、リンクは参照されるコンテンツの UUID を使用して作成されます。 この **リンク** プロパティ\（プロパティパネル\内）を設定して、参照されるコンテンツまたは UUID の相対ファイルパスを表示できます。 デフォルトでは、参照されるコンテンツの UUID がプロパティパネルに表示されます。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）詳細を指定して、参照されるコンテンツの相対パスまたは UUID を Web エディターに表示します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.xmleditor.config.XmlEditorConfig` | `xmleditor.uuid` | ブール値\(true/false\)。 リンクされたコンテンツの相対パスを表示する場合は、このプロパティを false に設定します。 <br> **デフォルト値**:true |

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

