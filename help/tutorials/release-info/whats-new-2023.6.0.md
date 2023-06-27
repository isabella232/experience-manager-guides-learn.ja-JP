---
title: リリースノート | 2023 年 6 月リリースのAdobe Experience Managerガイドの新機能
description: 2023 年 6 月リリースのAdobe Experience Managerガイドの新機能と拡張機能をas a Cloud Service
exl-id: ff6ac4a4-76a3-4b41-9da7-6a888de0eca5
source-git-commit: f6794078e760565f5934faf63a7cbfb919acce90
workflow-type: tm+mt
source-wordcount: '1127'
ht-degree: 0%

---

# 2023 年 6 月リリースのAdobe Experience Managerガイドas a Cloud Serviceの新機能

この記事では、Adobe Experience Managerガイド ( 後で *AEMガイドas a Cloud Service*) をクリックします。

アップグレードの手順、互換性マトリックス、およびこのリリースで修正された問題について詳しくは、 [リリースノート](release-notes-2023.6.0.md) 記事。

## Web エディターでの壊れたリンクレポート

AEMガイドを使用すると、技術ドキュメントが完全に完全であるかどうかを確認し、Web エディターからレポートを生成できます。 2023 年 6 月のリリースAEMガイドで、壊れたリンクを表示および修正する機能が提供されます。 これは、壊れたリンクを管理するのに非常に役立つレポートです。 DITA マップに存在する壊れたリンクを簡単に表示し、修正することができます。
![](assets/broken-link-report.png){width="800" align="left"}

リンクを修正すると、壊れたリンクのリストには表示されません。

詳しくは、 [壊れたリンクを表示および修正](../user-guide/reports-web-editor.md#report-broken-links).

## リポジトリビュー内でのファイルの名前変更と移動

また、リポジトリパネルからファイルの名前を変更したり、移動したりできるようになりました。 この機能は非常に便利で、リポジトリパネルから簡単にファイルを管理できます。 ファイルを選択し、 **オプション** 選択したファイルのメニュー。 AEMガイドは、ファイルの移動または名前変更時に成功メッセージを表示します。

![](assets/rename-move-assets.png){width="650" align="left"}

ファイルの [ オプション ] メニューの詳細については、 **リポジトリ表示** 機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。

## ネイティブPDFの強化

### ドラフトドキュメントのPDF出力に透かしを追加する

これで、まだ承認されていないドキュメントのPDF出力に透かしを追加できます。 ドキュメントのPDFを「承認済み」ドキュメント状態で生成した場合、この透かしは表示されません。 例えば、透かしのドラフトをPDF出力に追加できます。

詳しくは、 [ドラフトドキュメントのPDF出力に透かしを追加する](../native-pdf/use-javascript-content-style.md#watermark-draft-document).

### DITA 要素での言語変数のサポート

AEMガイドは、言語変数をサポートしています。 これらの変数は、注意、ヒント、警告、注意などの要素に対してローカライズされた文字列を生成する場合に非常に役立ちます。
例えば、次の方法でメモをPDF出力に表示できます。

ドイツ語：通知

スペイン語：野田


### ページフッターでの言語変数のサポート

ドキュメントのマスターページ上の実行中のヘッダーまたはフッターに言語変数を追加できます。 変数は、このマスターページが適用されているドキュメントのすべてのボディページに表示されます。 例：1 / 1 ページ。
また、様々な言語で数値を表示する場合にも使用できます。

### TOC のローカライズされたプレフィックス

また、見出しにプレフィックスを表示するために使用するローカライズされた用語を表示する機能もあります。
例えば、次の方法でPDF出力に「Chapter」プレフィックスを表示できます。

ドイツ語：カピテル

スペイン語：カピトロ

### レイアウトでのAEMメタデータのPDF機能

メタデータは、コンテンツの説明または定義です。 このメタデータは、ソース DITA マップコンテンツに保存されます。

これで、AEMガイドで、アセットのメタデータプロパティを選択し、ページレイアウトに追加することもできます。 次に、AEMガイドはアセットのこれらのメタデータプロパティを選択し、PDF出力にパブリッシュします。


![](assets/native-pdf-metadata-asset.png){width="550" align="left"}

>[!NOTE]
>
> AEMガイドは、DITA マップのメタデータプロパティもサポートします。

詳しくは、 [フィールドとメタデータを追加](../native-pdf/design-page-layout.md#add-fields-metadata).


## Schematron の機能強化

### レポート文を使用して、Schematron 内のルールを確認します

AEMガイドで、Schematron のレポート文もサポートされるようになりました。 テストステートメントが true と評価されると、レポートステートメントはメッセージを生成します。 例えば、短い説明を 150 文字以下にしたい場合、レポート文を定義して、短い説明が 150 文字を超えるトピックを確認できます。

詳しくは、 [assert ステートメントと report ステートメントを使用して、ルールを確認する](../user-guide/support-schematron-file.md#schematron-assert-report).

### 正規表現の使用

正規表現式を使用して matches() 関数でルールを定義し、Schematron ファイルを使用して検証を実行することもできます。

詳しくは、 [正規表現の使用](../user-guide/support-schematron-file.md#schematron-assert-report).


### 抽象パターンの定義

AEMガイドは、Schematron の抽象パターンもサポートしています。 汎用の抽象パターンを定義し、これらの抽象パターンを再利用できます。 抽象パターンは、Schematron スキーマを簡略化し、検証ロジックの管理と更新に役立ちます。


詳しくは、 [抽象パターンの定義](../user-guide/support-schematron-file.md#schematron-abstract-patterns).

## Web エディターからAEMホームページに移動します。

これで、Web エディターからAEMのホームページに簡単に移動できます。

![](assets/web-editor-launch-page.png){width="800" align="left"}

* 次をクリック： **ガイド** アイコン (![](assets/aem-guides-icon.png) ) をクリックし、AEMナビゲーションページに戻ります。


詳しくは、 [AEM Navigation ページ](../user-guide/web-editor-launch-editor.md#id2056BG00RZJ).

## サブジェクト定義と列挙の階層定義の処理

AEMガイドには、分類の件名や制御値を定義する DITA マップの特殊な形式である、件名スキームマップを作成するための強力な機能が付属しています。 AEMガイドでは、マップの件名定義と、別のマップの列挙定義も定義できるようになりました。 その後、マップ参照を追加し、件名スキームを使用できます。
件名列挙の参照は、同じマップまたは参照先のマップで解決されます。

サブジェクトの定義と列挙の階層的定義の処理の詳細については、 **件名スキーム** 機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。

## 翻訳での XLIFF 形式のサポート

AEMガイドでは、翻訳時の XML Localization Interchange File Format(XLIFF) 形式のサポートも提供しています。 現在は、 **新しい XLIFF 翻訳プロジェクトの作成** をクリックして、XML コンテンツを XLIFF 形式に変換します。
この形式を使用して、コンテンツを業界標準の XLIFF 形式に書き出し、翻訳ベンダーに提供できます。 詳しくは、 [翻訳プロジェクトを作成](../user-guide/translate-documents-web-editor.md#create-translation-project).

![](assets/translation-project-types.png){width="350" align="left"}



## お気に入りパネルの改善

AEMガイドは、ファイルやフォルダーのコレクションやお気に入りのリストを作成し、それらを簡単に使用するのに役立ちます。 今すぐ **オプション** メニューは **お気に入り** パネル。 選択したコレクションの名前を変更したり、 **オプション** メニュー 次の項目を選択できます。 **更新** 」オプションを使用して、リポジトリからファイルまたはフォルダーの新しいリストを取得できます。 Assets UI でフォルダーのコンテンツを表示することもできます。

![](assets/favorites-options.png){width="650" align="left"}

>[!NOTE]
>
> また、 **更新** アイコンをクリックします。

詳しくは、 **オプション** [ お気に入り ] コレクションのメニュー ( **お気に入り** 機能の説明 [左パネル](../user-guide/web-editor-features.md#id2051EA0M0HS) 」セクションに入力します。

## システムテーマに切り替え

これで、デバイステーマを使用することもできます。 の使用 **ユーザーの環境設定**&#x200B;では、デバイスのテーマに基づいてAEMガイドを自動的に明るいテーマと暗いテーマを切り替えるように設定できます。

![](assets/device-theme-user-preferences.png){width="550" align="left"}

詳しくは、 **ユーザーの環境設定** 機能の説明 [メインツールバー](../user-guide/web-editor-features.md#id2051EA0G05Z) 」セクションに入力します。
