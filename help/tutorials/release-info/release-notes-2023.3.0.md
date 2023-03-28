---
title: リリースノート | Adobe Experience Managerガイドas a Cloud Service、2023 年 3 月リリース
description: Adobe Experience Manager Guides の最新リリースのas a Cloud Service
source-git-commit: 27c8c0f3ac5c6d9c318ac8fb7ed13299ac9994de
workflow-type: tm+mt
source-wordcount: '588'
ht-degree: 2%

---

# Adobe Experience Manager Guides の 3 月リリースas a Cloud Service

## 最新リリースへのアップグレード

現在のAdobe Experience Managerガイドをas a Cloud Service的にアップグレード ( 後で *AEMガイドas a Cloud Service*) を設定する必要があります。
1. Cloud Servicesの Git コードを確認し、アップグレードする環境に対応するCloud Servicesパイプラインで設定されたブランチに切り替えます。
2. 更新 `<dox.version>` プロパティ `/dox/dox.installer/pom.xml` ファイルのCloud ServicesGit コードを 2023.3.242 に設定します。
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

この節では、AEMガイドのas a Cloud Service 2023 年 3 月リリースでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMaker と FrameMaker Publishing Server

| AEM Guides as a Cloud リリース | FMPS | FrameMaker |
| --- | --- | --- |
| 2023.03.0 | 互換性がありません | 2022 以降 |
|  |  |  |


### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2023.03.0 | 2.9-uuid-2 | 2.9-uuid-2 | 2.3 | 2.3 |
|  |  |  |  |


## 新機能および機能強化

AEMガイドas a Cloud Serviceは、最新リリースの機能強化と新機能を提供します。

### Web エディターでビデオまたはオーディオファイルを開いて再生します。

AEMガイドで、Web エディターでオーディオまたはビデオファイルを開いて再生する機能が提供されるようになりました。 ビデオのボリュームまたはビューを変更できます。 ショートカットメニューには、次のオプションもあります。 **ダウンロード**，変更 **再生速度**&#x200B;または表示 **ピクチャーインピクチャー**.

<img src="assets/video-web-editor.png" alt="ビデオを再生" width="600">


## 修正された問題

様々な領域で修正されたバグを以下に示します。

* ダウンロードPDFプロセスが Web エディタで適切に動作していません。 (11496)
* JSON 出力 |プロパティ値が次の値を持つマップメタデータ `"value in spaces and double quotes"` 公開エラーにつながります。 (11438)
* オーディオおよびビデオマルチメディアファイルの挿入が、YouTube形式で **マルチメディアの挿入** アイコン (11320)
* 検証エラーは、特殊なタイトル要素を持つテンプレートを使用してマップを作成した場合に発生します。 (11212)
* ネイティブPDF |テーブルヘッダーに存在する脚注は、PDF出力内の対応するページフッターで、太字および中央揃えのテキストになります。 (10610)
>[!NOTE]
>
>ネイティブPDFの変更を反映するには、/content/dam/dita-templates にあるPDFフォルダーを削除し、最新のビルドにアップグレードします。 (10610)

### 回避策に関する既知の問題

Adobeは、2023 年 3 月のリリースのAEMガイドに関して、次の既知の問題を特定しました。

* ユーザーが、重複したアセットのバージョンを保存または作成できない。

**回避策**:重複アセットに変更を加える前に、Assets UI から再処理します。

