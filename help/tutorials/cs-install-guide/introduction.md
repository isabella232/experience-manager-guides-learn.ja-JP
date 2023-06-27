---
title: このガイドについて
description: このガイドの詳細
source-git-commit: e3b2fc8c96ce535bb91e7bce935720aa389a917a
workflow-type: tm+mt
source-wordcount: '724'
ht-degree: 10%

---


# このガイドについて {#id175MC0P0S5Z}

Adobe Experience Managerガイド\( 後で *AEMガイド*\) は、強力なクラウドベースのエンタープライズグレードのコンポーネントコンテンツ管理ソリューション (CCMS\) です。 Adobe Experience Managerでのネイティブ DITA サポートが可能になり、AEMで DITA ベースのコンテンツの作成と配信を処理できるようになります。 作成者は、使いやすい組み込みの Web エディターを使用してコンテンツを作成し、様々な出力形式に公開できます。

このガイドでは、AEMガイドをダウンロード、インストールおよび設定する手順を説明します。 このガイドでは、組織のオーサリングおよび公開のニーズに応じてAEMガイドを設定する詳細な手順を説明します。

このガイドは、次のタイプのオーディエンスを対象としています。

- AEMガイドのインストールと管理をおこなう管理者。

- パブリッシュタスクを実行して様々な形式の出力を生成するパブリッシャー（発行者）。


## コンテンツ構造

このガイドの情報は、次のように整理されています。

- [このガイドについて](#id175MC0P0S5Z):このトピックでは、このガイド、対象読者、およびこのガイドでの情報の編成方法の概要を説明します。

- [ダウンロードとインストール](download-install.md#):このトピックでは、AEMガイドをダウンロード、インストールまたはアップグレードする方法について説明します。

- [ユーザー管理とセキュリティ](user-admin-sec.md#):ここでは、AEMでのユーザーと認証のコア概念と、AEMガイドで作成されたデフォルトのユーザーグループについて説明します。

- [カスタム DITA-OT および DITA 特殊化の使用](dita-ot-specialization.md#):このトピックでは、カスタム DITA-OT プラグインの設定方法と DITA 特殊化の使用方法について説明します。

- [ドキュメントの状態の設定](customize-doc-state.md#):このトピックでは、DITA 文書のカスタムステートの設定方法を説明します。

- [既存のコンテンツを移行](migrate-content.md#):ここでは、AEMリポジトリの既存のコンテンツをオンボーディングする方法について説明します。

- [ファイル名を設定](conf-file-names.md#):このトピックでは、ファイル名を自動的に割り当て、有効なファイル名文字の正規表現を定義する設定を構成する方法について説明します。

- [トピックとマップのテンプレートの設定](conf-template-tags.md#):ここでは、オーサリングのニーズに合わせてトピックを設定し、テンプレートをマッピングする方法について説明します。 AEMでのタグ付けシステムと、AEMガイドと連携するタグを設定する方法について説明します。

- [Web エディタのカスタマイズ](conf-web-editor.md#):このトピックでは、Web エディターで様々なカスタマイズを行い、機能を強化する方法について説明します。

- [デフォルトで@navtitle属性を含める](auto-add-navtitle.md#):このトピックでは、 `@navtitle` 属性は、デフォルトではマップ内の参照ファイルに対して設定されます。

- [グローバルまたはフォルダーレベルのプロファイルの設定](conf-folder-level.md#):このトピックでは、フォルダープロファイルを作成し、特定のユーザーに権限を付与するプロセスについて説明します。

- [バージョン管理](version-management.md#):このトピックでは、Web エディターで編集用に開いたファイルの自動ファイルチェックアウトを設定する方法について説明します。

- [出力生成設定の指定](conf-output-generation.md#):このトピックでは、デフォルトの出力生成プロセスをカスタマイズするために行う様々な設定について説明します。

- [ワークフローの設定とカスタマイズ](customize-workflows.md#):このトピックでは、AEMガイドに記載されているデフォルトのワークフローをカスタマイズするための様々な設定について説明します。

- [コンテンツを翻訳](translation.md#):このトピックには、翻訳フレームワークを理解し設定するのに役立つ、AEMドキュメント内の関連するヘルプ記事へのリンクが含まれています。 また、コンポーネントベースの翻訳ワークフローを有効にする方法についても説明します。

- [AEM Assets UI の検索の設定](conf-dita-search.md#):このトピックでは、Assets UI での DITA コンテンツ検索の設定方法と、検索でのカスタム属性の追加方法について説明します。


## Adobe Experience Manager\(AEM\) の概要

[Adobe Experience Manager \(AEM\)](https://business.adobe.com/jp/products/experience-manager/adobe-experience-manager.html) は、Web サイト、モバイルアプリ、フォームを構築するための包括的なコンテンツ管理ソリューションです。 AEMは、マーケティングコンテンツやアセットの管理を支援します。 AEMはas a Cloud Service可能です。 AEM as a Cloud Serviceは、AEM Content Management System の機能とAEM Digital Asset Management を組み合わせて、コンテンツ主導のパーソナライズされたエクスペリエンスを顧客に提供するのに役立ちます。AEM as a Cloud Serviceの導入と導入に役立つ主要リソースの一部を次に示します。

- [Experience Manageras a Cloud Serviceの概要](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/home.html?lang=ja)
- [AEM as a Cloud Service への移行ジャーニーの概要](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/migration-journey/getting-started.html?lang=en)
- [オンボーディングを開始してExperience Manageras a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/onboarding/home.html?lang=enhttps://experienceleague.adobe.com/docs/experience-manager-cloud-service/moving/home.html?lang=en)
- [AEM as a Cloud Service のアプリケーションの実装](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/home.html?lang=ja)
- [AEM as a Cloud Service へのデプロイ](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/implementing/deploying/overview.html?lang=ja)
- [Assets as a Cloud Service ガイド](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/home.html?lang=ja)

## その他のリソース

次に、AEMガイドのその他の役立つリソースのリストを示します。これらのリソースは、 [ラーニングとサポート](https://helpx.adobe.com/support/xml-documentation-for-experience-manager.html) ページ：

- ユーザーガイド
- API リファレンスガイド

