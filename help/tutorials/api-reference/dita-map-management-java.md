---
title: DITA マップを操作する Java ベースの API
description: DITA マップを操作する Java ベースの API について説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '1027'
ht-degree: 0%

---

# DITA マップを操作する Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用して、AEMガイドで DITA マップを操作できます。 これらの API は、バンドルの形式で使用できます。 これらの API を使用するには、コードにこのバンドルを含める必要があります。

バンドルの詳細：

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.2**

- パッケージ： **com.adobe.fmdita.api.maps**

- クラスの詳細：

  ```JAVA
  public class MapUtilities extends Object
  ```

  MapUtilities クラスには、DITA マップファイルからメタデータ情報を取得するメソッドが含まれます。


## 依存を含む DITA マップをダウンロード

The `zipMapWithDependents` メソッドは、DITA マップと、参照トピック、サブマップ、画像、DTD などのすべての依存を含む.zip ファイルを作成します。 DITA マップ用の.zip ファイルは、指定されたベースラインに基づいて作成されます。

また、同じ構造（親フォルダーと子フォルダー）を維持するか、すべての依存ファイルに対して 1 つのフォルダー内にフラットファイル構造を作成することもできます。

>[!IMPORTANT]
>
> 依存ファイルが見つからない場合、API は例外をスローし、.zip ファイルの作成に失敗します。

**構文**：

```JAVA
public static void zipMapWithDependents(Session session, 
                     String sourcePath, 
                     String baseline, 
                     OutputStream outputStream,
                     boolean flatFS) 
                     throws RepositoryException, IOException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|ダウンロードする必要がある DITA マップファイルのパス\(AEMリポジトリ内\)。| |`outputStream`|java.io.OutputStream|ZIP を書き込むストリーム。| |`baseline`|String|バージョン管理されたコンテンツを取得するために使用されるベースラインのタイトル。 <br> **注意：** 値では大文字と小文字が区別されます。| |flatFS|Boolean|\（オプション\）true に設定した場合、ZIP ファイルにフラット構造が返されます。 例えば、DITA マップが複数のフォルダー内のコンテンツを参照する場合、参照されるすべてのファイルが 1 つのフォルダーに取り込まれます。 同じ名前のファイルが存在する場合、それらのファイルの名前は数値サフィックスを追加することで変更されます。 すべての参照\（DITA マップおよびトピック\）は、フラットフォルダー構造内のファイルの新しい場所に基づいて更新されるので、自動的に処理されます。 false に設定した場合、フォルダー構造は ZIP ファイル内でそのまま維持されます。 DITA マップが複数の場所のファイルを参照する場合、それらのすべての場所も ZIP ファイル内に作成されます。 ZIP ファイルを復元すると、保存先の場所に正確なフォルダー構造が作成されます。 <br> このパラメータのデフォルト値は false です。|

**戻り値**:ZIP のコンテンツは、 `outputStream`.

**例外**：スロー ``javax.jcr.RepositoryException``, `java.io.IOException`.

## 依存を持つ DITA マップをダウンロード\（非同期\）

または、非同期モードで、依存を含む DITA マップをダウンロードできます。 この方法は、より大きな DITA マップでより便利です。

The `zipMapWithDependents` メソッドは、DITA マップと、参照トピック、サブマップ、画像、DTD などのすべての依存を含む.zip ファイルを作成します。 DITA マップ用の.zip ファイルは、指定されたベースラインに基づいて作成されます。

また、同じ構造（親フォルダーと子フォルダー）を維持するか、すべての依存ファイルに対して 1 つのフォルダー内にフラットファイル構造を作成することもできます。

>[!NOTE]
>
> このノードは、output.history.purgetime 設定（定義されている場合）またはデフォルトで 5 日後に自動削除されます。

**構文**：

```JAVA
public static CompletableFuture<Node> zipMapWithDependencies(Session session,
                     String sourcePath, 
                     String baseline, 
                     boolean flatFS) 
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|ダウンロードする必要がある DITA マップファイルのパス\(AEMリポジトリ内\)。| |`baseline`|String|バージョン管理されたコンテンツを取得するために使用されるベースラインのタイトル。 <br> **注意：** 値では大文字と小文字が区別されます。| |flatFS|Boolean|\（オプション\）true に設定した場合、ZIP ファイルにフラット構造が返されます。 例えば、DITA マップが複数のフォルダー内のコンテンツを参照する場合、参照されるすべてのファイルが 1 つのフォルダーに取り込まれます。 同じ名前のファイルが存在する場合、それらのファイルの名前は数値サフィックスを追加することで変更されます。 すべての参照\（DITA マップおよびトピック\）は、フラットフォルダー構造内のファイルの新しい場所に基づいて更新されるので、自動的に処理されます。 false に設定した場合、フォルダー構造は ZIP ファイル内でそのまま維持されます。 DITA マップが複数の場所のファイルを参照する場合、それらのすべての場所も ZIP ファイル内に作成されます。 ZIP ファイルを復元すると、保存先の場所に正確なフォルダー構造が作成されます。<br> このパラメータのデフォルト値は false です。|

**戻り値**:zip ファイルのノードは、 `CompletableFuture`クラス。 ユーザーは、引き続き非同期で処理でき、を使用できます。 `.get()`ノードが必要な場合にスレッドをブロックする未来のメソッド。 返される値はエラーで終わる場合もあり、で処理できます。 `.exceptionally()` メソッド。

## ベースラインのリストを取得する

The ``getBaselineList`` メソッドは、指定された DITA マップに存在するすべてのベースラインのリストを取得します。

**構文**：

```JAVA
public static List<HashMap<String,String>> getBaselineList( 
                  javax.jcr.Session session, 
                  String sourcePath)
                  throws javax.jcr.RepositoryException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|ベースライン情報を取得する DITA マップファイルのパス\(AEMリポジトリ内\)。|

**戻り値**: `HashMap` オブジェクト。 各 `HashMap` オブジェクトは、ベースラインを表し、ベースラインの名前とタイトルを含みます。

**例外**：スロー ``javax.jcr.RepositoryException``.

## 条件付きプリセットのリストの取得

The ``getConditionalPresetList`` メソッドは、特定の DITA マップに存在するすべての条件付きプリセットのリストを取得します。

**構文**：

```JAVA
public static List<HashMap<String,String>> getConditionalPresetList (
                  javax.jcr.Session session,
                  String sourcePath)
                  throws javax.jcr.RepositoryException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|条件付きプリセット情報を取得する DITA マップファイルのパス\(AEMリポジトリ内\)。|

**戻り値**: `HashMap` オブジェクト。 各 `HashMap` オブジェクトは、条件付きプリセットを表し、条件付きプリセットの名前とタイトルを含みます。

**例外**：スロー ``javax.jcr.RepositoryException``.

## 条件付きプリセットの DITAVAL ファイル情報を取得する

The ``getDitavalFromConditionalPreset`` メソッドは、指定された DITA マップの条件付きプリセットに対応する DITAVAL ファイルのパスを取得します。

**構文**：

```JAVA
public static String getDitavalFromConditionalPreset
    (Session session,
    String sourcePath, 
    String cpName) throws RepositoryException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`session`|javax.jcr.Session|有効な JCR セッション。| |`sourcePath`|String|DITAVAL ファイルを取得する DITA マップファイルのパス\(AEMリポジトリ内\)。| |`cpName`|文字列|DITAVAL ファイルを取得する DITA マップ内の条件付きプリセットの名前。|

**戻り値**:DITA マップファイルで定義された条件付きプリセットに対応する DITAVAL ファイルのパス。

## ノードのすべての依存関係を取得する

The ``getAllDependencies`` メソッドは、指定されたノードのすべての依存関係を返します。

**構文**：

```JAVA
public static List
<Node> getAllDependencies 
(Node rootNode) throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |`rootNode`|javax.jcr.Node|すべての依存関係を取得するルートノード。|

**戻り値**：ルートノードのすべての依存関係を含むノードリスト。
