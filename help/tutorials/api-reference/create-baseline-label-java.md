---
title: ベースラインとラベルを操作する Java ベースの API
description: ベースラインとラベルを操作する Java ベースの API について説明します。
source-git-commit: fad5049962f258bbe59c7d172436d82b3d6cd68f
workflow-type: tm+mt
source-wordcount: '878'
ht-degree: 0%

---


# ベースラインとラベルを操作する Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用すると、ベースラインを作成し、ベースライン内のファイルにラベルを追加できます。 これらの API は、バンドルの形式で使用できます。 これらの API を使用するには、コードにこのバンドルを含める必要があります。

バンドルの詳細：

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.5**

- パッケージ： **com.adobe.fmdita.api.baselines**

- クラスの詳細：

  ```JAVA
  public class BaselineUtils extends Object
  ```

  The **BaselineUtils** クラスには、ベースラインを作成し、ベースライン内のファイルにラベルを適用するメソッドが含まれます。


## ベースラインを作成

ベースライン作成メソッドには 2 つのバージョンがあります。1 つはXML Documentationソリューションバージョン 3.5 用、もう 1 つは 3.5 リリースより前のバージョン用です（3.4、3.3 および 3.2\のバージョンを含む）。 バージョン 3.5 API を使用すると、ラベル、直接参照、間接参照をマップファイル内に使用してベースラインを作成できます。

他のバージョンの API では、日時を使用してベースラインを作成します。 この API は、XML Documentationソリューション 3.4、3.3 または 3.2 を使用するシステムとの下位互換性を確保するために保持されます。

**構文\（バージョン 3.5 の場合\）**:

```JAVA
public static String createBaseline(Session session, 
String sourcePath, 
String baselineTitle, 
String label, 
LinkedHashMap directContext, 
LinkedHashMap indirectContext) 
throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。 ユーザーセッションには、DITA マップの読み取り権限と書き込み権限の両方が必要です。また、ベースラインに含まれるすべての参照ファイルの読み取り権限が必要です。| |`sourcePath`|String|AEMリポジトリ内の DITA マップファイルの絶対パス。| |`baselineTitle`|String|ベースラインの一意のタイトル。| |`label`|String|指定されたラベルが適用されているトピックのバージョンを選択します。| |`directContext`|LinkedHashMap&lt;string object=&quot;&quot;>|直接参照されるトピック「(content)」が選択されている設定に基づき、マップでの順序に従ってバージョンが解決されます。 <br> マップのすべてのキーで反復処理が実行された後にバージョンが見つからない場合、ベースライン作成プロセスは失敗します。 <br> HashMap が空の場合（デフォルトでは空で null マップではなく空のマップを送信）、デフォルトでは次のように設定されます。 <br>`directContext.put("label", label);` <br> `directContext.put("latest", true);` <br> ベースライン作成で特定のラベルのバージョンのみを選択し、そのようなバージョンが存在しない場合は失敗する場合は、 `label` キーと、ベースラインを作成するラベルを指定します。| |`indirectContext`|LinkedHashMap&lt;string object=&quot;&quot;>|間接的に参照されるトピック「（参照されるコンテンツ）」が選択されている設定に基づいて、マップでの順序に従ってバージョンが解決されます。 <br> マップのすべてのキーで反復処理が実行された後にバージョンが見つからない場合、ベースライン作成プロセスは失敗します。 <br> HashMap が空の場合（デフォルトでは空で null マップではなく空のマップを送信）、デフォルトでは次のように設定されます。 <br>`indirectContext.put("label", label);` <br>`indirectContext.put "pickAutomatically", null);` <br> バージョンを自動的に取得する代わりに最新のバージョンにする場合は、次を置き換えます。 <br>`indirectContext.put("pickAutomatically", null);` <br> _次を使用：_ <br>`indirectContext.put("latest", true)`|

**戻り値**：ベースラインの名前（JCR リポジトリ内のベースラインのノード名）。 DITA マップのベースラインページで、新しく作成したベースラインのタイトルがユーザーに表示されます。

**例外**：スロー ``ItemExistExceptiom`` 同じタイトルのベースラインが既に存在する場合。

**構文\（バージョン 3.4、3.3、3.2\の場合）**

```JAVA
public static String createBaseline
(Session session, 
String sourcePath, 
String baselineTitle, 
Date versionDate) throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。 ユーザーセッションには、DITA マップの読み取り権限と書き込み権限の両方が必要です。また、ベースラインに含まれるすべての参照ファイルの読み取り権限が必要です。| |``sourcePath``|String|AEMリポジトリ内の DITA マップファイルの絶対パス。| |`baselineTitle`|String|ベースラインの一意のタイトル。| |`versionDate`|日付|ベースラインは、この日付と同様に、トピックのバージョン（DITA マップから直接参照）を使用して作成されます。 日付を `d-MM-yyyy H:mm` 形式|

**戻り値**：ベースラインの名前（JCR リポジトリ内のベースラインのノード名）。 DITA マップのベースラインページで、新しく作成したベースラインのタイトルがユーザーに表示されます。

**例外**：スロー ``RepositoryException.``

## ラベルの適用

The ``applyLabel`` メソッドは、ベースライン内のファイルに 1 つ以上のラベルを適用します。

**構文**：

```JAVA
public static void applyLabel(Session session,
                  String sourcePath,
                  String baselineName,
                  String label)
                  throws RepositoryException, WorkflowException, Exception
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|AEMリポジトリ内の DITA マップファイルの絶対パス。| |``baselineName``|String|ラベルを適用するベースラインノードの名前。 ベースラインノードの名前を取得するには、 [\#id185NFF0085Z](#id185NFF0085Z) メソッドを使用するか、CRXDE で DITA マップのベースラインノードを確認します。<br> **注意：** ラベルは、ベースライン内のマップファイルから直接参照されるファイルのバージョンに適用されます。| |`label`|String|ベースライン内のファイルに適用されるラベル。 ラベルに次の文字が含まれていないことを確認してください： &amp;sol; &amp;comma; &amp;colon; &amp;comma; &amp;lbrack; &amp;comma; &amp;rbrack; &amp;comma; &amp;vert; &amp;comma; &amp;ast; <br> 複数のラベルを設定する場合は、ラベルをコンマで区切ります（例：Label1, Label2）。|

**例外**：スロー `RepositoryException`.

## ラベルを削除

The ``deleteLabel`` メソッドは、ベースライン内のファイルから 1 つ以上のラベルを削除します。

**構文**：

```JAVA
public static Map
<String, String> deleteLabel(Session session, 
String sourcePath, 
String baselineName, 
String label) throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|AEMリポジトリ内の DITA マップファイルの絶対パス。| |`baselineName`|文字列|ラベルを削除する基準線の名前。 <br> **注意：** ラベルは、ベースライン内のマップファイルから直接参照されるファイルのバージョンから削除されます。| |`label`|String|ベースライン内のファイルから削除するラベル。 <br> 複数のラベルを削除する場合は、ラベルをコンマで区切ります（例：Label1、Label2）。|

**戻り値**：を使用したマップ *key:value* 一対の `path:deletedlabels` ベースライン内のすべてのファイルに対して。

**例外**：スロー ``RepositoryException`, `VersionException`, `Exception``.

