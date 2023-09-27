---
title: リリースノート | 2023 年 10 月リリースのAdobe Experience Managerガイドの新機能
description: 2023 年 10 月リリースのAdobe Experience Managerガイドas a Cloud Serviceの新機能と機能強化について説明します。
source-git-commit: 18adbd41370d32b183cc4828d1d79b7183453f5e
workflow-type: tm+mt
source-wordcount: '616'
ht-degree: 0%

---

# 2023 年 10 月リリースのAdobe Experience Managerガイドの新機能as a Cloud Service

この記事では、Adobe Experience Managerガイド ( 後で *AEMガイドas a Cloud Service*) をクリックします。

アップグレードの手順、互換性マトリックス、およびこのリリースで修正された問題について詳しくは、 [リリースノート](release-notes-2023.10.0.md).


## ツールを使用したデータソースコネクタの設定

Experience Managerガイドで、 **データソース** データソース用の標準コネクタを設定する際に使用するツールです。 JIRA、SQL(MySQL、PostgreSQL、Microsoft SQL Server、SQLite、MariaDB、H2DB)、AdobeCommerce およびElasticsearchの各データベース用のコネクタを簡単に作成できます。

また、データソースコネクタを簡単に編集、再接続、複製、削除することもできます。 方法を学ぶ [ツールを使用したデータソースコネクタの設定](../install-guide/conf-data-source-connector.md).

![データソースパネルに表示されるデータソースコネクタ](assets/data-sources-create-window.png){width="550" align="left"}

*データソースパネルでデータソースコネクタを作成し、表示します。*

## トピックジェネレーターのログを表示します

これで、コンテンツ生成ログファイルも表示できるようになりました。 このログファイルを使用すると、警告、エラーおよび例外を確認できます。  詳しくは、 [トピックジェネレーターのオプション](../user-guide/web-editor-content-snippet.md#options-for-a-topic-generator) は、トピックジェネレーターを簡単に生成および管理するのに役立ちます。

## データソーステンプレートでの Velocity ツールのサポート

これで、テンプレートガイドテンプレートの Velocity ツールをExperience Managerできます。 これらのツールを使用すると、データソースから取得するデータに様々な関数を適用できます。 コンテンツスニペットまたはトピックを作成する際に、テンプレートを使用できます。 この機能を使用すると、同じ機能を各データセットに手動で適用する際の時間と労力を節約できます。  また、正確な結果を得ることもできます。
たとえば、 $mathTool を使用して数学関数を実行できます。
方法の詳細 [データソーステンプレートでの Velocity ツールの使用](../user-guide/web-editor-content-snippet.md##use-velocity-tools).


## ネイティブPDFの強化

2023 年 10 月リリースで、次のネイティブPDFの機能強化がおこなわれました。

### レイアウトの最初のページのページ番号をリセット

ネイティブPDFの出力では、ページ番号を再度開始し、番号付けの開始番号を指定できます。 これで、セクションの最初のオカレンスに対してのみ、番号付けを開始できるようになりました。
方法の詳細 [ページレイアウトのページプロパティの操作](../native-pdf/design-page-layout.md#page-props-page-layout).


### 目次に自動番号なしの章を表示

Experience Managerガイドは、目次 (TOC) にチャプター番号とチャプター名を表示します。 チャプター番号を含まないチャプター名のみを公開するように選択できました。 の設定方法の詳細を表示します [PDFの詳細設定](../native-pdf/components-pdf-template.md#advanced-pdf-settings).

## Web エディタからマップをダウンロードする

現在は、Web エディタのマップビューでマップを編集するだけでなく、マップをダウンロードすることもできます。 特定のベースラインを使用してマップをダウンロードするよう選択できます。 階層を統合し、すべてのファイルとフォルダーを 1 つのフォルダーに保存することもできます。

詳しくは、 **マップビュー** 内の機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。

![リポジトリ表示でのファイルのオプションメニュー](assets/options-menu-repo-view-file-level-2310.png){width="550" align="left"}

*リポジトリ表示でファイルを選択し、ファイルに対してアクションを実行するオプションを選択します。*

## Oxygen コネクタプラグインでファイルを編集します。

Experience Managerガイドでは、Web エディタでファイルを選択し、Oxygen コネクタプラグインでファイルを編集することができるようになりました。 このオプションは、標準のサポートの一部として有効になっていません。

詳しくは、 **ファイルのオプション** 内の機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。

