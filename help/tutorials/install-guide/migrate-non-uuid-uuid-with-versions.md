---
title: UUID 以外のコンテンツをバージョン付きで UUID コンテンツに変換
description: UUID 以外のコンテンツをバージョンで移行する方法を説明します。
source-git-commit: 33cdc1b14db0d123c01bbc719c2833ce0df4c9d9
workflow-type: tm+mt
source-wordcount: '1272'
ht-degree: 3%

---




# UUID 以外のコンテンツのバージョンでの移行

次の手順を実行して、UUID 以外のコンテンツをバージョン付きで UUID コンテンツに移行します。

## 互換性マトリックス

| 現在のAEM Guides バージョン（非 UUID） | UUID に移行するために必要なバージョン | サポートされるアップグレードパス |
|---|---|---|
| 3.8.5 | 4.0 非 UUID | 4.1(UUID) をインストールし、移行を実行します。 |
| 4.0、4.0.x、4.1 または 4.1.x | 現在の非 UUID と同じ | 4.1(UUID) をインストールし、移行を実行します。 |
| 4.2 以降 | 該当なし | 未サポート |

## 必要なパッケージ

1. **バージョンのパージ**: `com.adobe.guides.version-purge-1.0.11.zip` （オプション）
1. **移行前**: `com.adobe.guides.pre-uuid-migration-1.0.7.zip`
1. **移行**: `com.adobe.guides.uuid-upgrade-1.0.17`
1. **移行後**: `com.adobe.guides.post-uuid-migration-1.0.2.zip`


## 移行前

1. （オプション）コンテンツに対してバージョンのパージを実行して、不要なバージョンを削除し、移行プロセスを高速化します。 バージョン 4.1（4.0 ではサポートされていません）でバージョンのパージを実行するには、パッケージをインストールします。 `com.adobe.guides.version-purge-1.0.11.zip`をクリックし、この URL を使用してユーザーインターフェイスに移動します。 `http://<server-name> /libs/fmdita/clientlibs/xmleditor_version_purge/page.html`.

   >[!NOTE]
   >
   >このユーティリティは、ベースラインまたはレビューで使用されるバージョンや、ラベルを持つバージョンを削除しません。
1. 移行前のパッケージ (`com.adobe.guides.pre-uuid-migration-1.0.7.zip`) をクリックします。

1. 次のクエリを実行して、移行に要する時間の推定時間 (ETA) を示すレポートを取得し、移行しないコンテンツの問題を含むファイルがある場合にレポートします。

>[!NOTE]
>
>移行を実行するには、管理者権限が必要です。


| エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
|---|---|---|---|
| `/bin/guides/pre_uuid_upgrade` <br> <br>**例：**: http://localhost:4502/bin/guides/pre_uuid_upgrade?root=/content/dam | GET | **root**：ルートフォルダー<br> **値**: `/content/dam` リポジトリ全体に対して。 | ファイル数、合計バージョン数、エラー数を一覧表示する移行前レポート (.csv) が作成されます。 <br><br> **サンプル出力**:<br>RootFolder: /content/dam <br>合計ファイル数： 2697 <br>合計バージョン数：10380 <br>エラーが発生したファイルの数： 28 <br>詳細なレポートは、AEM CRX の `/content/uuid-pgrade/UuidMigrationReport_1688400131039.csv` |

システムに多数の DITA ファイルがある場合、この手順が失敗する可能性があります。 これに対処するには、 *メモリ内読み取り制限 (queryLimitReads)* 100000の Apache Jackrabbit Query Engine Settings Service で、システム内に存在する DITA アセットの合計数より大きい数値を指定します。

## 移行

### 手順 1：設定を更新

1. 移行中にAEM（crx-quickstart ディレクトリ）が取る領域の少なくとも 10 倍に空き領域があることを確認します。 移行が完了したら、圧縮を実行して、ディスク容量のほとんどを再利用できます ( [リビジョンのクリーンアップ](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/revision-cleanup.html?lang=ja)) をクリックします。

1. 有効にする *後処理ワークフローランチャーの有効化* in `com.adobe.fmdita.config.ConfigManager` および *バージョンの後処理を有効にする* in `com.adobe.fmdita.postprocess.version.PostProcessVersionObservation.`

1. UUID 以外のバージョンに対して、サポートされているリリースの UUID バージョンをインストールします。 例えば、4.0 非 UUID ビルドまたは 4.1 非 UUID ビルドを使用している場合、UUID バージョン 4.1 をインストールする必要があります。

1. UUID 移行用の新しいパッケージをインストールします (`com.adobe.guides.uuid-upgrade-1.0.17`) をクリックします。

1. 次のワークフローおよび実行中の他のワークフローを無効にする `/content/dam` ランチャーの使用 `http://localhost:4502/libs/cq/workflow/content/console.html`.

   * DAM アセットの更新ワークフロー
   * DAM メタデータ書き戻しワークフロー

1. 無効にする *後処理ワークフローランチャーの有効化* in `com.adobe.fmdita.config.ConfigManager` および無効化 *バージョンの後処理を有効にする* in `com.adobe.fmdita.postprocess.version.PostProcessVersionObservation`.

1. プロパティ検証を有効にする (`validation.enabled`) を Day CQ Tagging Service で使用します。

1. 以下を確認します。 `uuid.regex` プロパティフォルダーがに正しく設定されている `com.adobe.fmdita.config.ConfigManager`. 空白の場合は、デフォルト値 ( `^GUID-(?<id>.*)`.
1. 別のロガーを `com.adobe.fmdita.uuid.upgrade.UuidUpgrade` ブラウザーの応答は、 `/content/uuid-upgrade/logs`.

### 手順 2：スクリプトの実行と検証

より小さいデータを含むフォルダーで指定されたクエリを実行してから、そのフォルダーでクエリを実行します。 `/content/dam`.

>[!TIP]
>
>フォルダー内のすべてのファイルが正しくアップグレードされたかどうか、およびすべての機能がそのフォルダーに対してのみ機能するかどうかを確認できます。

| エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
|---|---|---|---|
| `/bin/guides/uuid_upgrade`<br><br> **例：**: `http://localhost:4502/bin/guides/uuid_upgrade?root=/content/dam/test` | GET | **root**：ルートフォルダー <br>**値**：リポジトリ全体の/content/dam。<br><br>**ignoreImageVersions**<br> **値**: true または false( 画像のバージョンの処理を無視します。 デフォルト値は false です )。 | ファイルのリストが正常に移行され、アップグレードに失敗し、エラーが発生してアップグレードし、合計時間がかかった移行レポート。 <br><br> **サンプル出力**: <br> [情報] 失敗したファイルのリスト： 0 <br>[情報] いいえ。 正常にアップグレードされたファイルの数： 2241 <br>[情報] いいえ。 次のエラーでアップグレードされたファイルの数： 28 <br>[情報] いいえ。 /個のファイルをアップグレードできませんでした： 0 <br> [情報] 合計所要時間： 0:37:03.131 |

>[!NOTE]
>
> コンテンツの移行は、フォルダーレベルで実行するか、完了してから実行できます `/content/dam` または同じフォルダー上（移行を再実行）

また、DITA コンテンツで使用した画像やグラフィックなど、すべてのメディアアセットに対しても、コンテンツの移行を確実におこなうことが重要です。

#### ベースライン移行

移行済みのフォルダーでクエリを実行し、そのフォルダーのベースラインを移行します。

| エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
|---|---|---|---|
| `/bin/guides/baseline_uuid_upgrade`<br><br> **例：**: ` http://localhost:4502/bin/guides/baseline_uuid_upgrade?root=/content/dam/test` | GET | **root**：ルートフォルダー <br> **値**：リポジトリ全体の/content/dam。 <br><br> **ignoreImageVersions**<br> **値**: true/false <br>( 画像バージョンの処理を無視します。 デフォルト値は false です )。 <br><br> **doReviews** <br> **値**: true/false <br> ( レビューをアップグレードする必要があるかどうか。 デフォルト値は false です。) ファイルのリストが正常に移行され、アップグレードに失敗し、エラーが発生してアップグレードし、合計時間がかかった移行レポート。 <br> <br> **サンプル出力**:<br>[情報] 失敗したファイルのリスト <br> [情報] いいえ。 2241 に正常にアップグレードされたファイルの数<br> [情報] いいえ。 28 個のエラーでアップグレードされたファイル<br>[情報] いいえ。 /個のファイルをアップグレードできませんでした 0<br>[情報] 合計所要時間： 0:37:03.131 |


### 手順 3：設定の復元

サーバーが正常に移行されたら、後処理、タグ付け、および次のワークフロー（移行時に最初に無効になったその他すべてのワークフローを含む）を有効にして、サーバー上で作業を続行します。

* DAM アセットの更新ワークフロー
* DAM メタデータワークフロー

>[!NOTE]
>
>移行前に一部のファイルが処理されないか破損し、移行前に破損し、移行後も破損したままになる場合。

## 移行の検証

1. UUID 移行後パッケージ (`com.adobe.guides.post-uuid-migration-1.0.2.zip`) をクリックします。

1. 次のクエリを実行して、移行中にエラーが発生せず、リンクが壊れていることを検証します。 このスクリプトは、以前に壊れていなかったが、何らかの理由で現在は壊れているリンクがあるかどうかを識別します。

   | エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
   |---|---|---|---|
   | `/bin/guides/get_broken_links` <br> <br> **例：**:<br>`http://localhost:4502/bin/guides/get_broken_links` | GET | 該当なし | UUID の壊れたファイルの総数とそれぞれのファイルパスを含む移行レポート。 <br> <br> **サンプル出力**:<br>[デバッグ] これらの GUID がすべてコンテンツで使用されているかどうかを確認します。<br>[デバッグ] UUID が壊れている可能性があるファイルの総数： 0 <br>[デバッグ] パスで UUID が壊れている可能性がある：0 |

1. 移行が完了したら、圧縮を実行してディスク領域のほとんどを再利用できます ( `https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/revision-cleanup.html?lang=en`) をクリックします。

## 差分コンテンツ移行

1. 差分コンテンツをアクティブなサーバー（非 UUID）から現在の UUID サーバーに移行するには、非 UUID サーバーに移行前スクリプトをインストールします。

1. データセット（またはサブフォルダー）全体で次のクエリを実行して、指定されたタイムスタンプの後に変更されたすべてのファイルを識別してエクスポートします。タイムスタンプは、日時に ISO8601 形式 (YYYY-MM-DDTHH) を使用します。:mm:ss.SSSZ) を含み、YYYY-MM-DD などの部分表現も可能です。

   | エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
   |---|---|---|---|
   | `/bin/guides/data_export`<br><br>**例：**: <br> `http://localhost:4502/bin/guides/data_export?timestamp=2023-07-11&root=/content/dam` | GET | **timestamp** <br> **値**: YYYY-MM-DD<br><br> **root**：ルートフォルダー <br> **値**: `/content/dam` リポジトリ全体に対して。 | 差分コンテンツを含む zip ファイルが/var/dxml/exports に作成されます。 <br> <br>**サンプル**: dataexport_1689761491218.zip （ファイルが作成されます） |

1. スクリプトで書き出した zip ファイルをダウンロードします。 応答の最後の行には、生成された zip ファイルのパスが表示されます（システムの/var/dxml/exports に保存されています）。

1. Assets UI の目的のパスで、zip ファイルを uuid サーバーにアップロードします。

1. 移行後のパッケージが uuid サーバーにインストールされていることを確認します。

1. 次の指定したクエリを実行して、アップロードされた zip ファイルからシステムに差分コンテンツをインポートします。 データを正しく識別および処理するには、クエリにアップロードされた zip ファイルのパスを含める必要があります。

   | エンドポイント URL | リクエストタイプ | クエリパラメーター | 期待される結果 |
   |---|---|---|---|
   | `/bin/guides/data_import`<br> **例：**:`http://localhost:4502/bin/guides/data_import?path=/content/dam/dataexport_1689344927551.zip&createVersion=true` | POST | **path**<br> **値**: `/content/dam/filename.zip`（アップロードされたファイルの場所） **createVersion** <br> **値**: true/false<br>（createVersion のデフォルト値は false です）。 | ファイルは目的のコンテンツパスにアップロードされます。<br><br>**サンプル**: `dataexport_1689761491218.zip`<br><br> ( 前の手順で書き出したのと同じファイルが、 `/content/dam`) をクリックします。 |

1. スクリプトは、新しいファイルが存在しない場合は新しいファイルを作成し、変更された場合は既存のファイルを上書きします。

>[!NOTE]
>
> バージョン履歴およびサーバー上でおこなわれたその他の変更（ワークフローやレビューなど）は、手動で更新する必要があります。
