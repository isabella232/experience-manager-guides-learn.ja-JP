---
title: リリースノート | Adobe Experience Managerガイドas a Cloud Service、2023 年 4 月リリース
description: 2023 年 4 月リリースのAdobe Experience Manager Guides as a Cloud Service
exl-id: 3b09f0b3-cfa4-422d-91b7-733ab1c1896c
source-git-commit: 99ca14a816630f5f0ec1dc72ba77994ffa71dff6
workflow-type: tm+mt
source-wordcount: '579'
ht-degree: 2%

---

# 2023 年 4 月リリースのAdobe Experience Manager Guides as a Cloud Service

このリリースノートでは、Adobe Experience Managerガイドの 2023 年 4 月バージョンで修正されたアップグレード手順、互換性マトリックス、問題について説明します ( 後で *AEMガイドas a Cloud Service*) をクリックします。

新機能および機能強化について詳しくは、 [2023 年 4 月リリースのAEMガイドas a Cloud Serviceの新機能](whats-new-2023.4.0.md).

## 2023 年 4 月リリースへのアップグレード

次の手順に従って、現在のAEM Guidesas a Cloud Service設定をアップグレードします。

1. Cloud Servicesの Git コードを確認し、アップグレードする環境に対応するCloud Servicesパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ `/dox/dox.installer/pom.xml` ファイルのCloud ServicesGit コードを 2023.4.249 に変更します。
3. 変更をコミットし、Cloud Servicesパイプラインを実行して、2023 年 4 月リリースのAEM Guides as a Cloud Serviceにアップグレードします。

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
