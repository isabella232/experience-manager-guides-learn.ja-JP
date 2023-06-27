---
title: AEM Site 出力用の有効なファイル名の設定
description: AEM Site 出力用の有効なファイル名を設定する方法を説明します
source-git-commit: 4f15166b1b250578f07e223b0260aacf402224be
workflow-type: tm+mt
source-wordcount: '146'
ht-degree: 2%

---


# AEM Site 出力用の有効なファイル名の設定 {#id214GK0X0KXA}

DITA トピックで使用できる有効なファイル名文字のリストと同様に、AEM Site 出力用の有効なファイル名文字のリストを設定することもできます。 URL で使用できない既知の文字の一部を次に示します。 ``'<>`@$``. これらの文字は、自動的にアンダースコアに変換されるように設定されます。`_`「 AEM Site 出力ファイル名の生成中に見つかった場合」を返します。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）詳細を指定して、AEM Site 出力に有効な文字を設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.common.SanitizeNodeNameImpl` | `aemsite.DisallowedFileNameChars` | AEM Site の出力ファイル名に、アンダースコアに置き換える文字を追加します。 <br> **デフォルト値**: ``'<\>\`@$`` |

**親トピック：**[&#x200B;ファイル名を設定](conf-file-names.md)

