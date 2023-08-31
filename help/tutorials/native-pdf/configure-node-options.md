---
title: ネイティブPDF |ネイティブPDF公開用のノードプロセスの設定
description: ネイティブPDF公開用のノードプロセスの設定方法を説明します
source-git-commit: 45974b88a5b1bbbd2d83ea5cc18e0def2f15c51f
workflow-type: tm+mt
source-wordcount: '118'
ht-degree: 3%

---


# ネイティブPDF公開用のノードプロセスの設定

ネイティブPDFの公開では、個別の NodeJs プロセスが開始され、公開プロセスで生成されたファイルが最終的なPDFに変換されます。 様々なシナリオに対応するために、ネイティブPDFの公開を実行するこのノードプロセスの設定を調整する必要が生じる場合があります。 例えば、より大きなワークロードを実行するには、生成された NodeJs プロセスで使用可能な最大ヒープサイズを増やす必要があります。

に示す手順を使用します。 [設定の上書き](../cs-install-guide/download-install-additional-config-override.md) 設定ファイルを作成するには、設定ファイルで、次の（プロパティ）詳細を指定します。

| PID | プロパティキー | プロパティの値 |
|---|---|---|
| `com.adobe.fmdita.config.ConfigManager` | `native.pdf.node.opts` | 標準を設定する文字列値 `NODE_OPTIONS`.<BR> デフォルト値: &quot;&quot; |

