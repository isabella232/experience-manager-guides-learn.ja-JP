---
title: AEMガイドを初めてダウンロードしてインストールする
description: AEMガイドを初めてダウンロードしてインストールする方法を説明します
source-git-commit: 5ac066bb8db32944abd046f64da11eeb1bdbe467
workflow-type: tm+mt
source-wordcount: '235'
ht-degree: 2%

---


# AEMガイドを初めてダウンロードしてインストールする {#id213BCL00KEV}

次の手順を実行して、AEMガイドを初めてコンピューターにダウンロードし、インストールします。

>[!IMPORTANT]
>
> AEMガイドと共に Livefyre を使用する場合は、AEMガイドをインストールする前に、必ず 3.0 より前のバージョンの Livefyre をインストールしてください。 Livefyre バージョン 3.0 以降を使用している場合は、そのような制限はありません。

1. AEM Software Distribution Portal からAdobe Guides をダウンロードします。

1. AEMインスタンスにログインし、CRX パッケージマネージャーに移動します。 パッケージマネージャーにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/crx/packmgr/index.jsp
   ```

   パッケージマネージャーは、ローカルのAEMインストール上のパッケージを管理します。 パッケージマネージャーの使用について詳しくは、 [パッケージの操作方法](https://helpx.adobe.com/jp/experience-manager/6-5/sites/administering/using/package-manager.html) (AEMドキュメント )

   ![](assets/package-manager.png){width="650" align="left"}

1. AEM Guides パッケージをアップロードするには、 **パッケージをアップロード**.

1. パッケージをアップロードダイアログで、手順 1 でダウンロードしたAEM Guides ファイルに移動し、をクリックします。 **OK**.

   パッケージがAEMインスタンスにアップロードされます。

1. パッケージをインストールするには、 **インストール**.

   ![](assets/install-package.png){width="650" align="left"}

1. パッケージをインストールダイアログで、 **インストール**.

1. AEMガイドの使用を開始するには、「ホーム」ボタンをクリックします ![](assets/home-button.png) をクリックします。


>[!NOTE]
>
> 設定内のAEMサーバーのすべてのインスタンスで、インストール手順を実行します。

**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)

