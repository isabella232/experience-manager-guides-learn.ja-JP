---
title: リリースノート | Adobe Experience Managerガイドas a Cloud Service、2022 年 10 月リリース
description: 10 月リリースのAdobe Experience Manager Guides as a Cloud Service
exl-id: 38638080-625c-49c3-9e54-56cc23831546
source-git-commit: 67ba514616a0bf4449aeda035161d1caae0c3f50
workflow-type: tm+mt
source-wordcount: '481'
ht-degree: 4%

---

# 10 月リリースのAdobe Experience Manager Guides as a Cloud Service

## 10 月リリースへのアップグレード

現在のAdobe Experience Managerガイドをas a Cloud Service的にアップグレード ( 後で *AEMガイドas a Cloud Service*) を設定する必要があります。
1. Cloud Servicesの Git コードを確認し、アップグレードする環境に対応するCloud Servicesパイプラインで設定されたブランチに切り替えます。
1. 更新 `<dox.version>` プロパティ `/dox/dox.installer/pom.xml` ファイルのCloud ServicesGit コードを2022.10.183に保存します。
1. 変更をコミットし、Cloud Servicesパイプラインを実行して、AEM Guides as a Cloud Serviceの 10 月リリースにアップグレードします。

## 互換性マトリックス

この節では、2022 年 10 月のリリースにas a Cloud ServiceしたAEMガイドでサポートされているソフトウェアアプリケーションの互換性マトリックスを示します。

### FrameMaker と FrameMaker Publishing Server

| FMPS | FrameMaker |
| --- | --- |
| 互換性がありません | 2020 Update 4 以降 |
|  |  |

* AEMで作成されたベースラインと条件は、2020.2 以降の FMPS リリースでサポートされています。

### 酸素コネクタ

| AEM Guides as a Cloud リリース | Oxygen Connector ウィンドウ | Oxygen Connector Mac | Oxygen Windows で編集 | Oxen Macで編集 |
| --- | --- | --- | --- | --- |
| 2022.10.0 | 2.7.13 | 2.7.13 | 2.3 | 2.3 |
|  |  |  |  |


## 新機能および機能強化

10 月のリリースで、AEMガイドas a Cloud Serviceで機能強化と新機能が提供されます。


### クイック生成パネル

AEMガイドで **クイック生成** DITA マップ用に作成されたプリセットの出力をすばやく生成および表示するのに役立つパネルです。

![クイック生成アイコン](assets/quick-generate-icon.png)

内 **クイック生成** パネルに、DITA マップ用に作成されたすべての出力プリセットのリストを表示できます。

![クイック生成パネル](assets/quick-generate-panel.png)

1 つ以上のプリセットを選択して、すばやく出力を生成します。 また、プリセット用に生成された出力をすばやく表示することもできます。 出力の生成時に成功メッセージが表示されます。 出力の生成に失敗した場合は、エラーメッセージが表示されます。 また、エラーログを表示して、生成プロセスで発生したエラーの詳細を確認することもできます。


## 修正された問題

様々な領域で修正されたバグを以下に示します。

* ネイティブPDF |リソースのみのトピックをPDF出力から削除するとエラーが発生します。 (10554)
* ネイティブPDF |空の Keyref がPDF出力に表示されます。 (10553)
* ネイティブPDF | `navtitle` 対象 `topichead` は受け入れられません。 (10509)
* ネイティブPDF | amd64 JDK フレーバーに必要なサポート。 (10465)
* ネイティブPDF |目次から最前面のトピックを非表示にできません。 (10355)
* ネイティブPDF |チャプターレイアウトでページ番号を再開すると、前のチャプターの末尾からランダムにページ番号が開始されます。 (10154)
* Chrome ブラウザー | UI から要素をドラッグ&amp;ドロップすると画面が空白になる。 例えば、条件パネルから条件をドラッグした場合などです。 (10524)
* アセットのコピー&amp;ペースト操作の後、ノードプロパティが削除される。 (10053)
* クリック時  **閉じる** ユーザーが assets にリダイレクトされる問題を修正しました。ユーザーがAEMのホームページに移動するようにエクスペリエンスが修正されました。 (9654)
