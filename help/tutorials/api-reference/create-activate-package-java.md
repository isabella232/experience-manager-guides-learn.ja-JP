---
title: パッケージを作成およびアクティベートするための Java ベースの API
description: パッケージを作成およびアクティブ化するための Java ベースの API について説明します。
source-git-commit: fad5049962f258bbe59c7d172436d82b3d6cd68f
workflow-type: tm+mt
source-wordcount: '470'
ht-degree: 0%

---


# パッケージを作成およびアクティベートするための Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用して、CRX パッケージを作成し、アクティベートできます。 この API は、バンドルの形式で使用できます。 この API を使用するには、コードにこのバンドルを含める必要があります。

バンドルの詳細：

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.3**

- パッケージ： **com.adobe.fmdita.api.crxactivate**

- クラスの詳細：

  ```JAVA
  public class CRXActivator
  ```

  The **`CRXActivator`** クラスには、CRX パッケージを作成し、パブリッシュインスタンス上でレプリケートするためのメソッドが含まれます。


## パッケージの作成とアクティベート

The `activate` メソッドは、オーサーインスタンス上に CRX パッケージを作成し、必要に応じてパブリッシュインスタンス上にレプリケートします。 AEMレプリケーションパラメーターは、オーサーインスタンスで既に設定されていると想定されます。 このメソッドは、JSON 文字列内の入力パラメーターとして提供されるルールのリストに基づいて CRX パッケージを作成します。
>[!NOTE]
>
> 作成またはアクティベーションプロセス中に発生したエラーは、 `outputstream`.

**構文**：

```JAVA
public static void activate
(
  String json, 
  OutputStream outputstream, 
  Session session
) 
throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`json`|String|構築する CRX パッケージを決定する JSON 文字列。 次の形式を使用して JSON 文字列を作成します。 <br>- `activate`: Boolean 型\(`true`/`false`\) です。 オーサーインスタンスで作成された CRX パッケージをパブリッシュインスタンスにレプリケートするかどうかを指定します。 <br> - `rules`:JSON 配列型です。 CRX パッケージを構築するために順番に処理される JSON ルールの配列。 <br> - `rootPath`:String 型です。 ノード/プロパティのクエリが実行されるベースパス。 ノード/プロパティクエリが存在しない場合、ルートパスと、ルートパスの下に存在するすべてのノードが CRX パッケージに含まれます。 <br> - `nodeQueries`:Regex Array 型です。 ルートパスの下に特定のファイルを含めるために使用される正規表現の配列。 <br> - `propertyQueries`:JSON 配列型です。 各 JSON オブジェクトを持つ JSON オブジェクトの配列。ルートパスで実行される XPath クエリと、クエリの実行後に各 JCR ノードに存在するプロパティの名前で構成されます。 各 JCR ノードのプロパティの値は、パスまたはパスの配列である必要があります。 このプロパティに存在するパスが CRX パッケージに追加されます。| |`outputstream`|java.io.OutputStream|クエリの実行、ファイルのインクルージョン、CRX パッケージの作成、アクティベーションなど、様々なステージの結果を書き込むために使用します。 作成またはアクティベーションプロセス中に発生したエラーは、 `outputstream`. これはデバッグに役立ちます。| |`session`|String|有効な JCR セッション（アクティベーション権限を持つ）。|

**例外**：スロー ``java.io.IOException``.

**例**：次の例は、JSON クエリの作成方法を示しています。

```JSON
{
  "activate": true,
  "rules": [
    {
      "rootPath": "/content/dam/nested",
      "nodeQueries": [
        ".*\\.jpg",
        ".*\\.png",
        ".*\\.gif"        
      ]
    },
    {
      "rootPath": "/content/output/sites/hierarchy_ditamap"
    },
    {
      "rootPath": "/content/output/sites/hierarchy_ditamap",
      "propertyQueries": [
        {
          "query": "//*[@fileReference]",
          "property": "fileReference"
        }
      ]
    }
  ]
}
```

JSON クエリの例は、次のルールで構成されています。

- /content/dam/nested パスの下の.png、.jpg および.gif 画像のみがパッケージに含まれます。
- /content/output/sites/hierarchy\_ditamap の下のすべてのノードがパッケージに含まれます。
- 次に存在するパス： `fileReference` /content/output/sites/hierarchy\_ditamap の下のノードのプロパティがパッケージに含まれます。

