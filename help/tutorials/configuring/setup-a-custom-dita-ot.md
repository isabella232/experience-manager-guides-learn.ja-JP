---
title: でのカスタム DITA-OT の設定 [!DNL AEM Guides]
description: でカスタム DITA-OT を設定する方法を説明します。 [!DNL Adobe Experience Manager Guides]
role: Admin
exl-id: f479c2cf-5b8b-4517-be97-81303468007a
source-git-commit: b5e64512956f0a7f33c2021bc431d69239f2a088
workflow-type: tm+mt
source-wordcount: '153'
ht-degree: 0%

---

# でのカスタム DITA-OT の設定 [!DNL AEM Guides] (AEMの場合 )

カスタム DITA-OT を追加する手順については、の節を参照してください。 _カスタム DITA-OT プラグインの使用_ の _インストールおよび設定ガイド_.

手順の概要は次のとおりです。

+ 基本的な DITA-OT の取得
   + 標準搭載の DITA-OT を [!DNL AEM Guides]、パスからダウンロード `/etc/fmdita/dita_resources/DITA-OT.zip`
   + 別のバージョンを入手する場合は、 [dita-ot repo](https://www.dita-ot.org/download)
+ DITA-OT に「いいね！」を変更 [新しいプラグインの追加](https://www.dita-ot.org/dev/topics/plugins-installing.html)既存のプラグインのカスタマイズ（以下の関連リンクの節を参照）
+ アップロード `DITA-OT.zip` 受信先 `/apps/<project-folder>/dita_resources` （カスタムプロジェクトフォルダーの作成が推奨される方法です）
+ を使用した DITA プロファイルの追加 **[!UICONTROL ツール]** > **[!UICONTROL ガイド]** > **[!UICONTROL DITA プロファイル]** （カスタム DITA-OT がアップロードされた DITA-OT パスを使用します。下のスクリーンショットを参照してください）
   ![DITA プロファイル](assets/dita-profile.png)

>[!MORELIKETHIS]
>
>+ [DITA-OT プラグインのサンプルのカスタマイズ](https://www.dita-ot.org/dev/topics/pdf-customization.html)

