---
title: 出力管理用の REST API
description: 出力管理用の REST API について説明します。
source-git-commit: 4dcd90422f02f3b45aa74137fe58609962b09b49
workflow-type: tm+mt
source-wordcount: '1171'
ht-degree: 0%

---


# 出力管理用の REST API {#id175UB30E05Z}

AEMガイドの出力の管理には、次の REST API を使用できます。

## DITA マップのすべての出力プリセットを取得します {#get-output-presets-dita-map}

DITA マップ用に設定されたすべての出力プリセットを取得するPOSTメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**:\
|名前|型|必須|説明| |—|—|—|—| |`:operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 `getalloutputs`.<br> **注意：** 値では大文字と小文字が区別されません。| |`sourcePath`|String|はい|DITA マップファイルの絶対パス。|

**応答値**:JSON 出力プリセットオブジェクトの配列を戻します。各オブジェクトには次の要素が含まれます。

| 要素 | 説明 |
|-------|-----------|
| `outputName` | 出力プリセットの名前。 出力名は、定義されている DITA マップの範囲で一意です。 |
| `outputType` | このプリセットを使用して生成される出力のタイプ ( 例：AEMサイト、PDF、EPUBなど )。 使用可能なオプションは次のとおりです。<br>- AEMSITE <br>-PDF <br>-HTML5 <br>-EPUB <br> — カスタム |
| `outputTitle` | 出力プリセット設定のわかりやすい名前。 これは、出力プリセットの「設定名」プロパティの値を定義するために使用されます。 |
| `ditaValPathList` | 必要な出力の生成に使用する DITAVAL ファイルパスの配列。 |
| `targetPath` | 出力が公開または保存されるパス。 |
| `siteName` | *\(AEM Site 出力用 )* AEM Site の名前。 |
| `templatePath` | *\(AEM Site 出力用 )* 目的の出力の生成に使用するテンプレートノードのパス。 |
| `searchScope` | 検索操作の範囲を指定します。 このパラメーターの値はに設定する必要があります `local`. |
| `generateTOC` | *\(AEM Site 出力用 )* TOC が生成されるか\(true\) 生成されないか\(false\) を指定します。 |
| `generateBreadcrumbs` | *\(AEM Site 出力用 )* パンくずリストを生成するか\(true\) しないか\(false\) を指定します。 |
| `overwriteStrategy` | *\(AEM Site 出力用 )* 宛先のファイルが上書きされるか\(true\)、\(false\) のどちらでないかを指定します。 |
| `pdfGenerator` | 使用するPDF生成エンジンを指定します。 次の値を指定できます。<br>- DITAOT <br>- FMPS |

>[!NOTE]
>
> `DitaValPath` 要素はサポートされなくなりました。

## 出力プリセットを作成

DITA マップの新しい出力プリセットを作成するPOSTメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`:operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 ``createoutput``.<br> **注意：** 値では大文字と小文字が区別されません。| |`sourcePath`|String|はい|DITA マップファイルの絶対パス。| |`outputTitle`|String|はい|出力プリセット設定のわかりやすい名前。 これは、出力プリセットの「設定名」プロパティの値を定義するために使用されます。<br> **注意：** 新しい出力プリセットが作成されると、バックエンドシステムは、指定されたタイトルからの出力プリセットの一意の名前を駆動します。| |`outputType`|文字列|はい|このプリセットを使用して生成される出力のタイプ (AEMサイト、PDF、EPUBなど )。 使用可能なオプションは次のとおりです。<br>- AEMSITE <br>-PDF <br>-HTML5 <br>-EPUB <br> — カスタム|

**応答値**: |要素|説明| |—|—| |`outputName`|新しく作成された出力プリセットの一意の名前。 この名前は `outputTitle` パラメーター。|

## 出力プリセットを保存

出力プリセットでおこなった変更を保存するPOST方法。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`:operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 ``saveoutput``.<br> **注意：** 値では大文字と小文字が区別されません。| |`sourcePath`|String|はい|DITA マップファイルの絶対パス。| |`outputObj`|String|Yes|更新中の出力プリセットのプロパティを含む JSON オブジェクト。 The `outputObj.outputName` プロパティには、更新する出力プリセットの名前が含まれます。 JSON オブジェクトの形式については、 **応答値** テーブル [DITA マップのすべての出力プリセットを取得します](#get-output-presets-dita-map).|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

## 特定の出力プリセットの取得

既存の出力プリセットを取得するPOSTメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`:operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 `getoutput`. <br>**注意：** 値では大文字と小文字が区別されません。| |`sourcePath`|String|はい|DITA マップファイルの絶対パス。| |`outputName`|文字列|はい|詳細を取得する必要がある出力プリセットの名前。|

**応答値**: |要素|説明| |—|—| |`outputName`|出力プリセットの名前。 出力名は、定義されている DITA マップの範囲で一意です。| |`outputType`|このプリセットを使用して生成される出力のタイプ (AEMサイト、PDF、EPUBなど )。 使用可能なオプションは次のとおりです。<br>- AEMSITE <br>-PDF <br>-HTML5 <br>-EPUB <br> — カスタム <br>| |`outputTitle`|出力プリセット設定のわかりやすい名前。 これは、出力プリセットの「設定名」プロパティの値を定義するために使用されます。| |`ditaValPathList`|目的の出力の生成に使用する DITAVAL ファイルのパスの配列。| |`targetPath`|出力が公開または保存されるパス。| |`siteName`|\(AEM Site の出力\) AEMサイトの名前。| |`siteTitle`|\(AEM Site の出力用\)AEMサイトのタイトル。| |`templatePath`|\(AEM Site の出力用\) 目的の出力の生成に使用するテンプレートノードのパス。| |`searchScope`|検索操作の範囲を指定します。 このパラメーターの値はに設定する必要があります `local`.| |`generateTOC`|\(AEMサイト出力の場合\)TOC が生成されるか\(true\) 生成されないか\(false\) を指定します。| |`generateBreadcrumbs`|\(AEMサイト出力の場合\) パンくずリストを生成するか\(true\) 生成しないか\(false\) を指定します。| |`overwriteFiles`|\(AEM Site の出力の場合\) 宛先のファイルが上書きされるか\(true\)、\(false\) のどちらでないかを指定します。| |`pdfGenerator`|使用するPDF生成エンジンを指定します。 次の値を指定できます。<br>- DITAOT <br>- FMPS|

>[!NOTE]
>
> `DitaValPath` 要素はサポートされなくなりました。

## 出力を生成

1 つ以上の出力プリセットを使用して出力を生成するGETメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 `GENERATEOUTPUT`.<br> **注意：** 値では大文字と小文字が区別されます。| |`source`|String|はい|DITA マップファイルの絶対パス。| |`outputName`|文字列|はい|出力の生成に使用する出力プリセットの名前。 複数の出力プリセットは、例えばパイプ (「\|」) の区切り文字を使用して指定できます。 `aemsite|pdfoutput`.|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

## 増分出力を生成

1 つ以上の出力プリセットを使用してAEM Site の増分出力を生成するGETメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 `INCREMENTALPUBLISH`. <br>**注意：** 値では大文字と小文字が区別されます。| |`contentPath`|JSON|はい|DITA マップファイルとトピックファイルの絶対パスと出力プリセットの名前。 構築ブロックとして次の例を使用します。|

```XML
{
   {   
   "ditamap": 
      "/content/dam/sample/sample.ditamap",   
   "topics": [     
      "/content/dam/sample/topic1.xml",     
      "/content/dam/sample/topic2.xml"   
         ],   
   "fullMaps": [     
      "/content/dam/sample/submap.ditamap"   
      ],   
   "maps": [     
      "/content/dam/sample/keyspace.ditamap"   
      ],   
   "outputs": [     
      "aemsite"   
      ] 
   }
}
```

- The `ditamap` 属性は、出力の生成に使用される DITA マップの絶対パスを取ります。
- The `topics` 属性は、更新され、再パブリッシュする必要があるトピックの配列を取ります。
- The `fullMaps` 属性には、増分出力生成に必要なマップファイル（まとまったサブマップなど）のパスとトピックが含まれます。
- The `maps` 属性には、トピックを含まないディスク上で抽出されたマップファイル（キースペース参照の解決用）のパスが含まれます。
- The `outputs` 属性は、出力の生成に使用される出力プリセット名の配列を取ります。

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

## 出力プリセットを削除

出力プリセットを削除するPOSTメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/publishlistener

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`:operation`|String|はい|呼び出される操作の名前。 このパラメーターの値は、 `deleteoutput`.<br> **注意：** 値では大文字と小文字が区別されません。| |`sourcePath`|String|はい|DITA マップファイルの絶対パス。| |`outputName`|String|はい|削除する出力プリセットの名前。|

**応答値**:HTTP 200 \(Successful\) 応答を戻します。

