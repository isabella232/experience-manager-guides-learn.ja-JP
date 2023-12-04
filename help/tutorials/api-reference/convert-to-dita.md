---
title: 変換ワークフロー用の REST API
description: 変換ワークフロー用の REST API について説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '391'
ht-degree: 0%

---

# 変換ワークフロー用の REST API {#id175UB30E05Z}

次の REST API を使用して、Word、HTMLおよびInDesignのドキュメントを DITA 形式に変換できます。

## Word 文書の変換

Word 文書を DITA 形式に変換するGETメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/fmdita/conversion

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |``operation``|String|はい|呼び出される操作の名前。 このパラメーターの値は、 ``word2dita``. <br> **注意：** 値では大文字と小文字が区別されません。 | |`inputFile`|String|はい|AEMリポジトリ内のソース Word ファイルの絶対パス。| |`destPath`|String|はい|変換された DITA ファイルが保存される保存先の絶対パス。| |`createRev`|Boolean|はい|ファイルのリビジョンを作成するかどうかを指定します\( `true`\) 指定された宛先でのみ\( `false`\) です。 これは、変換先の場所に、変換されたファイルの既存のバージョンが含まれている場合にのみ考慮されます。| |`style2tagMap`|String|はい|変換に使用されるスタイルマッピングファイルの絶対パス。|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

## 変換HTML文書

GET文書を DITA 形式にHTMLする変換メソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/fmdita/conversion

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 ``html2dita``. <br> **注意：** 値では大文字と小文字が区別されません。| |`inputFile`|String|はい|AEMリポジトリ内のソースHTMLファイルの絶対パス。| |`destPath`|String|はい|変換された DITA ファイルが保存される保存先の絶対パス。| |`createRev`|Boolean|はい|ファイルのリビジョンを作成するかどうかを指定します\( `true`\) 指定された宛先でのみ\( `false`\) です。 これは、変換先の場所に、変換されたファイルの既存のバージョンが含まれている場合にのみ考慮されます。|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

## 変換InDesign文書

GET文書を DITA 形式にInDesignする変換メソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/fmdita/conversion

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |``operation``|String|はい|呼び出される操作の名前。 このパラメーターの値は、 ``idml2dita``. <br> **注意：** 値では大文字と小文字が区別されません。| |`inputFile`|String|はい|AEMリポジトリ内のソースInDesignファイルの絶対パス。| |`destPath`|String|はい|変換された DITA ファイルが保存される保存先の絶対パス。| |`createRev`|Boolean|はい|ファイルのリビジョンを作成するかどうかを指定します\( `true`\) 指定された宛先でのみ\( `false`\) です。 これは、変換先の場所に、変換されたファイルの既存のバージョンが含まれている場合にのみ考慮されます。|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。
