---
title: Adobe Experience Managerのインストール
description: Adobe Experience Managerのインストール方法
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '172'
ht-degree: 0%

---

# Adobe Experience Managerのインストール {#id213BCI020E8}

AEMガイドは、Adobe Experience Managerの上にインストールされるプラグインです。 AEMのインストールには、AEMの基本概念と推奨されるデプロイメントシナリオを理解しておく必要があります。 次のリンクは、AEMのインストールを開始する際に役立ちます。

- [基本的なAEM概念](https://helpx.adobe.com/experience-manager/6-5/sites/deploying/using/deploy.html#BasicConcepts)

- [推奨されるAEMデプロイメント](https://helpx.adobe.com/experience-manager/6-5/sites/deploying/using/recommended-deploys.html)


>[!IMPORTANT]
>
> AEM 6.5.x で Java 11 を使用している場合、次の問題が発生する可能性があります。 *JDK 11 の原因`NoClassDefFoundError`*. 参照 [JDK 11 が原因で NoClassDefFoundError \| AEM 6.5 が発生する](https://helpx.adobe.com/experience-manager/kb/jdk-11-causes-noclassdeffounderror---aem-6-5.html) この問題を解決する記事を紹介します。

組織に最適なデプロイメント戦略を特定したら、インストールプロセスを実行します ( *[はじめに](https://helpx.adobe.com/jp/experience-manager/6-5/sites/deploying/using/deploy.html#GettingStarted)* AEMドキュメントの節を参照してください。

AEMインスタンスをアップグレードする予定がある場合は、次の手順に従う必要があります。

1. AEM Guides をアンインストールします。
1. AEMインスタンスをアップグレードします。
1. AEM Guides をインストールします。

>[!IMPORTANT]
>
> システムパフォーマンスの向上を検討できる、パフォーマンス最適化に関する推奨事項が多数あります。 詳しくは、 [Recommendations （パフォーマンス最適化）](download-install-recommend-perf-optimiz.md#) 」を参照してください。

**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)
