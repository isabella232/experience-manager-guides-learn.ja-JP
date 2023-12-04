---
title: リリースノート | Adobe Experience Managerガイド（2023 年 12 月リリース）のアップグレード手順と修正された問題
description: バグ修正と、Adobe Experience Managerガイドas a Cloud Serviceの 2023 年 12 月リリースへのアップグレード方法について説明します。
source-git-commit: b4bbed1de8fc2d8ef81332445a5c96161be508d4
workflow-type: tm+mt
source-wordcount: '1319'
ht-degree: 1%

---

# 2023 年 12 月リリースのAdobe Experience Manager Guides as a Cloud Service

このリリースノートでは、アップグレードの手順、互換性マトリックス、およびバージョン 2023 年 12 月のAdobe Experience Managerガイドas a Cloud Service( 後で *Experience Managerガイドas a Cloud Service*) をクリックします。

新機能および機能強化の詳細については、「 [2023 年 12 月リリースのExperience Managerガイドas a Cloud Service](whats-new-2023.12.0.md).

## 2023 年 12 月リリースにアップグレード

次の手順を実行して、現在のExperience Managerガイドのas a Cloud Service設定をアップグレードします。

1. Cloud Serviceの Git コードを確認し、アップグレードする環境に対応するCloud Serviceパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServiceGit コードを2023.12.0.16に保存します。
3. 変更をコミットし、Cloud Serviceパイプラインを実行して、2023 年 12 月リリースのExperience Managerガイドas a Cloud Serviceにアップグレードします。

## サーブレットを介したスクリプトのトリガーを有効にする手順

(2023 年 6 月リリースより前のバージョンのExperience Managerガイドをas a Cloud Serviceの場合のみ )

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

前の応答 JSON では、キー `lockNodePath` は、送信されたジョブを指す、リポジトリで作成されたノードへのパスを保持します。 ジョブが完了すると、ジョブは自動的に削除されます。その後、このノードを参照してジョブのステータスを確認できます。

このジョブが完了するまで待ってから、次の手順に進みます。

>[!NOTE]
>
> ノードがまだ存在するかどうか、およびジョブのステータスを確認する必要があります。

```
GET
http://<aem_domain>/var/dxml/executor-locks/translation-map-upgrade/1683190032886.json
```

## リンク切れレポートを使用するために既存のコンテンツを後で処理する手順

(2023 年 6 月リリースより前のバージョンのExperience Managerガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツを後処理し、新しい壊れたリンクレポートを使用するには、次の手順を実行します。

1. （オプション）システムに 100,000 個を超える DITA ファイルがある場合、 `queryLimitReads` および `queryLimitInMemory` under `org.apache.jackrabbit.oak.query.QueryEngineSettingsService` を大きい値 ( 存在するアセットの数（例：200,000）を超える値 ) に設定し、再デプロイします。

   - 指示に従い、 *設定の上書き* 設定ファイルを作成するには、 Adobe Experience Manager Guides のインストールと設定をas a Cloud Service的に行ってください。
   - 設定ファイルで、次の（プロパティ）詳細を指定して、 `queryLimitReads` および `queryLimitInMemory` オプション：

     | PID | プロパティキー | プロパティの値 |
     |---|---|---|
     | org.apache.jackrabbit.oak.query.QueryEngineSettingsService | queryLimitReads | 値：200000デフォルト値：100000 |
     | org.apache.jackrabbit.oak.query.QueryEngineSettingsService | queryLimitInMemory | 値：200000デフォルト値：100000 |

1. サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server>//bin/guides/reports/upgrade`.

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server>/bin/guides/reports/upgrade?jobId= {jobId}`
( 例： `http://localhost:8080/bin/guides/reports/upgrade?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678`)

1. ジョブが完了すると、前のGETリクエストへの応答が成功します。 何らかの理由でジョブが失敗した場合は、サーバーログから失敗を確認できます。

1. のデフォルト値または以前の既存の値に戻す `queryLimitReads` 手順 1 で変更した場合。

## 「レポート」タブの新しい検索と置換、およびトピックリストを使用するために既存のコンテンツをインデックス化する手順は次のとおりです。

(2023 年 6 月リリースより前のバージョンのExperience Managerガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツのインデックス作成に関する次の手順を実行し、「レポート」タブのマップレベルおよびトピックリストで新しい検索と置換テキストを使用します。

1. サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server:port>/bin/guides/map-find/indexing`. ( オプション：インデックスを作成するマップの特定のパスを渡すことができます。デフォルトでは、すべてのマップのインデックスが作成されます||例： `https://<Server:port>/bin/guides/map-find/indexing?paths=<map_path_in_repository>`)

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 例：`http://<server:port>/bin/guides/map-find/indexing?root=/content/dam/test`。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port>/bin/guides/map-find/indexing?jobId={jobId}`( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678`)


1. ジョブが完了すると、前のGETリクエストが成功と応答し、マップに失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## を処理する手順 `'fmdita rewriter'` 競合

Experience Managerガイドには [**custom sling rewriter**](../cs-install-guide/conf-output-generation.md#custom-rewriter) クロスマップ（2 つの異なるマップのトピック間のリンク）の場合に生成されるリンクを処理するためのモジュール。

コードベースに別のカスタム Sling リライターがある場合は、 `'order'` 値が 50 より大きい (Experience Managerガイド sling rewriter が使用する ) `'order'` 50.  これを上書きするには、50 より大きい値が必要です。 詳しくは、 [出力書き換えパイプライン](https://sling.apache.org/documentation/bundles/output-rewriting-pipelines-org-apache-sling-rewriter.html).

このアップグレードの間、 `'order'` の値を 1000 から 50 に変更した場合、既存のカスタムリライターがある場合は、とマージする必要があります。 `'fmdita-rewriter'`.


## 互換性マトリックス

この節では、2023 年 12 月のリリースでas a Cloud ServiceするExperience Managerガイドでサポートされるソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| Experience Managerガイド as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.12.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| Experience Managerガイド as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.12.0 | 3.3-uuid.5 | 3.3-uuid.5 | 2.3 | 2.3 |
|  |  |  |  |


### ナレッジベーステンプレートバージョン

| コンポーネントのパッケージ名 | コンポーネントのバージョン | テンプレートバージョン |
|---|---|---|
| Experience ManagerガイドコンポーネントCloud Service用コンテンツパッケージ | dxml-components.all-1.2.2 | aem-site-template-dxml.all-1.0.15 |

## 修正された問題

様々な領域で修正されたバグを以下に示します。



### オーサリング

- The **タイトル** 「 Web エディター」タブでは、ドット (.) の後ろが切り捨てられます。 。(14372)
- Assets UI でマップ名が重複している場合のエラーメッセージは更新されません。 (14320)
- アセットのドラッグ&amp;ドロップ中に、バージョン作成ロジックでエラーが発生します。 (14291)
- 再利用可能なコンテンツでは、要素 ID がスキップされます。 (14213)
- 非表示にする設定コントロール **言語変数** 下のパネル **出力** 」タブが表示されません。 (14194)
- Web エディターは、レイアウトビューで特殊なスキーマを使用して新しい参照やトピックを追加すると、アプリケーションエラーをスローします。 (14094)
- 次へのアンカーリンク： `<dlentry>` または `<dt>` 要素がリンクテキストを表示できません。 (13543)
- The **お気に入力** Web エディターのコレクションの読み込みに失敗しました。 (13495)
- スペースを含む一意の ID で作成された場合、引用には、クリックできないリンクが表示されます。 (13447)
- Adobe Analytics の **レイアウト** ブックマップの表示、使用 **右に移動** 選択したチャプターをサブ要素で機能しないようにするには、次の手順を実行します。 (12567)
- Google Chrome およびMicrosoft Edge ブラウザーでは、XML Editor のプレビューウィンドウが切り捨てられています。 (10755)
- Web エディターでは、可能な親要素内に要素をラップする機能がありません。 (8791)

### 公開

- Fmdita コンポーネントのハードコードされたパスは次のとおりです： `delegator.jsp`(AEM Sitesコンポーネントをオーバーレイできないようにする ) (13993)
- ネイティブPDFの公開出力のPDFリアクターのタグ付きビューが期待どおりに動作しません。 (13622)
- AEMサイトの公開で、スコープピアリンクを持つ大きなマップのデータストアにコミットする際に問題が発生しました。 (13531)
- Experience Managerガイドの一括公開ダッシュボードを使用してサイトをアクティベートできません。 (13439)
- AEM Sitesの出力で、要素ラベルのローカライゼーションが正しく機能していません。 (12144)
- 見つかりません **ditaval** Web エディターの UI で作成されたフォルダープロファイルレベルの出力プリセットのオプション。 (11903)

### 管理

- AEMクラウド環境で、大規模なノードが原因で MongoWrite 例外が発生しました。 (13509)

### 翻訳

- The **許可/却下** ボタンが誤って自動承認された人間による翻訳用に表示される。 (14318)
- 英語以外の DITA ファイルをAEMページに変換する際に、国際化 (i18n) の問題が発生します。 (14286)
- 一時翻訳プロジェクトから翻訳されたコンテンツを同期できず、DITA XML エディターの翻訳ウィザードに正しく表示されません **処理中** 承認済みジョブのステータス。 (9938)

### アクセシビリティ

- フォーカスがトピックエディターに閉じ込められるので、オーサーキャンバスのユーザーインターフェイス内を移動できません。 (13517)

## 既知の問題

Adobeは、2023 年 12 月リリースで次の既知の問題を特定しました。
- 2023 年 12 月のリリースにアップグレードすると、「無効な DTD エラーの取得」が断続的に発生します。
