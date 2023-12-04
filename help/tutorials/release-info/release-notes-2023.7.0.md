---
title: リリースノート | Adobe Experience Managerガイド（2023 年 7 月）リリースのアップグレード手順と修正された問題
description: バグ修正とAdobe Experience Managerガイドの 2023 年 7 月リリースへのアップグレード方法について説明します。as a Cloud Service
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '926'
ht-degree: 1%

---

# 2023 年 7 月リリースのAdobe Experience Manager Guidesas a Cloud Service

このリリースノートでは、Adobe Experience Managerガイドのバージョン 2023 年 7 月 ( 後で *AEMガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [2023 年 7 月リリースのAEMガイドas a Cloud Serviceの新機能](whats-new-2023.7.0.md).

## 2023 年 7 月リリースにアップグレード

次の手順に従って、現在のAEM Guidesas a Cloud Service設定をアップグレードします。

1. Cloud Serviceの Git コードを確認し、アップグレードする環境に対応するCloud Serviceパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServiceGit コードを 2023.7.0.314 に設定します。
3. 変更をコミットし、Cloud Serviceパイプラインを実行して、2023 年 7 月リリースのAEM Guides as a Cloud Serviceにアップグレードします。

## サーブレットを介したスクリプトのトリガーを有効にする手順

(2023 年 6 月リリースより前のバージョンのAEMガイドをas a Cloud Serviceの場合のみ )

インストールが完了したら、「トリガーを押して翻訳ジョブを開始」を選択できます。

POST:

```
http://localhost:4503/bin/guides/script/start?jobType=translation-map-upgrade
```

応答：

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

1. （オプション）システム内に 100,000 個を超える DITA ファイルがある場合、 `queryLimitReads` under `org.apache.jackrabbit.oak.query.QueryEngineSettingsService` を大きい値 ( 存在するアセットの数（例：200,000）を超える値 ) に設定し、再デプロイします。

   - に示す手順を使用します。 *設定の上書き* 設定ファイルを作成するには、 Adobe Experience Manager Guides のインストールと設定をas a Cloud Service的に行ってください。
   - 設定ファイルで、次の（プロパティ）詳細を指定して queryLimitReads オプションを設定します。

     | PID | プロパティキー | プロパティの値 |
     |---|---|---|
     | org.apache.jackrabbit.oak.query.QueryEngineSettingsService | queryLimitReads | 値：200000デフォルト値：100000 |

1. サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server:port>//bin/guides/reports/upgrade`.

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port>/bin/guides/reports/upgrade?jobId= {jobId}`
( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678`)

1. ジョブが完了すると、以前のGETリクエストが成功して応答します。 何らかの理由でジョブが失敗した場合は、サーバーログから失敗を確認できます。

1. のデフォルト値または以前の既存の値に戻す `queryLimitReads` 手順 1 で変更した場合。

## 「レポート」タブの新しい検索と置換、およびトピックリストを使用するために既存のコンテンツをインデックス化する手順は次のとおりです。

(2023 年 6 月リリースより前のバージョンのAEMガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツのインデックス作成に関する次の手順を実行し、「レポート」タブのマップレベルおよびトピックリストで新しい検索と置換テキストを使用します。

1. POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. （オプション）マップの特定のパスを渡してインデックスを作成できます。デフォルトでは、すべてのマップにインデックスが作成されます。例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`)

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 例：`http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test`。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


1. ジョブが完了すると、前のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションされます。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## 互換性マトリックス

この節では、AEMガイド (as a Cloud Service) の 2023 年 7 月リリースでサポートされるソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.07.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.07.0 | 2.9-uuid-2 | 2.9-uuid-2 | 2.3 | 2.3 |
|  |  |  |  |


## 修正された問題

様々な領域で修正されたバグを以下に示します。

### オーサリング

- Web エディターのレイアウトビューには、インライン/表示属性が表示されません。 (12498)
- AEMガイド用 Oxygen Plugin でファイルをアップロードするが、クラウドサービスでは動作しない。 をクリックします。 (12207)
- 編集可能なテンプレートを使用すると、DITA マップの公開が非常に遅くなります。 (12075)
- グローバルプロファイル UI 設定がフォルダープロファイルと一致しません。 (11970)
- DITA ファイルをコピーして貼り付けると、コンテンツ参照が壊れます。 (11959)
- AEM Guides がインストールされている場合、列表示でコンテンツフラグメントを編集できない。 (7342)
- ラップ解除された外部参照がサブ要素タグの下にある場合、コンテンツは失われます。 (12532)

### 公開

- 右側のパネルの「ファイル」プロパティから「終了状態」に変更された docstate は、承認ワークフローが機能しません。 (11026)
