---
title: アップグレードAEMガイド
description: AEMガイドのアップグレード方法を説明します
source-git-commit: 6051181e243cf71919901093c1b5590f21832545
workflow-type: tm+mt
source-wordcount: '104'
ht-degree: 0%

---


# アップグレードAEMガイド {#id213BD050YPH}

1. Cloud Manager の Git リポジトリにアクセスします。

1. dox/dox.installer/pom.xmlファイルを更新します。

1. dox.version 変数の値を、Adobeで指定されたバージョンの詳細に更新します。

1. 変更をコミットし、Cloud Manager パイプラインを実行して、アップグレードされたパッケージをデプロイします。


>[!NOTE]
>
> CI/CD パイプラインの使用について詳しくは、 [Cloud Manager での CI/CD パイプラインのAdobe](https://experienceleague.adobe.com/docs/experience-manager-learn/foundation/cloud-manager/use-the-cicd-pipeline-in-cloud-manager-for-aem.html).

## ブラウザーキャッシュをクリア

アップグレードプロセスが完了したら、アップグレードバージョンのAEMガイドを使用する前に、すべてのユーザーがブラウザーのキャッシュをクリアする必要があります。

**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)

