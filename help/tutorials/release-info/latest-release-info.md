---
title: AEMガイドリリース
description: 最新のAEMガイドリリースと前提条件のAEMバージョン
exl-id: 780697a9-bdc6-40c2-b258-64639fe30f88
source-git-commit: b5e64512956f0a7f33c2021bc431d69239f2a088
workflow-type: tm+mt
source-wordcount: '712'
ht-degree: 1%

---

# [!DNL AEM Guides] リリース

[!DNL Adobe Experience Manager Guides] は、AEMにデプロイされたアプリケーションです。 これは、Adobe Experience Managerでのネイティブ DITA サポートを可能にし、AEMが DITA ベースのコンテンツの作成と配信を処理できる、強力なエンタープライズグレードのコンポーネントコンテンツ管理ソリューション (CCMS) です。

## UUID と非 UUID の比較の説明

[!DNL AEM Guides] パッケージは、UUID ビルドと非 UUID ビルドの 2 つのモードで使用できます。

最初の設定時に、UUID モードと非 UUID モードのどちらを選択するかを決定する必要があります（ユーザーの使用状況に基づいて判断を下すのに役立つように、カスタマーサクセスマネージャーに連絡してください）。

1 つのバージョンのからアップグレードする場合 [!DNL AEM Guides] 新しいバージョンでは、既存のモードに合わせて同じモード（UUID /非 UUID）を選択する必要があります。 UUID 以外のビルドは、UUID ビルドに直接アップグレードしないでください。 非 UUID ビルドから UUID ビルドに移行する場合、コンテンツ移行が必要になります。

**ビルドのアップグレード**

古いバージョンから新しいバージョンにアップグレードする場合 [!DNL AEM Guides]の場合は、移行スクリプトの実行が必要になる場合があります。 アップグレードの手順については、リリースノートおよびバージョン固有のドキュメントを参照してください。

一部のアップグレードパスが直接サポートされるわけではありません。 例えば、バージョン 4.0 への直接アップグレードは、バージョン 3.8 からのみ可能です。3.8 より前のバージョンを使用している場合は、バージョン固有のドキュメントを参照して、アップグレード手順を確認してください [ヘルプアーカイブ](https://helpx.adobe.com/xml-documentation-for-experience-manager/archive.html).
アップグレードパスを検証するには、カスタマーサクセスマネージャーにお問い合わせください。

**[!DNL AEM Guides]ビルド**

以下のリストに、最新の [!DNL AEM Guides] AMS またはオンプレミスにインストールするために使用できるパッケージ、対応するAEMバージョン（前提条件）、パッケージのダウンロードリンク、その他の役立つ情報。 の最新ビルドのみを使用することをお勧めします。 [!DNL AEM Guides]. 何らかの理由で古いビルドにアクセスする必要がある場合は、アカウントのカスタマーサクセスマネージャーに連絡してください。

>[!NOTE]
>
>にアクセスするには、カスタマーサクセスマネージャーにお問い合わせください。 [!DNL AEM Guides] AEM as a Cloud Service用にビルドされます。

| [!DNL AEM Guides] リリース | リリースノート | AEM前提条件 | ダウンロードリンクの作成 |
|---|---|---|---|
| **AEMガイド 4.0** | [4.0.x リリースノート](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-4-0.html) | **非 UUID および UUID 4.0.3**<br> AEM 6.5 SP12、SP11、SP10、または SP9 <br>Java:11 または 8 <br><br> <br>**非 UUID および UUID 4.0.2** <br> AEM 6.5 SP12、SP11、SP10、または SP9 <br>Java:11 または 8 <br><br> **非 UUID および UUID 4.0** <br> AEM 6.5 SP11、SP10、または SP9 | **非 UUID**: <br> **AEM 6.5** <br>[4.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-3%2F4-0-2-non-uuid%2Fcom.adobe.fmdita-6.5-hotfix-4.0.3.1.zip)<br>[4.0.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-2%2F4-0-2-non-uuid%2Fcom.adobe.fmdita-6.5-sp-4.0.2.10.zip)  <br> [4.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/4-0/4-0-non-uuid/com.adobe.fmdita-6.5-4.0.70.zip)  <br><br> **UUID** <br>**AEM 6.5**  <br>[4.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-3%2F4-0-3-uuid%2Fcom.adobe.fmdita.uuid-6.5-hotfix-4.0.3.1.zip) <br>[4.0.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-2%2F4-0-2-uuid%2Fcom.adobe.fmdita.uuid-6.5-sp-4.0.2.10.zip)<br> [4.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/4-0/4-0-uuid/com.adobe.fmdita-6.5-uuid-4.0.70.zip) |
| **AEMガイド 3.8.5** <br> 3.8.5 は、3.8 上の SP リリースです。 <br>3.8.5 SP には重要な修正が含まれているので、3.8 リリースはスタンドアロンでインストールしてはいけません。 <br>お客様は、最初に 3.8 をインストールしてから、SP 3.8.5 をインストールする必要があります。 | [3.8.x リリースノート](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-3-8.html) | **非 UUID** <br> AEM 6.5 SP9 または SP8 <br> AEM 6.4 SP8 <br> AEM 6.3 SP3 <br><br> **UUID** <br> AEM 6.5 SP9 または SP8 | **非 UUID**: <br> **AEM 6.5** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.5-hotfix-3.8.5.2.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.5-3.8.166.zip)<br> **AEM 6.4** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.4-hotfix-3.8.5.1.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.4-3.8.166.zip) <br> **AEM 6.3** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.3-hotfix-3.8.5.1.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.3-3.8.166.zip) <br><br> **UUID** <br>**AEM 6.5** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5uuid/com.adobe.fmdita.uuid-6.5-hotfix-3.8.5.2.zip) <br> [3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8uuid/com.adobe.fmdita.uuid-6.5-3.8.168.zip) |
