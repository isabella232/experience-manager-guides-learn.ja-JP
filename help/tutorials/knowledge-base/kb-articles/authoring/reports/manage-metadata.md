---
title: AEMガイドでの DITA ファイルのタグの管理
description: AEMガイドでの cq:tags の管理について説明する簡単な記事
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '280'
ht-degree: 1%

---

# DITA コンテンツでタグを追加、削除および管理する方法

タグは、コンテンツの分類に役立ちます。 コンテンツが適切にタグ付けされている場合、この機能を使用すると、ditamap とエンドユーザーで正確なトピックを検索し、パブリッシュされた出力で適切なコンテンツをより迅速に見つけることができます。

> **_注意：_**  次の記事は、 AEM Guides Build 4.2 （オンプレミス） /2023 年 2 月（クラウドバージョン）以降のバージョン向けです。


## タグを作成

タグ付けはAEMのネイティブ機能で、AEM管理者がこれらのタグの初期作成と設定に役立ちます。


## DITA コンテンツのタグの追加、削除および管理

**AEM cq で作成されたタグは、DITA コンテンツ用にタグの追加、削除および管理が可能です。**

DITA コンテンツにタグを追加する方法は様々ですが、この記事はAEM Guides の Web-Editor UI に集中します。

### 手順：

1. ガイド UI のリポジトリビューに移動
2. ditamap をダブルクリックし、マップビューで開きます。
3. 「管理」タブに移動します。
4. 「管理」タブで、「メタデータに移動」オプションを選択します。
5. 直接および間接の全 ditamap ファイルリストは、ここに読み込まれます。
6. 1 つ以上のファイルを選択し、「管理」アイコンをクリックします。 ここで、選択したファイルにタグを追加できます。
また、選択したファイルで共通する既存のタグを削除することもできます。

<img title="AEMガイドでのタグの管理 " alt="DITA でのタグの管理 " src="ManageTags.jpg">

## トラブルシューティングと FAQ

### 管理 —> メタデータのリストが空か不完全です

`If list is empty or  incomplete then you may need to run the indexing on your ditamap, You can refer` [アップグレード手順（コンテンツのインデックス作成）](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/install-guide/on-prem-ig/download-install-upgrade-aemg/upgrade-xml-documentation.html?lang=en#steps-to-index-the-existing-content-to-use-the-new-find-and-replace%3A)

### カスタムメタデータはリストで使用できません

`Only Tags present in cq:tags can be managed from here and custom metadata is not supported`




## その他の役立つリソース

- [マップダッシュボード (Assets UI) を使用した一括タグ付け](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/user-guide/manaege-metadata/map-editor-bulk-tagging.html?lang=en)
- [Web エディタでの Ditamap レポート](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/user-guide/reports-aem-guide/reports-web-editor.html?lang=en)
- [AEMでのタグ付け](https://experienceleague.adobe.com/docs/experience-manager-learn/assets/configuring/tagging.html?lang=en)


**その他の質問については、それぞれの CSM にお問い合わせください**
