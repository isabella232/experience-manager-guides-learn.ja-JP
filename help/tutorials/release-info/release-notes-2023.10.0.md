---
title: リリースノート | 2023 年 10 月リリースのAdobe Experience Managerガイドでのアップグレード手順と修正された問題
description: バグ修正と、Adobe Experience Managerガイドの 2023 年 10 月リリースへのアップグレード方法について説明します。as a Cloud Service
exl-id: fb1b74d7-25f2-4a20-9248-44dfdabf553d
source-git-commit: e8503e1441b7bc365d37c76ab9cf7b5f50374f10
workflow-type: tm+mt
source-wordcount: '1017'
ht-degree: 2%

---

# 2023 年 10 月リリースのAdobe Experience Managerガイドas a Cloud Service

このリリースノートでは、アップグレードの手順、互換性マトリックス、Adobe Experience Managerガイドの 2023 年 10 月バージョンで修正された問題 ( 後で *AEMガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [AEMガイドの 2023 年 10 月リリースの新機能as a Cloud Service](whats-new-2023.10.0.md).

## 2023 年 10 月リリースへのアップグレード

次の手順に従って、現在のAEM Guidesas a Cloud Service設定をアップグレードします。

1. Cloud Serviceの Git コードを確認し、アップグレードする環境に対応するCloud Serviceパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServiceGit コードを2023.10.0.373に保存します。
3. 変更をコミットし、Cloud Serviceパイプラインを実行して、2023 年 10 月リリースのAEM Guides as a Cloud Serviceにアップグレードします。

## サーブレットを介したスクリプトのトリガーを有効にする手順

(2023 年 6 月リリースより前のバージョンのAEMガイドをas a Cloud Serviceの場合のみ )

インストールが完了したら、「トリガーを押して翻訳ジョブを開始」を選択できます。

POST:

```
http://localhost:4503/bin/guides/script/start?jobType=translation-map-upgrade
```

応答:

```
{
"msg": "Job is successfully submitted and lock node is created for future reference",
"lockNodePath": "/var/dxml/executor-locks/translation-map-upgrade/1683190032886",
"status": "SCHEDULED"
}
```

前の応答 JSON では、キー `lockNodePath` は、送信されたジョブを指す、リポジトリで作成されたノードへのパスを保持します。 ジョブが完了すると自動的に削除され、それまでは、このノードを参照してジョブの現在のステータスを確認できます。

このジョブが完了するまで待ってから、次の手順に進みます。

>[!NOTE]
>
> ノードがまだ存在するかどうか、およびジョブのステータスを確認する必要があります。

```
GET
http://<aem_domain>/var/dxml/executor-locks/translation-map-upgrade/1683190032886.json
```

## リンク切れレポートを使用するために既存のコンテンツを後で処理する手順

(2023 年 6 月リリースより前のバージョンのAEMガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツを後処理し、新しい壊れたリンクレポートを使用するには、次の手順を実行します。

1. （オプション）システムに 100,000 個を超える DITA ファイルがある場合、 `queryLimitReads` under `org.apache.jackrabbit.oak.query.QueryEngineSettingsService` を大きい値 ( 存在するアセットの数（例：200,000）を超える値 ) に設定し、再デプロイします。

   - 指示に従い、 *設定の上書き* 設定ファイルを作成するには、 Adobe Experience Manager Guides のインストールと設定をas a Cloud Service的に行ってください。
   - 設定ファイルで、次の（プロパティ）詳細を指定して queryLimitReads オプションを設定します。

     | PID | プロパティキー | プロパティの値 |
     |---|---|---|
     | org.apache.jackrabbit.oak.query.QueryEngineSettingsService | queryLimitReads | 値：200000デフォルト値：100000 |

1. サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server:port>//bin/guides/reports/upgrade`.

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port>/bin/guides/reports/upgrade?jobId= {jobId}`
( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678`)

1. ジョブが完了すると、前のGETリクエストへの応答が成功します。 何らかの理由でジョブが失敗した場合は、サーバーログから失敗を確認できます。

1. のデフォルト値または以前の既存の値に戻す `queryLimitReads` 手順 1 で変更した場合。

## 「レポート」タブの新しい検索と置換、およびトピックリストを使用するために既存のコンテンツをインデックス化する手順は次のとおりです。

(2023 年 6 月リリースより前のバージョンのAEMガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツのインデックス作成に関する次の手順を実行し、「レポート」タブのマップレベルおよびトピックリストで新しい検索と置換テキストを使用します。

1. POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. （オプション）マップの特定のパスを渡してインデックスを作成できます。デフォルトでは、すべてのマップにインデックスが作成されます。例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`)

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 例えば `http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test` などのファイルです。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


1. ジョブが完了すると、前のGETリクエストが成功と応答し、マップに失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## 互換性マトリックス

この節では、2023 年 10 月のリリースにas a Cloud ServiceしたAEMガイドでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.10.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.10.0 | 3.2-uuid 5 | 3.2-uuid 5 | 2.3 | 2.3 |
|  |  |  |  |


### ナレッジベーステンプレートバージョン

| コンポーネントのパッケージ名 | コンポーネントのバージョン | テンプレートバージョン |
|---|---|---|
| AEM Guides コンポーネントCloud Service用コンテンツパッケージ | dxml-components.all-1.2.2 | aem-site-template-dxml.all-1.0.15 |

## 修正された問題

様々な領域で修正されたバグを以下に示します。

### オーサリング

- 午後の時間は **日付** ベースラインの作成。 (12712)
- JSON コードを `<codeblock>` Web エディターの要素。 (12326)
- 未保存のバージョンの変更と、それらのインジケーターは、大きなファイルには表示されません。 (11784)
- 韓国語で編集する場合、最初の文字がデフォルトに変更されます。 (10049)


### 公開

- ネイティブPDF |トピック出力の生成時に、PDFの順序は修正されません。 (13157)
- ネイティブPDF|デフォルトのスタイルタグは使用できません `<p>`要素を選択します。 (12559)
- ネイティブPDF |コンテンツ領域に適用されたインラインスタイルは、前面と背面のトピックには適用されません。 (13510)
- The `DeliveryTarget` AEM Site 出力の生成時に属性が伝播しない。  (13132)
- The **公開** 特定のエラーが発生したコンテンツのAEM Site 出力を生成する際に、ワークフローが停止することがありました。 (12000)

### 管理

- バージョン履歴は、 `dc:format` プロパティがアセットに存在しません。 (10463)


### レビュー

- トピックのレビューで、誤ったコメントが表示されます。 (13453)



### 翻訳

- から書き出されたベースライン **翻訳** ダッシュボードが失敗し、ターゲット言語で開かれない。 (13466)

- 選択した既存の翻訳プロジェクトに新しいジョブを追加する代わりに、新しい翻訳プロジェクトが作成されます。  (10214)

## 既知の問題

Adobeは、2023 年 10 月リリースで次の既知の問題を特定しました。

- コンテンツフラグメントの再公開が失敗します。

