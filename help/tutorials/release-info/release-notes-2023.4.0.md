---
title: リリースノート | Adobe Experience Managerガイドas a Cloud Service、2023 年 4 月リリース
description: Adobe Experience Manager Guides の最新リリースのas a Cloud Service
exl-id: 3b09f0b3-cfa4-422d-91b7-733ab1c1896c
source-git-commit: cf612da41f79b0bf9da4c4d7454a0e3c86af7a4c
workflow-type: tm+mt
source-wordcount: '852'
ht-degree: 2%

---

# Adobe Experience Manager Guides の 4 月リリースas a Cloud Service

## 最新リリースへのアップグレード

現在のAdobe Experience Managerガイドをas a Cloud Service的にアップグレード ( 後で *AEMガイドas a Cloud Service*) を設定する必要があります。

1. Cloud Servicesの Git コードを確認し、アップグレードする環境に対応するCloud Servicesパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ `/dox/dox.installer/pom.xml` ファイルのCloud ServicesGit コードを 2023.4.249 に変更します。
3. 変更をコミットし、Cloud Servicesパイプラインを実行して、AEM Guides as a Cloud Serviceの最新リリースにアップグレードします。

## 既存のコンテンツのインデックスを作成する手順 (AEMガイドas a Cloud Serviceの 9 月リリースより前のバージョンを使用している場合のみ )

既存のコンテンツのインデックスを作成し、マップレベルで新しい検索と置換テキストを使用するには、次の手順を実行します。

* サーバーに対してPOSTリクエストを実行します（正しい認証を使用） - `http://<server:port>/bin/guides/map-find/indexing`.
( オプション：マップの特定のパスを渡してインデックスを作成できます。既定では、すべてのマップにインデックスが作成されます ||例： `https://<Server:port>/bin/guides/map-find/indexing?paths=<map_path_in_repository>`)

* API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port>/bin/guides/map-find/indexing?jobId={jobId}`
( 例：http://&lt;
_localhost:8080_>/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678)

* ジョブが完了すると、上記のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。

## 互換性マトリックス

この節では、2023 年 4 月のリリースにas a Cloud ServiceするAEMガイドでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMaker と FrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.04.0 | 互換性がありません | 2022 以降 |
|  |  |  |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.04.0 | 2.9-uuid-2 | 2.9-uuid-2 | 2.3 | 2.3 |
|  |  |  |  |


## 新機能および機能強化

AEMガイドas a Cloud Serviceは、最新リリースの機能強化と新機能を提供します。

### PDF公開での高度なメタデータのサポート

AEMガイドで、PDF出力のメタデータにマッピングされるメタデータに対する高度なサポートを提供するようになりました。 メタデータオプションには、作成者名、ドキュメントのタイトル、キーワード、著作権情報、その他のデータフィールドなど、ドキュメントとその内容に関する情報が含まれます。

<img src="assets/pdf-metadata.png" alt=" ネイティブ pdf メタデータ">

XMPファイルを読み込むと、AEMガイドはファイルから情報を選択できます。 また、ドロップダウンを使用してメタデータの名前と値を指定することもできます。 また、名前フィールドに直接入力して、カスタムメタデータを追加することもできます。


### 拡張アウトライン表示パネル

AEMガイドでは、改善されたアウトラインビューパネルを使用して、ドキュメントで使用される要素の階層ビューを取得できます。

<img src="assets/select-element-content-outline-view_cs.png" alt=" ネイティブ pdf メタデータ">

アウトライン・ビューには、次の機能強化が含まれます。

* 「表示オプション」ドロップダウンが「アウトライン・ビュー」パネルの上部に表示されます。 要素に ID、属性、テキストが含まれている場合は、ドロップダウンからそれらを選択して、要素と共に表示できます。 アウトライン・ビュー・パネルに表示できる属性は、管理者が **エディター設定**.

* 検索機能を使用すると、名前、ID、テキストまたは属性値で要素を検索できます。


### AEMガイド用のマイクロサービスベースの公開のas a Cloud Service

AEMガイドas a Cloud Serviceは、マイクロサービスベースの公開と同時に大規模な公開ワークロードを実行し、業界をリードするAdobe I/O Runtimeのサーバレスプラットフォームを活用する機能を提供します。

4 月のリリースでは、複数の公開リクエストを同時に実行し、マイクロサービスベースのネイティブPDF公開を使用して、一括PDF出力を非常に効率的に生成できます。
詳しくは、 [AEMガイド用の新しいマイクロサービスベースの公開の設定をas a Cloud Service](../knowledge-base/publishing/configure-microservices.md).


## 修正された問題

様々な領域で修正されたバグを以下に示します。

* ネイティブPDF | brackets() を含む出力クラスを持つコンテンツを公開すると、公開が停止します。 (11596)
* 「変更の追跡」がオンの既存のリスト項目の代わりに移動（ドラッグ&amp;ドロップ）すると問題が発生します。 (11570)
* 「変更の追跡」がオンの新しいリスト項目として移動（ドラッグ&amp;ドロップ）すると問題が発生します。 (11569)
* [ 変更の追跡 ] で、リスト項目のインデントまたはインデント解除が期待どおりに機能しません。 (11568)
* 「変更の追跡」をオンにして行にコンテンツを追加し、「変更の追跡」をオフにしても、実際にはオフにはなりません。 (11567)
* リスト項目をドラッグ&amp;ドロップするのが困難な場合、リスト項目の代わりにテキストが移動します。 (11566)
* 完了したレビューは、読み取り専用モードで開きません。 (11387)
* この問題は、AEMサイト検索で発生します（は 2 ～ 3 レベルのノードを超えては機能しません）。 (11352)
* 緑色（「変更を追跡」）で表示されている要素のオーサリング時には、トラックの変更が無効になっている場合でも、新しいコンテンツがトラックの変更として表示されます。 (7021)

### 回避策に関する既知の問題

Adobeは、2023 年 4 月のリリースのAEMガイドに関して、次の既知の問題を特定しました。

* ネイティブPDF |古いメタデータは、出力プリセットが明示的に開かれるまで入力されません。
