---
title: リリースノート | Adobe Experience Managerガイド（2023 年 9 月）リリースのアップグレード手順と修正された問題
description: バグ修正とAdobe Experience Managerガイドの 2023 年 9 月リリースへのアップグレード方法について説明します。as a Cloud Service
source-git-commit: 3f79dfbc747b3d2efc05608d05df6ba45e53d877
workflow-type: tm+mt
source-wordcount: '1458'
ht-degree: 3%

---

# 2023 年 9 月リリースのAdobe Experience Manager Guidesas a Cloud Service

このリリースノートでは、アップグレードの手順、互換性マトリックス、Adobe Experience Managerガイドの 2023 年 9 月バージョンで修正された問題 ( 後で *AEMガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [2023 年 9 月リリースのAEM Guidesas a Cloud Serviceの新機能](whats-new-2023.9.0.md).

## 2023 年 9 月リリースにアップグレード

次の手順に従って、現在のAEM Guidesas a Cloud Service設定をアップグレードします。

1. Cloud Serviceの Git コードを確認し、アップグレードする環境に対応するCloud Serviceパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServiceGit コードを 2023.9.0.359 に変更します。
3. 変更をコミットし、Cloud Serviceパイプラインを実行して、2023 年 9 月リリースのAEM Guidesas a Cloud Serviceにアップグレードします。

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

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 （例：`http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test`）。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


1. ジョブが完了すると、前のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションされます。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## 互換性マトリックス

この節では、2023 年 9 月リリースのAEMガイドでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.09.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.09.0 | 3.1-uuid 17 | 3.1-uuid 17 | 2.3 | 2.3 |
|  |  |  |  |


### ナレッジベーステンプレートバージョン

| コンポーネントのパッケージ名 | コンポーネントのバージョン | テンプレートバージョン |
|---|---|---|
| AEM Guides コンポーネントCloud Service用コンテンツパッケージ | dxml-components.all-1.2.2 | aem-site-template-dxml.all-1.0.15 |

## 修正された問題

様々な領域で修正されたバグを以下に示します。

### オーサリング

- Web エディターでは、トピックファイルのロックが解除されません。「ファイルをロック解除」オプションと「保存しない」オプションが選択されています。 (12558)
- チェックイン前に変更を破棄する NO オプションを選択したにもかかわらず、Web エディタでファイルをチェックアウトできません。 (12557)
- Web エディター内のメインツールバーの「ファイルをロック/ロック解除」アイコンのツールチップが、リポジトリビューに表示されるアイコンと一致しない。(12555)
- マップビューでチェックアウトされていない Web エディタのファイルに対して、[ チェックアウトをキャンセル ] および [ ロック解除 ] オプションが表示されます。 (12556)
- 既存の「topicref」リンクでPDFアセットを選択できません。 (12477).
- リポジトリ表示では、検索/フィルタ機能を使用した後にトピックまたは画像をドラッグすることはできません。 (12396)
- 検索したファイルを 1 つ開くと、[ 検索と置換 ] パネルで検索結果が無効になります。 (12142)
- AEM Guides エディターで、サイドキーボードの「8」番号キーが機能しない。 (12106)

- プレフィックスは、Web エディターのプレビューモードで複製されます。 (13133)
- `Choicetable` 行が表示されないか、選択できません。 (12616)
- Web エディターは、カスタムスキーマを使用してトピックを作成する場合、特定のシナリオで検証エラーをスローします。 (12576)
- マップテンプレートからマップを作成する場合、同様のトピックテンプレート参照でコンテンツフォルダにコピーが作成されない。 (12150)
- DITA マップの検索ボックスに閉じるボタンがありません。 (11867)
- Web エディタで長いファイルを保存する場合、 `DirtyChecker` 長いスタックトレースを伴う例外をスローし、ログファイルを埋めます。 (11860)
- DITA トピックを作成するには、対応するフォルダーノードに対する削除権限が必要ですが、マップは書き込み権限で作成できます。 (11706)
- スラッシュが存在する場合、Web エディターに正しくないタイトルが表示されます。 (10949)


### 管理

- DITA マップメタデータプロパティの「タイトル」フィールドは、 `<title>` マップの要素。 (10702)
- トピック ID が GUID と異なる場合、コンテンツ参照がコピー&amp;ペースト DITA ファイルに壊れています。 (12614)
- 動的ベースラインでは、DITA マップの作業用コピーの直接参照からラベルのリストが取り出されません。 (11917)

### 公開

- 公開時にネイティブアプリセットの名前を変更すると、PDFに失敗します。 (12564)
- ネイティブテンプレートの複製は、指定されたPDFの場所ではなく、デフォルトのテンプレートの場所に複製されます。 (12563)

- ネイティブPDF |複数の外部参照を含めると、文字が列の幅を超えて拡張されます。 (13004)
- ネイティブPDF |トピックとタイトルが同じ ID の場合、正しくない生成のPDF出力が発生します。 (12644)
- ネイティブPDF |親に output クラスを追加する際 `<topicref>` 要素を DITA マップに追加し、カスタムスタイルを output クラスに適用すると、スタイルはトピック本文内の要素（セクションタイトルを含む）に適用されます。(12166)
- DITA マップに複数の ditavalrefs がある場合、増分公開は機能しません。 (12117)
- AEM Site | keydef でトピックを変数として指すマップを作成し、 processing-role=resource-only を追加すると、一部の予期しないページが作成されます。 (12099)
- AEM DAM のアセットがAEMサイト以外の出力で使用されている場合、メタデータ「jcr:createdBy」は、DITA マップまたはトピックを最後に変更した発行者の名前やユーザー名を反映しません。 (12090)
- AEM Sites | navtitle のトピックヘッド（サポートされていない文字）を使用した DITA マップは、無効なページ URL になります。 (11978)
- ネイティブPDF | Frontmatter と Backmatter で topichead / topicmeta / navtitle のサポートで問題が発生しました。 (11969)
- ネイティブPDF |大きなドキュメントのPDFの生成には時間がかかります。 (11955)
- ネイティブPDF |プリセット名を変更すると、NullPointerException がスローされ、PDF出力が生成されます。 (11889)
- The `<conref>` コンテンツがPDF出力に表示されない。 (11131)
- 余分なスペースが `<div>` ページレイアウトエディターでのオーサービューとソースビューの切り替えに関する要素 (10750)
- AEM Cloud Manager でレプリケートされたコンテンツは、パブリッシュインスタンスでは表示されません。 (9564)

### 翻訳

- 翻訳の名前が変更されたベースラインを書き出すプロセスは失敗します。 (12993)
- ソースファイルのタイトルの代わりに、翻訳済みファイルのタイトルが表示されます。 (11630)




