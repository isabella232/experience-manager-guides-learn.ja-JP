---
title: 追加方法 [!DNL AEM Guides] を [!DNL AEM as a Cloud Service] 環境
description: 追加方法を学ぶ [!DNL AEM Guides] を [!DNL AEM as a Cloud Service] 環境
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '213'
ht-degree: 0%

---

# [!DNL AEM Guides] as a Cloud Service展開

追加方法を学ぶ [!DNL Guides] を [!DNL AEM as a Cloud Service] 環境。

## Cloud Manager の Git パイプラインを介した手動デプロイメント

を購入した場合 [!DNL AEM Guides] As a Cloud Service（2022 年 3 月 30 日）以前は、次のデプロイメント手順に従っています。

* 新規に開始する場合は、 [!UICONTROL Cloud Manager] XML プラグインが既に統合されている以下のリポジトリのコードを使用： https://github.com/Adobe-TCS/XML-documentation-for-AEMaaCS

* 既に [!UICONTROL Cloud Manager] git リポジトリの場合、既存のコードに XML プラグインを追加する方法については、以下のリポジトリを参照してください。 https://github.com/Adobe-TCS/DoX-Installer-for-AEMaaCS

## Cloud Manager を使用したデプロイメント

を購入した顧客の場合は、 [!DNL AEM Guides] As a Cloud Service 03/29/2022以降、以下の手順に従って、 [!DNL Guides] を [!DNL AEM as a Cloud Service] 環境：

1. ログイン先 [!UICONTROL Cloud Manager].

1. 設定するプログラムを編集します [!DNL AEM Guides].

1. 切り替え先 **[!UICONTROL ソリューションとアドオン]** タブをクリックします。

1. Adobe Analytics の **[!UICONTROL ソリューションとアドオン]** テーブル、クリック **[!UICONTROL Assets]**.

1. 選択 **[!UICONTROL ガイド]** を選択し、 **[!UICONTROL 保存]**.

AEM Guide ソリューションの自動プロビジョニング用のプログラムが正常に設定されました。

![AEM Guides ソリューションの設定](assets/addon-configuration.png)

>[!NOTE]
>
>をインストールするには [!DNL AEM Guides] 統合プログラムの下の任意の環境で、環境に関連付けられたパイプラインを実行する必要があります。 をインストールするために CM Git コードベースで追加の設定は必要ありません。 [!DNL AEM Guides].
