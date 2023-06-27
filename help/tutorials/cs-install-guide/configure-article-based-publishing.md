---
title: 記事ベースの公開用パッケージのインストール
description: 記事ベースの公開用のパッケージをインストールする方法を説明します
source-git-commit: 6051181e243cf71919901093c1b5590f21832545
workflow-type: tm+mt
source-wordcount: '360'
ht-degree: 3%

---


# 記事ベースの公開用パッケージのインストール {#id21BNL02052Z}

AEMガイドは、Web エディターと統合された、強力な記事ベースの公開機能を提供します。 この機能を使用すると、1 つ以上のトピックを同時に公開できます。 マップエディタでマップを開いたら、[ 出力 ] タブに移動してプリセットを作成し、1 つ以上のトピックを選択して出力を生成できます。 記事ベースの公開機能を使用すると、1 つ以上のトピックの出力を増分的に生成したり、コンテンツをナレッジベースプラットフォームに記事ごとに公開したりできます。 詳しくは、 *「 Web エディター」セクションからの記事ベースの投稿* 」を参照してください。

記事ベースの出力を公開するAEMサイトを作成するには、次の手順を実行します。

1. ダウンロード **Cloud Service用XML Documentationコンポーネントコンテンツパッケージ** から [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/jp/general.html).
1. AEM Package Manager を開きます。 パッケージマネージャーにアクセスするデフォルトの URL は次のとおりです。 `https://<hostname>/crx/packmgr/index.jsp`
1. XML DocumentationコンポーネントコンテンツパッケージをCloud Service用にアップロードしてインストールします。
1. をダウンロードします。 `Knowledge-base-template-for-article-based-publishing-for-cloud-service.zip` ファイルから [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/jp/general.html).
1. グローバルナビゲーションから、 **サイト**.
1. サイト UI 内で、 **作成** 」ボタンを使用して設定できます。
1. 選択 **テンプレートからのサイト** から **作成** ドロップダウン。
1. 次をクリック： **インポート** ボタンをクリックし、 `Knowledge-base-template-for-article-based-publishing-for-cloud-service.zip` をシステムにダウンロードしました。 サイトテンプレートが読み込まれると、下部に一覧が表示されます。

   >[!NOTE]
   >
   > ZIP ファイルは初めてインポートする必要があります。 インポートすると、サイトテンプレートがリストに表示されます。

   選択 **記事ベースのパブリッシング用ナレッジベーステンプレート** AEMサイトを作成し、 **次へ** をクリックします。

1. 次を入力します。 **サイトのタイトル** そして **サイト名** をクリックし、 **作成** をクリックします。 AEMサイトは、 Targopan サイトテンプレートを使用して作成されます。 \(Targopan サイトは、カテゴリ、セクション、記事ページのテンプレートを含むサンプルのナレッジベースAEMサイトです。\)

   >[!NOTE]
   >
   > 同じテンプレートを使用して複数のAEMサイトを作成できます。


AEMサイトを使用して、Web エディターの出力プリセットを使用して記事を公開できます。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

