---
title: AEMガイドリリース
description: 最新のAEMガイドリリースと前提条件のAEMバージョン
exl-id: 780697a9-bdc6-40c2-b258-64639fe30f88
source-git-commit: b53f76c2f0234c1ef6c65d954311e3f8c980ffe2
workflow-type: tm+mt
source-wordcount: '1327'
ht-degree: 0%

---

# [!DNL AEM Guides] リリース

[!DNL Adobe Experience Manager Guides] は、AEMにデプロイされたアプリケーションです。 これは、Adobe Experience Managerでのネイティブ DITA サポートを可能にし、AEMが DITA ベースのコンテンツの作成と配信を処理できる、強力なエンタープライズグレードのコンポーネントコンテンツ管理ソリューション (CCMS) です。

AEMガイドパッケージは、UUID ビルドと非 UUID ビルドの 2 つのバリエーションで使用できます。

## UUID ビルドと非 UUID ビルド

UUID ビルドと非 UUID ビルドの主な違いは次のとおりです。

|  | 非 UUID ビルド | UUID ビルド |
|---|---|---|
| **アセットの識別** | すべてのアセットは、リポジトリ内のアセットのパスを使用して識別されます。 | すべてのアセットは、UUID（アセットが最初にアップロードされたときにシステムで生成される一意の ID）を使用して識別されます。 |
| **参照の作成** | すべてのコンテンツ参照は、そのパスに基づいて作成されます。 | すべてのコンテンツ参照は、UUID に基づいて作成されます。 |

### UUID ビルドのメリット

* UUID のインストールのパフォーマンスが向上しました。
   * 参照はパスに依存しません。参照管理システムは、参照がパスではなく UUID に基づいて作成されるので、リンクを認識します。
   * 移動/更新操作が効率的：アセットがリポジトリ内の別のパスに移動した場合でも、UUID は同じままになります。 したがって、移動/更新操作時にアセット間の参照にパッチを適用するための処理は不要です。
* UUID ビルドは将来を見据えたもので、AEMガイドのクラウド設定にもこのフレームワークを使用しています。


### 2 つのビルドの中から選択

* 新規のお客様の場合は、UUID ビルドを使用することをお勧めします。
* 既存のお客様は、非 UUID ビルドから UUID ビルドへの移行が可能になったので、UUID ビルドへの移行を選択できます。 詳しくは、 *非 UUID から UUID へのコンテンツの移行* セクション内 **Adobe Experience Manager Guides をインストールして設定します。**

>[!NOTE]
>
>* 初回セットアップ時に UUID モードと非 UUID モードのどちらを選択するかを決定する必要があります（ヘルプが必要な場合は、ユーザーの使用状況に基づいて判断を下すのに役立つように、カスタマーサクセスマネージャーに連絡してください）。
>* AEMガイドの 1 つのバージョンから新しいバージョンにアップグレードする場合、既存のモードに合わせて同じモード（UUID /非 UUID）を選択する必要があります。 非 UUID ビルドは、UUID ビルドに直接アップグレードしないでください。 非 UUID ビルドから UUID ビルドに移行する場合は、コンテンツ移行が必要になります。

**ビルドのアップグレード**

古いバージョンから新しいバージョンにアップグレードする場合 [!DNL AEM Guides]の場合は、移行スクリプトの実行が必要になる場合があります。 アップグレードの手順については、リリースノートおよびバージョン固有のドキュメントを参照してください。

一部のアップグレードパスが直接サポートされるわけではありません。 例えば、バージョン 4.0 への直接アップグレードは、バージョン 3.8 からのみ可能です。3.8 より前のバージョンの場合は、バージョン固有のドキュメントを参照して、アップグレード手順を確認してください [ヘルプアーカイブ](https://helpx.adobe.com/xml-documentation-for-experience-manager/archive.html).
アップグレードパスを検証するには、カスタマーサクセスマネージャーにお問い合わせください。

**[!DNL AEM Guides]ビルド**

以下のリストには、最新の [!DNL AEM Guides] AMS またはオンプレミスにインストールするために使用できるパッケージ、対応するAEMバージョン（前提条件）、パッケージのダウンロードリンク、その他の役立つ情報。 の最新ビルドのみを使用することをお勧めします。 [!DNL AEM Guides]. 何らかの理由で古いビルドにアクセスする必要がある場合は、アカウントのカスタマーサクセスマネージャーに連絡してください。

>[!NOTE]
>
>にアクセスするには、カスタマーサクセスマネージャーにお問い合わせください。 [!DNL AEM Guides] AEM as a Cloud Service用にビルドされます。

| [!DNL AEM Guides] リリース | リリースノート | AEMの前提条件 | ダウンロードリンクの作成 |
|---|---|---|---|
| **AEMガイド 4.3.0** | [4.3.0 リリースノート](./release-notes-4.3.md) | **非 UUID および UUID 4.3.0** <br>AEM 6.5 SP18、SP17、SP16、SP15、または SP14 <br><br>   Java:11 または 8 | **非 UUID AEM 6.5** <br> [4.3.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-3%2Fcom.adobe.fmdita-6.5-4.3.0.347.zip)<br> **UUID AEM 6.5** <br> [4.3.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-3%2Fcom.adobe.fmdita-6.5-uuid-4.3.0.347.zip) |
| **AEMガイド 4.2** | [4.2.1 リリースノート](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/release-notes/on-prem-release-notes/42-release/42-release-notes/release-notes-4.2.1.html?lang=en)<br> <br> [4.2 リリースノート](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/release-notes/on-prem-release-notes/42-release/42-release-notes/release-notes-4.2.html?lang=en) | **非 UUID および UUID 4.1.2**<br><br> AEM 6.5 SP15、SP14、SP13、または SP12 <br><br>Java:11 または 8 <br><br>**非 UUID および UUID 4.2**<br><br> AEM 6.5 SP15、SP14、SP13、または SP12 <br><br>Java:11 または 8<br><br> | **非 UUID**: <br> **AEM 6.5** <br>[4.2.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-2-1%2F4-2-1-non-uuid%2Fcom.adobe.fmdita-6.5-4.2.1.270.zip)<br>[4.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-2%2F4-2-non-uuid%2Fcom.adobe.fmdita-6.5-4.2.229.zip)<br><br> **UUID** <br>**AEM 6.5** <br>[4.2.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-2-1%2F4-2-1-uuid%2Fcom.adobe.fmdita-6.5-uuid-4.2.1.270.zip)<br>[4.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-2%2F4-2-uuid%2Fcom.adobe.fmdita-6.5-uuid-4.2.229.zip)<br> |
| **AEMガイド 4.1** | [4.1.x リリースノート](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/release-notes/on-prem-release-notes/release-notes-4.1.html) | **非 UUID および UUID 4.1.2**<br><br> AEM 6.5 SP13、SP12、SP11、または SP10 <br>Java:11 または 8 <br><br>**非 UUID および UUID 4.1**<br><br> AEM 6.5 SP13、SP12、SP11、または SP10 | **非 UUID**: <br> **AEM 6.5** <br>[4.1.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1-3%2F4-1-3-non-uuid%2Fcom.adobe.fmdita-6.5-sp-4.1.3.2.zip)<br>[4.1.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1-2%2F4-1-2-non-uuid%2Fcom.adobe.fmdita-6.5-sp-4.1.2.11.zip)<br>[4.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1%2F4-1-non-uuid%2Fcom.adobe.fmdita-6.5-4.1.159.zip)<br><br> **UUID** <br>**AEM 6.5** <br>[4.1.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1-3%2F4-1-3-uuid%2Fcom.adobe.fmdita.uuid-6.5-sp-4.1.3.2.zip)<br>[4.1.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1-2%2F4-1-2-uuid%2Fcom.adobe.fmdita.uuid-6.5-sp-4.1.2.11.zip)<br>[4.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-1%2F4-1-uuid%2Fcom.adobe.fmdita-6.5-uuid-4.1.159.zip) |
| **AEMガイド 4.0** | [4.0.x リリースノート](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-4-0.html) | **非 UUID および UUID 4.0.3**<br> AEM 6.5 SP12、SP11、SP10、または SP9 <br>Java:11 または 8 <br><br> <br>**非 UUID および UUID 4.0.2** <br> AEM 6.5 SP12、SP11、SP10、または SP9 <br>Java:11 または 8 <br><br> **非 UUID および UUID 4.0** <br> AEM 6.5 SP11、SP10、または SP9 | **非 UUID**: <br> **AEM 6.5** <br>[4.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-3%2F4-0-2-non-uuid%2Fcom.adobe.fmdita-6.5-hotfix-4.0.3.1.zip)<br>[4.0.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-2%2F4-0-2-non-uuid%2Fcom.adobe.fmdita-6.5-sp-4.0.2.10.zip)  <br> [4.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/4-0/4-0-non-uuid/com.adobe.fmdita-6.5-4.0.70.zip)  <br><br> **UUID** <br>**AEM 6.5**  <br>[4.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-3%2F4-0-3-uuid%2Fcom.adobe.fmdita.uuid-6.5-hotfix-4.0.3.1.zip) <br>[4.0.2](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faemdox%2F4-0-2%2F4-0-2-uuid%2Fcom.adobe.fmdita.uuid-6.5-sp-4.0.2.10.zip)<br> [4.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/4-0/4-0-uuid/com.adobe.fmdita-6.5-uuid-4.0.70.zip) |
| **AEMガイド 3.8.5** <br> 3.8.5 は、3.8 上の SP リリースです。 <br>3.8.5 SP には重要な修正が含まれているので、3.8 リリースはスタンドアロンでインストールしてはいけません。 <br>お客様は、最初に 3.8 をインストールしてから、SP 3.8.5 をインストールする必要があります。 | [3.8.x リリースノート](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-3-8.html) | **非 UUID** <br> AEM 6.5 SP9 または SP8 <br> AEM 6.4 SP8 <br> AEM 6.3 SP3 <br><br> **UUID** <br> AEM 6.5 SP9 または SP8 | **非 UUID**: <br> **AEM 6.5** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.5-hotfix-3.8.5.2.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.5-3.8.166.zip)<br> **AEM 6.4** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.4-hotfix-3.8.5.1.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.4-3.8.166.zip) <br> **AEM 6.3** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5/com.adobe.fmdita-6.3-hotfix-3.8.5.1.zip) <br>[3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8/com.adobe.fmdita-6.3-3.8.166.zip) <br><br> **UUID** <br>**AEM 6.5** <br> [3.8.5 SP](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8-5uuid/com.adobe.fmdita.uuid-6.5-hotfix-3.8.5.2.zip) <br> [3.8](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/aemdox/3-8uuid/com.adobe.fmdita.uuid-6.5-3.8.168.zip) |
