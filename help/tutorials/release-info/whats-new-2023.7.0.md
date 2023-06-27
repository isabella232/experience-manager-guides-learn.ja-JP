---
title: リリースノート | 2023 年 7 月リリースのAdobe Experience Managerガイドの新機能
description: 2023 年 7 月リリースのAdobe Experience Managerガイドas a Cloud Serviceの新機能と機能強化について説明します
source-git-commit: 06bff798d2e745fae1c666353045cb4c6b040207
workflow-type: tm+mt
source-wordcount: '688'
ht-degree: 0%

---

# 2023 年 7 月リリースのAdobe Experience Managerガイドas a Cloud Serviceの新機能

この記事では、Adobe Experience Managerガイド ( 後で *AEMガイドas a Cloud Service*) をクリックします。

アップグレードの手順、互換性マトリックス、およびこのリリースで修正された問題の詳細については、 [リリースノート](release-notes-2023.7.0.md) 記事。

## データソースに接続してトピックにデータを挿入する

AEMガイドの標準コネクタを使用して、データソースにすばやく接続できるようになりました。 データソースに接続すると、情報とソースの同期を維持でき、データの更新が自動的に反映され、AEMガイドは真のコンテンツハブになります。 この機能により、データを手動で追加またはコピーする時間と労力を節約できます。

AEMガイドを使用すると、管理者が JIRA および SQL(MySQL、PostgreSQL、SQL Server、SQLite) データベース用の既製のコネクタを設定できるようになりました。 また、既定のインターフェイスを拡張して、他のコネクタを追加することもできます。

追加すると、設定済みのコネクタが「 **データソース** パネルを使用して、Web エディターで設定できます。

![](assets/code-snippet-generator.png){width="300" align="left"}

コンテンツスニペットジェネレーターを作成して、接続されたデータソースからデータを取得できます。 その後、データをトピックに挿入して編集できます。

コンテンツスニペットジェネレーターを作成したら、それを再利用して任意のトピックにデータを挿入できます。 詳しくは、 [データソースからコンテンツスニペットを挿入する](../user-guide/web-editor-content-snippet.md).



## レビュープロジェクトとアクティブなレビュータスクを表示するレビューパネル

AEMガイドにより、レビューがよりシームレスになりました。 Web エディター内に「レビュー」パネルが表示されます。 [ レビュー ] パネルには、自分が属しているレビュープロジェクト内のすべてのレビュープロジェクトとアクティブなレビュータスクが表示されます。

この機能を使用すると、作成者はレビュータスクを簡単に開いたり、コメントを表示したり、一元化されたビューでコメントにすばやく対処したりできます。
![](assets/active-review-task-comments.png){width="800" align="left"}
詳しくは、 **レビュー** 内の機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。


## Map コレクションの強化

マップコレクションは、複数のマップを整理し、それらをバッチパブリッシュする場合に役立ちます。 Map コレクションに対して、次の新しい機能が多数追加されました。

- これで、ネイティブPDFの出力プリセットをマップコレクションに追加し、それらを使用してPDF出力を生成することもできます。
- 管理者が作成したグローバルおよびフォルダープロファイルプリセットを表示し、それらを使用してPDF出力を生成できます。
- 現在は、個々のプリセットを選択できるだけでなく、DITA マップのすべてのフォルダープロファイルプリセットを一度に有効にすることもできます。
  ![](assets/edit-map-collection.png){width="800" align="left"}

詳しくは、 [出力生成にマップコレクションを使用](../user-guide/generate-output-use-map-collection-output-generation.md).

## ネイティブHTML出力を生成しながら、一時PDFファイルにアクセス

これで、AEMガイドでは、ネイティブHTML出力の生成中に作成された一時PDFファイルをダウンロードできます。 出力プリセット設定で、一時ファイルをダウンロードするオプションを選択します。  AEMガイドを使用すると、そのプリセットを使用して出力を生成する際に作成された一時ファイルをダウンロードできます。

この機能を使用すると、中間スタイルとレイアウトにアクセスできる生成プロセスに関するより優れたインサイトが得られ、必要に応じて CSS スタイルを修正または変更できます。

![](assets/native-pdf-advanced-settings.png){width="800" align="left"}

詳しくは、 [PDF出力プリセットの作成](../web-editor/native-pdf-web-editor.md#create-output-preset).

## マイクロサービスベースの公開でHTML5 とカスタム出力を生成

新しい公開マイクロサービスを使用すると、as a Cloud ServiceのAEMガイドで大規模な公開ワークロードを同時に実行し、業界をリードするAdobe I/O Runtimeサーバーレスプラットフォームを活用できます。 これで、マイクロサービスを使用して、HTML5 とカスタム出力を生成することもできます。
複数の発行リクエストを実行して、パフォーマンスを向上させ、これらの出力形式を生成できます。
詳しくは、 [AEMガイド用のマイクロサービスベースの公開の設定as a Cloud Service](../knowledge-base/publishing/configure-microservices.md).

## AEM Guides のバージョンの詳細を「About」情報で表示

AEM **について** また、AEM Guide のバージョンの詳細も表示できます。 現在のバージョンの詳細は、 **について** オプション **ヘルプ** (AEMナビゲーションページ )

![](assets/about-aem-help.png)(width=&quot;800&quot; align=&quot;left&quot;)