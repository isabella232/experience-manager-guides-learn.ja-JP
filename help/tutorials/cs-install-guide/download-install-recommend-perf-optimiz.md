---
title: Recommendations （パフォーマンス最適化）
description: パフォーマンス最適化のためのRecommendationsについて説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '149'
ht-degree: 0%

---

# Recommendations （パフォーマンス最適化） {#id213BD0JG0XA}

パフォーマンスを最適化する際は、次の点を考慮してください。

- コンテンツとインデックス作成のエクスペリエンスを最適化するには、 [コンテンツの検索とインデックス作成の最適化](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/operations/indexing.html?lang=ja) (AEMドキュメント )。

- 公開にカスタム DITA-OT を使用する際に Xerces Jar にパッチを適用します。 これは、使用事例に応じて必須の設定です。 この変更は、出力の公開にカスタム DITA-OT を使用する場合にのみ必要です。

  *必要な設定*：カスタム DITA-OT パッケージの Xerces Jar ファイルを、出荷済みの OOTB ファイルに置き換えます。 デフォルトの OOTB xercesImpl-2.11.0.jar ファイルは、/libs/fmdita/dita\_resources/DITA-OT.zipファイル内で使用できます。 置き換えられる古い Xerces Jar ファイルと一致するように、xercesImpl-2.11.0.jar ファイルの名前を変更してください。 これは、実行時に実行できます。

  この変更により、多数のトピックを含む DITA マップを公開する際に、公開時間とメモリ使用率が低減します。


**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)
