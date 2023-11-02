---
title: リリースノート | 2023 年 11 月リリースのAdobe Experience Managerガイドでのアップグレード手順と修正された問題
description: バグ修正と、2023 年 11 月リリースのAdobe Experience Managerガイドas a Cloud Serviceのアップグレード方法について説明します。
source-git-commit: 1d8f00a82e92e1648615c409d4652b6ce3da7a1f
workflow-type: tm+mt
source-wordcount: '1640'
ht-degree: 3%

---

# 2023 年 11 月リリースのAdobe Experience Manager Guidesas a Cloud Service

このリリースノートでは、アップグレードの手順、互換性マトリックス、および 2023 年 11 月のバージョンのAdobe Experience Managerガイドas a Cloud Service( 後で *Experience Managerガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [2023 年 11 月リリースのExperience Managerガイドas a Cloud Service](whats-new-2023.11.0.md).

## 2023 年 11 月リリースにアップグレード

次の手順を実行して、現在のExperience Managerガイドのas a Cloud Service設定をアップグレードします。

1. Cloud Serviceの Git コードを確認し、アップグレードする環境に対応するCloud Serviceパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServiceGit コードを2023.11.0.406に保存します。
3. 変更をコミットし、Cloud Serviceパイプラインを実行して、2023 年 11 月リリースのExperience Managerガイドas a Cloud Serviceにアップグレードします。

## サーブレットを介したスクリプトのトリガーを有効にする手順

(2023 年 6 月リリースより前のバージョンのExperience Managerガイドをas a Cloud Serviceの場合のみ )

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

前の応答 JSON では、キー `lockNodePath` は、送信されたジョブを指す、リポジトリで作成されたノードへのパスを保持します。 ジョブが完了すると自動的に削除され、ジョブのステータスについては、このノードを参照できます。

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

1. サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server:port>//bin/guides/reports/upgrade`.

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port>/bin/guides/reports/upgrade?jobId= {jobId}`
( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678`)

1. ジョブが完了すると、前のGETリクエストへの応答が成功します。 何らかの理由でジョブが失敗した場合は、サーバーログから失敗を確認できます。

1. のデフォルト値または以前の既存の値に戻す `queryLimitReads` 手順 1 で変更した場合。

## 「レポート」タブの新しい検索と置換、およびトピックリストを使用するために既存のコンテンツをインデックス化する手順は次のとおりです。

(2023 年 6 月リリースより前のバージョンのExperience Managerガイドをas a Cloud Serviceの場合のみ )

既存のコンテンツのインデックス作成に関する次の手順を実行し、「レポート」タブのマップレベルおよびトピックリストで新しい検索と置換テキストを使用します。

1. POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. （オプション）マップの特定のパスを渡してインデックスを作成できます。デフォルトでは、すべてのマップにインデックスが作成されます。例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`)

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 例えば `http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test` などのファイルです。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


1. ジョブが完了すると、前のGETリクエストが成功と応答し、マップに失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## を処理する手順 `'fmdita rewriter'` 競合

Experience Managerガイドには [**custom sling rewriter**](../cs-install-guide/conf-output-generation.md#custom-rewriter) クロスマップ（2 つの異なるマップのトピック間のリンク）の場合に生成されるリンクを処理するためのモジュール。

コードベースに別のカスタム Sling リライターがある場合は、 `'order'` 値が 50 より大きい (Experience Managerガイド sling rewriter が使用する ) `'order'` 50.  これを上書きするには、50 より大きい値が必要です。 詳しくは、 [出力書き換えパイプライン](https://sling.apache.org/documentation/bundles/output-rewriting-pipelines-org-apache-sling-rewriter.html).

このアップグレードの間、 `'order'` の値を 1000 から 50 に変更した場合、既存のカスタムリライターがある場合は、とマージする必要があります。 `'fmdita-rewriter'`.


## 互換性マトリックス

この節では、2023 年 11 月のリリースでas a Cloud ServiceするExperience Managerガイドでサポートされるソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| Experience Managerガイド as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.11.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| Experience Managerガイド as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.11.0 | 3.2-uuid 5 | 3.2-uuid 5 | 2.3 | 2.3 |
|  |  |  |  |


### ナレッジベーステンプレートバージョン

| コンポーネントのパッケージ名 | コンポーネントのバージョン | テンプレートバージョン |
|---|---|---|
| Experience ManagerガイドコンポーネントCloud Service用コンテンツパッケージ | dxml-components.all-1.2.2 | aem-site-template-dxml.all-1.0.15 |

## 修正された問題

様々な領域で修正されたバグを以下に示します。



### オーサリング

- conref の後の空白 `<ph>` 要素がトピックの保存時に表示されなくなります。 (13642)
- 後処理が完了する前に DITA ファイルを保存しようとすると、アプリケーションエラーが発生します。 (13571)
- トピックのタイトルにスラッシュが含まれる場合 `/`の場合、エディターの「 」タブには、その後に続く文字のみが表示されます。 (13455)
- エディターにプレビューを表示した後、画像のプレビューが表示されなくなることはありません。 (13454)
- 他のトピックでルートマップ定義キーを使用すると、Insert キーワードポップアップが表示されない。 (12950)
- バージョン履歴パネルで非常に高いグラフィックをプレビューすると、閉じるアイコンが表示されません。 (12867)
- のタイムゾーンを変更できません **バージョンの作成日** 列に表示されます。 (12711)
- The **バージョン履歴** Assets UI のパネルに、 **現在** フィールドに入力します。 (12624)
- ファイル名が数字で始まるテンプレートから DITA ファイルを作成すると、名前空間エラーが発生します。 (12188)
- Web エディターで、 **キー参照** ウィンドウは、 `varname` タグを使用します。 (10940)
- Zip ファイルは Web エディターで認識されず、ドラッグ&amp;ドロップすることはできません。 (12709)
- 属性が適用されているコンテンツが、オーサーモードまたはプレビューモードでハイライト表示されません。 (11063)
- トピックを編集した後に閉じると、フォルダービューに戻らずにAEMのホームページにリダイレクトされます。 (13306)
- クラウドサービスにコピー&amp;ペーストされたファイルの後処理で遅延が発生します。 (12457)
- ユーザーがユーザーの環境設定で明示的に設定していない場合でも、ルートマップ設定は Web エディターで保持されます。 (11551)


### 公開

- 検索結果に表示されるファイルで、コンテンツフラグメントとして公開機能が機能しない。 (14090)
- ネイティブPDF公開で、テンプレートレイアウトの背景色の選択を元に戻す際に、ページを再読み込みする必要があります。 `None`. (13621)
- AEM Site Publishing のスコープピアリンクを持つ大きな DITA マップのデータストアにコミットする際の問題。 (13530)
- ネイティブPDF公開では、ヘッダーとフッターの画像に代替テキストが表示されないので、アクセシビリティが低下します。 (12829)
- ネイティブPDFでのページレイアウトの複製は、拡張子が自動的に追加されない場合は機能しません。 (12534)
- ネイティブPDFの公開でPDF出力を生成する場合、ファイル名は一定期間後に切り捨てられます。 (13620)
- 以下に対して正しくないアイコンとツールチップが表示される：  **コンテンツを編集** 」オプションが表示されます。 (13492)
- カスタムメタデータは、最終出力では使用できません。 (12116)
- fmdita rewriter は、ユーザーの rewriter 設定と競合し、リンクの代わりに長い URL が表示されます。 (12076)
- AEMサイトプリセットで、「 **トピックごとに別のPDFを生成** は機能しません。 (11555)
- ネイティブPDFの公開では、CMYK カラースペースの変換がサポートされていません。 (10754)
- 動的ベースライン呼び出しで、タイトルの代わりに名前が使用されるので、DITA マップ API の書き出しに失敗します。 (14268)

### 管理

- GUID のない自己参照リンクを持つ DITA ファイルのコピー&amp;ペースト時に、コンテンツ参照が壊れます。 (13540)
- Web エディタで、ベースラインには、選択した DITA ファイルのバージョンの代わりに、以前のバージョンのタイトルが表示されます。 (13444)
- The **レポート** Web エディター UI のタブに、2023 年 7 月のExperience Managerガイドのアップグレードより前に作成された古い DITA マップのトピックリストがas a Cloud Service的に表示されません。 (11852)
- 大きな DITA マップの条件プリセットが作成されません。 (10936)
- レポート内の壊れたリンクのリストの下に、自己参照リンクが表示されます。 (13539)

### レビュー

- 2023 年 10 月リリースのExperience Managerガイドas a Cloud Serviceでは、Web エディターの以前のバージョンと現在のバージョンのレビューパネルが正しくありません。 (14156)
- 用のメールテンプレートのカスタマイズ **レビュー** ワークフローは、ノードのオーバーレイでは機能しません。 (13954)
- The **閉じる** 」ボタンをクリックすると、Experience Managerガイドの「レビュー」ページで、AEMホームページに移動します。 (13535)
- スニペットを韓国語で作成する際に、壊れた文字が表示されます。 (13489)
- [Experience Managerガイド ] [ レビュー ] 画面の韓国語の添付ファイルをクリックできません。 (13436)
- マップのタイトルがレビュー画面とコラボレーション画面で切り離され、タイトル全体を表示するオプションはありません。 (13012)

### 翻訳

- 自動承認が機能しないことがあり、 **翻訳ステータス**. (13607)
- 翻訳ダッシュボードから書き出されたベースラインは失敗し、ターゲット言語で開きません。 (12993)

## 既知の問題

Adobeは、2023 年 11 月リリースで次の既知の問題を特定しました。

- AEM Site 出力の選択的なトピックの再生成に失敗しました。