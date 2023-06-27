---
title: データソースコネクタの設定
description: データソースコネクタの設定方法を説明します
source-git-commit: 760d765a364a49aaff8787eea4f067b3f0e25103
workflow-type: tm+mt
source-wordcount: '387'
ht-degree: 1%

---


# データソースコネクタの設定

AEMガイドは、JIRA および SQL(MySQL、PostgreSQL、SQL Server、SQLite) データベース用の既製のコネクタを提供します。 既定のインターフェイスを拡張して、他のコネクタを追加することもできます。 次の設定を使用すると、様々なデータソースを簡単に追加できます。 追加したデータソースは、Web エディターで表示できます。

次の手順を実行して、データソースコネクタを設定し、Web エディターから使用します。

## コネクタの設定

JSON ファイルをアップロードして、標準コネクタを設定できます。 次のサンプルのセットアップファイルを使用して、Jira および SQL(MySQL、PostgreSQL、SQL Server、SQLite) データベース用のコネクタを設定できます。

ユーザー名とパスワードを使用した Jira の基本認証のサンプルセットアップファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.rest.JiraConnector",
	"configName": "Jira",
	"templateFolders": ["/content/dam/dita-templates/konnect/jira"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.rest.BasicAuthRestConfig",
		"configData": {
			"username": "jirausername",
			"password": "jirapassword",
			"url": "https://jira.corp.adobe.com/rest/api/latest/search"
		}
	}
}
```

例： `jira.json`.

トークンを使用した Jira の基本認証のサンプルセットアップファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.rest.JiraConnector",
	"configName": "Jira",
	"templateFolders": ["/content/dam/dita-templates/konnect/jira"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.rest.BasicAuthRestConfig",
		"configData": {
			"token": "jiraauthtoken",
			"url": "https://jira.corp.adobe.com/rest/api/latest/search"
		}
	}
}
```

例： `jira.json`.

「Basic」キーワードが含まれるトークンを使用した Jira の基本認証のサンプルセットアップファイルを次に示します。

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.rest.JiraConnector",
	"configName": "Jira",
	"templateFolders": ["/content/dam/dita-templates/konnect/jira"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.rest.BasicAuthRestConfig",
		"configData": {
			"token": "Basic jiraauthtoken",
			"url": "https://jira.corp.adobe.com/rest/api/latest/search"
		}
	}
}
```

例： `jira.json`.

MySQL の基本認証用のサンプルセットアップファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.sql.MySqlConnector",
	"configName": "MySQL",
	"templateFolders": ["/content/dam/dita-templates/konnect/sql"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.sql.UserPassSqlConfig",
		"configData": {
			"username": "admin",
			"password": "admin",
			"driver": "com.mysql.jdbc.Driver",
			"connectionString": "jdbc:mysql://host.corp.adobe.com:3306/plm"
		}
	}
}
```

例： `mysql.json`.

PostgreSQL の基本認証用のサンプル設定ファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.sql.PostgreSqlConnector",
	"configName": "PostgreSQL",
	"templateFolders": ["/content/dam/dita-templates/konnect/sql"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.sql.UserPassSqlConfig",
		"configData": {
			"username": "admin",
			"password": "admin",
			"driver": "org.postgresql.Driver",
			"connectionString": "jdbc:postgresql://host:port/database"
		}
	}
}
```

例： `postgres.json`.

MS SQL Server の基本認証用のサンプルセットアップファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.sql.MsSqlServerConnector",
	"configName": "MSSQLServer",
	"templateFolders": ["/content/dam/dita-templates/konnect/sql"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.sql.UserPassSqlConfig",
		"configData": {
			"username": "admin",
			"password": "admin",
			"driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver",
			"connectionString": "jdbc:sqlserver://10.10.10.10\\SQLEXPRESS01:1433;database=TutorialDB;encrypt=false;trustServerCertificate=true"
		}
	}
}
```

例： `mssqlserver.json`.

SQLite の基本認証用のサンプル設定ファイル：

```
{
	"connectorClazz": "com.adobe.guides.konnect.definitions.ootb.connector.sql.SqliteConnector",
	"configName": "SQLiteServer",
	"templateFolders": ["/content/dam/dita-templates/konnect/sql"],
	"connectionConfig": {
		"configClazz": "com.adobe.guides.konnect.definitions.ootb.config.sql.UserPassSqlConfig",
		"configData": {
			"username": "admin",
			"password": "admin",
			"driver": "org.sqlite.JDBC",
			"connectionString": "jdbc:sqlite:sample.db"
		}
	}
}
```

例： `sqqlite.json`.

### コネクタ設定のカスタマイズ

AEMガイドでは、ユーザーのニーズに合わせて設定ファイルの一部の値をカスタマイズできます。

| プロパティ名 | 説明 |
|---|---|
| configName | ユーザーは、コネクタを識別するのに役立つ設定名を指定できます |
| templateFolders | テンプレートの取得元フォルダーのリスト |

その他のフィールドは、コネクタを実行するように選択された config クラスに基づいてカスタマイズされます。

## ファイルをAEMの場所にアップロードします

ファイルをAEM Assetsの任意の場所にアップロードします。

例：`/var/dxml/konnect/jira.json`

## REST API を使用した設定の作成

設定は、REST API を使用して登録できます。 詳しくは、 *データソースコネクタを登録する REST API* 『 Adobe Experience Managerガイド』の API リファレンスの節を参照してください。

データソースを設定すると、Web エディターのデータソースパネルにコネクタが表示されます。 その後、データソースに接続し、トピックにコンテンツスニペットを挿入できます。 詳しくは、 [データソースからコンテンツスニペットを挿入する](../user-guide/web-editor-content-snippet.md).

