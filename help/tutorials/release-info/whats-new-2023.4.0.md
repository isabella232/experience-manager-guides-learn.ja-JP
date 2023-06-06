---
title: リリースノート | Adobe Experience Managerガイドas a Cloud Service、2023 年 4 月リリース
description: 2023 年 4 月リリースのAdobe Experience Manager Guides as a Cloud Service
source-git-commit: 4bb9ce2690a2e76a5b2a93b65db7dd452e15d295
workflow-type: tm+mt
source-wordcount: '377'
ht-degree: 0%

---

# 2023 年 4 月リリースのAdobe Experience Managerガイドの新機能as a Cloud Service

この記事では、Adobe Experience Managerガイド ( 後で *AEMガイドas a Cloud Service*) をクリックします。

アップグレードの手順、互換性マトリックス、およびこのリリースで修正された問題について詳しくは、 [リリースノート](release-notes-2023.4.0.md) 記事。

## PDF公開での高度なメタデータのサポート

AEMガイドで、PDF出力のメタデータにマッピングされるメタデータに対する高度なサポートを提供するようになりました。 メタデータオプションには、作成者名、ドキュメントのタイトル、キーワード、著作権情報、その他のデータフィールドなど、ドキュメントとその内容に関する情報が含まれます。

<img src="assets/pdf-metadata.png" alt=" ネイティブ pdf メタデータ">

XMPファイルを読み込むと、AEMガイドはファイルから情報を選択できます。 また、ドロップダウンを使用してメタデータの名前と値を指定することもできます。 また、名前フィールドに直接入力して、カスタムメタデータを追加することもできます。


## 拡張アウトライン表示パネル

AEMガイドでは、改善されたアウトラインビューパネルを使用して、ドキュメントで使用される要素の階層ビューを取得できます。

<img src="assets/select-element-content-outline-view_cs.png" alt=" ネイティブ pdf メタデータ">

アウトライン・ビューには、次の機能強化が含まれます。

* 「表示オプション」ドロップダウンが「アウトライン・ビュー」パネルの上部に表示されます。 要素に ID、属性、テキストが含まれている場合は、ドロップダウンからそれらを選択して、要素と共に表示できます。 アウトライン・ビュー・パネルに表示できる属性は、管理者が **エディター設定**.

* 検索機能を使用すると、名前、ID、テキストまたは属性値で要素を検索できます。


## AEMガイド用のマイクロサービスベースの公開のas a Cloud Service

AEMガイドas a Cloud Serviceは、マイクロサービスベースの公開と同時に大規模な公開ワークロードを実行し、業界をリードするAdobe I/O Runtimeのサーバレスプラットフォームを活用する機能を提供します。

4 月のリリースでは、複数の公開リクエストを同時に実行し、マイクロサービスベースのネイティブPDF公開を使用して、一括PDF出力を非常に効率的に生成できます。
詳しくは、 [AEMガイド用の新しいマイクロサービスベースの公開の設定をas a Cloud Service](../knowledge-base/publishing/configure-microservices.md).

