---
title: リリースノート | Adobe Experience Managerガイド（2023 年 6 月リリース）のアップグレード手順と修正された問題
description: バグ修正とAdobe Experience Managerガイドの 2023 年 6 月リリースへのアップグレード方法について説明します。as a Cloud Service
exl-id: ea0ff27a-9c3a-49d7-b94a-d1b9d9e85dcf
source-git-commit: 4359d857f3662ae29a55420c0fafc4a244258389
workflow-type: tm+mt
source-wordcount: '1143'
ht-degree: 3%

---

# 2023 年 6 月リリースのAdobe Experience Manager Guidesas a Cloud Service

このリリースノートでは、アップグレードの手順、互換性マトリックス、Adobe Experience Managerガイドの 2023 年 6 月バージョンで修正された問題 ( 後で *AEMガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [2023 年 6 月リリースのAEMガイドas a Cloud Serviceの新機能](whats-new-2023.6.0.md).

## 2023 年 6 月リリースにアップグレード

次の手順に従って、現在のAEM Guidesas a Cloud Service設定をアップグレードします。

1. Cloud Servicesの Git コードを確認し、アップグレードする環境に対応するCloud Servicesパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ： `/dox/dox.installer/pom.xml` ファイルのCloud ServicesGit コードを 2023.6.297 に変更します。
3. 変更をコミットし、Cloud Servicesパイプラインを実行して、2023 年 6 月リリースのAEM Guides as a Cloud Serviceにアップグレードします。

## サーブレットを介したスクリプトのトリガーを有効にする手順

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

(2022 年 9 月リリースより前のバージョンのAEMガイドas a Cloud Service版の場合のみ )

既存のコンテンツのインデックス作成に関する次の手順を実行し、「レポート」タブのマップレベルおよびトピックリストで新しい検索と置換テキストを使用します。

1. POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. （オプション）マップの特定のパスを渡してインデックスを作成できます。デフォルトでは、すべてのマップにインデックスが作成されます。例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`)

1. また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 （例：`http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test`）。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

1. API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


1. ジョブが完了すると、前のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションされます。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## 互換性マトリックス

この節では、2023 年 6 月のリリースでas a Cloud ServiceするAEMガイドでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMakerとFrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.06.0 | 互換性がありません | 2022 以降 |
| | | |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.06.0 | 2.9-uuid-2 | 2.9-uuid-2 | 2.3 | 2.3 |
|  |  |  |  |


## 修正された問題

様々な領域で修正されたバグを以下に示します。

### オーサリング

- レイアウト表示から作成者またはソース表示に切り替えると、content33 から navtitle が削除されます。 (12174)
- DITA マップをクリックした際にアプリケーションエラーが発生することがあります。 (11842)
- Web エディター |トピックの編集中に、XML エディターに改行なしのスペースが追加されます。 (11786)
- アセット UI |リスト表示では、オーバーレイ表示された列は結合できません。 (11528)
- Keyref がマップビューで解決されません。 (11490)
- XML エディターを使用して移動する際に、トップメニューが表示されない。 (10868)
- `conref` ph タグで |表示される参照ダイアログが正しくありません。 (9481)
- 他の要素へのローカルリンクは、Web エディターで解決されません。 (8790)
- Matches() 関数は schematron 機能では動作しません。 (11224)


### 管理

- Web エディター UI の「レポート」タブに、4.2 アップグレード前に作成された古い DITA マップのトピックリストが表示されません。 (11708)

- 4.2 リリースでは、Assets UI の「ファイルをアップロード」ボタン機能が動作しなくなりました。 (11633)

### 公開

- 更新または再起動された可能性のあるポッドから一時ファイルを読み取ると、AEMサイトへの公開が失敗します。 (12113)
- ネイティブPDF | brackets() を含む出力クラスを持つコンテンツを公開すると、公開が停止します。 (11936)
- JSON 出力 |プロパティ値が次の値を持つマップメタデータ `"value in spaces and double quotes"` 公開エラーにつながります。 (11933)
- Web エディター |出力パスとテンプレートをAEMプリセットで選択できません。 (11530)
- ネイティブPDF |カスタム属性は、一時的なHTMLまたはPDFエンジンには反映されません。 (DXML-12005)
- ネイティブPDF |大きなコンテンツを公開する際に Java OutOfMemoryError が発生します。 (11789)
- JSON 出力 | `fmUuid` JSON の jcr:content ノードのプロパティは、JSON 内の「id」とは異なります。 (11564)
- JSON 出力 |同じファイル名のマップとトピックが存在する場合、マップの JSON は削除されます。 (11524)
- ネイティブPDF |外部参照は、外部参照ラベルの代わりに href トピックタイトルの内容を印刷しています。 (11322)
- ネイティブPDF |テンプレート設定を保存できません。PDFテンプレート設定を保存できません。 (10751)
- ネイティブPDF |複数の外部参照を含めると、列幅を超えてテキストが拡張されます。 (10876)
- ネイティブPDF | `<note>``</note>` 要素は、そのタイプの余分な span タイトルを生成しません。 (10549)
- ネイティブPDF | WCAG 2.0 に準拠するために、生成されたPDFに言語メタデータを設定することはできません。 (12296)



### 翻訳

- 2 月のクラウドリリース (2302) 以降、すべての翻訳コンテンツに「非同期」と表示される、または「コピーが見つかりません」と表示されます。 (11834)

### レビュー

- 新しいレビュー UI |条件は、Web エディターでの動作とは異なり、非表示の作業をハイライトして表示します。 (11628)
