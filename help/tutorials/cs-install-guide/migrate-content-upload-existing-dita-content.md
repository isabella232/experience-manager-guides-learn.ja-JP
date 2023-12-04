---
title: 既存の DITA コンテンツのアップロード
description: 既存の DITA コンテンツのアップロード方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '499'
ht-degree: 0%

---

# 既存の DITA コンテンツのアップロード {#id176FF000JUI}

ほとんどの場合、AEMガイドで使用する既存の DITA コンテンツのリポジトリが存在する可能性があります。 このような既存のコンテンツに対しては、 [Adobe Experience Manager as a Cloud Service Assets へのデジタルアセットの追加](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/manage/add-assets.html).

## UUID ファイル名パターンの設定

コンテンツを読み込む場合、ファイル名が UUID に基づく必要はありません。 UUID ベースのファイル名を使用するシステムでは、すべてのファイルが、元のファイル名ではなく UUID を使用して参照される必要があります。 読み込んだファイルに UUID ベースのファイル名がない場合は、UUID をファイルプロパティに追加するようにシステムを設定できます。 その後、この UUID は、UUID がファイルの命名に使用されない場合に、このようなファイルを参照するために使用されます。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。 設定ファイルで、次の\(property\) 詳細を指定して UUID ファイル名パターンを設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `uuid.regex` | UUID ファイル名パターンの正規表現を指定する文字列。 <br> ファイルが指定されたパターンに従わない場合、UUID がファイルのプロパティに追加され、ファイルへの参照はすべて、ファイルに割り当てられた UUID で更新されます。 <br> **デフォルト値**: `"^GUID-(?<id>.*)"` |

## curl コマンドの使用

curl コマンドを使用して、DAM でフォルダーを作成したり、ファイルをアップロードしたり、アップロードされたコンテンツにメタデータを追加したりすることもできます。

**フォルダーの作成**

次のコマンドを実行して、AEMリポジトリにフォルダーを作成します。

```
curl --user <username>:<password> --data jcr:primaryType=sling:Folder "<server folder path>"
```

フォルダーを作成するには、次のパラメーターを指定します。

- `<username>:<passowrd>`:AEMリポジトリにアクセスするためのユーザー名とパスワードを指定します。 このユーザーは、フォルダーの作成権限を持っている必要があります。

- `jcr:primaryType=sling:Folder`：このパラメーターを指定します。 *現状* フォルダータイプのリソースを作成する場合。

- `<server folder path>`:AEMリポジトリで作成する新しいフォルダーの名前を含む完全なフォルダーパス。 例えば、次のようにパスを指定した場合、 `http://192.168.1.1:4502/content/dam/projects/AEM-Guides`を選択し、次にフォルダー `AEM-Guides` が `projects` フォルダーを DAM に追加します。


**ファイルのアップロード**

次のコマンドを実行して、AEMリポジトリにファイルをアップロードします。

```
curl --user <username>:<password> -T "<local file path>" "<server folder path>"
```

ファイルをアップロードするには、次のパラメーターを指定します。

- `<username>:<passowrd>`:AEMリポジトリにアクセスするためのユーザー名とパスワードを指定します。 このユーザーは、 `server folder path`.

- ``local file path``：アップロードするローカルシステム上の完全なファイルパス。

- `<server folder path>`：ファイルをアップロードするAEMサーバー上の完全なフォルダーパス。


**メタデータを追加**

次のコマンドを実行して、ファイルにメタデータを追加します。

```
curl --user <username>:<password> -F<attribute name>=<value> <metadata node path>
```

メタデータ情報を追加するには、次のパラメーターを指定します。

- `<username>:<passowrd>`:AEMリポジトリにアクセスするためのユーザー名とパスワードを指定します。 このユーザーは、 ``metadata node path``.

- ``-F<attribute name>=<value>``: `<attribute name>` は、メタデータ属性の名前です。例えば、 `audience` そして `<value>` は、 `internal`. 複数の属性の名前と値のペアをスペースで区切って指定できます。

- `<metadata node path>`：ファイル名とそのメタデータノードを含む完全なフォルダーパス。 例えば、次のようにパスを指定した場合、 `http://192.168.1.1:4502/content/dam/projects/AEM-Guides/intro.xml/jcr:content/metadata`を指定した場合、指定したメタデータ情報が `intro.xml` ファイル。


**親トピック：**[&#x200B;既存のコンテンツを移行](migrate-content.md)
