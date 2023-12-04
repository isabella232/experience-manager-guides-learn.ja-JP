---
title: 出力生成と連携する Java ベースの API
description: 出力生成と連携する Java ベースの API について説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '160'
ht-degree: 0%

---

# 出力生成と連携する Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用して、DITA マップの出力を生成できます。 この API は、バンドルの形式で使用できます。 この API を使用するには、コードにこのバンドルを含める必要があります。

バンドルの詳細：

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.4**

- パッケージ： ****com.adobe.fmdita.api.maps****

- クラスの詳細：

  ```JAVA
  public class **PublishUtils** extends Object
  ```

  The **`PublishUtils`** クラスには、1 つ以上の出力プリセットの出力を生成するメソッドが含まれています。


## 出力を生成

The ``generateOutput`` メソッドは、指定した出力プリセットを使用して DITA マップファイルの出力を生成します。

**構文**：

```JAVA
public static void generateOutput(Session session,
String sourcePath,
String outputName)
throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |``sourcePath``|String|出力を生成する必要がある DITA マップファイルのパス\(AEMリポジトリ内\)。| |``outputName``|String|出力の生成に使用する出力プリセットの名前。 複数の出力プリセットは、例えばパイプ (「\|」) の区切り文字を使用して指定できます。 `aemsite\|pdfoutput`.|

**例外**：スロー ``javax.jcr.RepositoryException``, `java.io.IOException`、および `java.lang.Exception`.
