---
title: DITA-OT を使用してメタデータを出力に渡します。
description: DITA-OT を使用してメタデータを出力に渡す方法を説明します。
source-git-commit: 8b6294425c6e60d1c5b37d98e99114014a104ee6
workflow-type: tm+mt
source-wordcount: '306'
ht-degree: 0%

---


# DITA-OT を使用してメタデータを出力に渡します。 {#id21BJ00QD0XA}

メタデータは、出力に関する追加情報です。 AEMガイドでは、既存のメタデータを渡したり、カスタムのメタデータタグを作成したりできます。 DITA-OT 公開を使用して、メタデータをAEM、PDF、HTML5、EPUBおよびカスタム形式の出力に渡すことができます。

DITA-OT 公開を使用してメタデータを出力に渡すには、次の手順を実行します。

1. 内 **Assets UI**&#x200B;に移動し、DITA-OT にメタデータを渡す DITA マップファイルをクリックします。
1. メタデータフィールドを渡す出力プリセットを選択して編集します。 例えば、「PDF出力プリセット」を選択します。
1. 選択 **DITA-OT** 生成の下 &lt;output> 選択した出力プリセットの「 」オプションを使用します。

   ![](images/custom-meta-data-output-preset.png)

1. 「プロパティ」ドロップダウンで、DITA-OT 公開に渡すメタデータを選択します。

   「プロパティ」ドロップダウンに、カスタムプロパティとデフォルトプロパティの両方が表示されます。 例えば、上のスクリーンショットの作成者は、 `dc:description`, `dc:language`, `dc:title`、および `docstate` はデフォルトのプロパティです。

   >[!NOTE]
   >
   > これらのプロパティは、次の場所にある metadataList ファイルから選択されます。`/libs/fmdita/config/metadataList`. デフォルトでは、このファイルには 4 つのプロパティがリストされています。 `dc:description`, `dc:language`, `dc:title`、および `docstate`.

   このファイルは次の場所にオーバーレイできます。 `/apps/fmdita/config/metadataList`.

   値を既に定義しているカスタムプロパティを渡すには、 [DITA-OTPDF出力でのAEMメタデータの使用](https://experienceleaguecommunities.adobe.com/t5/xml-documentation-discussions/use-aem-metadata-in-dita-ot-pdf-output/td-p/411880).

1. 次の **プロパティ** ドロップダウンで、必要なカスタムプロパティとデフォルトプロパティを選択します。 例えば、「 `author`, `dc:title`、および `dc:description`. これらは標準です `metadata/properties` ファイルを作成すると作成されます。 選択したプロパティがドロップボックスの下に表示されます。

   ![](images/selected-metadata-properties.png)

1. クリック **完了** 左上に移動して、変更を保存します。
1. 出力を生成します。

選択したメタデータプロパティは、DITA-OT を使用して生成された出力に渡されます。

**親トピック：**[&#x200B;出力の生成](generate-output.md)

