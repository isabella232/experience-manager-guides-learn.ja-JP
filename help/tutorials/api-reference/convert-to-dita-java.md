---
title: 変換ワークフロー用の Java ベースの API
description: コンバージョンワークフロー用の Java ベースの API について説明します。
source-git-commit: fad5049962f258bbe59c7d172436d82b3d6cd68f
workflow-type: tm+mt
source-wordcount: '258'
ht-degree: 0%

---


# 変換ワークフロー用の Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用して、HTMLおよび Word 文書を DITA 形式に変換できます。 これらの API は、バンドルの形式で使用できます。 これらの API を使用するには、コードにこのバンドルを含める必要があります。

**バンドルの詳細**:

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.2**

- パッケージ： **com.adobe.fmdita.api.conversion**

- クラスの詳細：

  ```JAVA
  public class ConversionUtils extends Object
  ```

  The **ConversionUtils** クラスには、HTMLおよび Word 文書を DITA 形式に変換するメソッドが含まれます。


## 変換HTML文書

The `convertHtmlToDita` メソッドは、HTML文書を DITA 形式に変換します。

**構文**：

```JAVA
public static void convertHtmlToDita(Session session, 
                  String inputFile, 
                  String destPath, 
                  boolean createRev) 
                  throws RepositoryException, WorkflowException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`inputFile`|String|AEMリポジトリ内のソースHTMLファイルの絶対パス。| |`destPath`|String|変換された DITA ファイルを保存する宛先の場所の絶対パス。| |`createRev`|Boolean|ファイルのリビジョンを作成するかどうかを指定します\( `true`\) 指定された宛先でのみ\( `false`\) です。 これは、変換先の場所に、変換されたファイルの既存のバージョンが含まれている場合にのみ考慮されます。|

**例外**：スロー `RepositoryException`.

## Word 文書の変換

The ``convertWordToDita`` メソッドは、Word 文書を DITA 形式に変換します。

**構文**：

```JAVA
public static void convertWordToDita(Session session, 
                  String inputFile,
                  String destPath, 
                  String style2tagMap, 
                  boolean createRev) 
                  throws RepositoryException, WorkflowException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`inputFile`|String|AEMリポジトリ内のソース Word ファイルの絶対パス。| |`destPath`|String|変換された DITA ファイルを保存する宛先の場所の絶対パス。| |`style2tagMap`|String|変換に使用するスタイルマッピングファイルの絶対パス。| |`createRev`|Boolean|ファイルのリビジョンを作成するかどうかを指定します\( `true`\) 指定された宛先でのみ\( `false`\) です。 これは、変換先の場所に、変換されたファイルの既存のバージョンが含まれている場合にのみ考慮されます。|

**例外**：スロー `RepositoryException`.

