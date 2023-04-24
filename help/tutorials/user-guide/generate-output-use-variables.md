---
title: 変数を使用して、[ 宛先のパス ]、[ サイト名 ]、または [ ファイル名 ] オプションを設定します
description: 「宛先パス」、「サイト名」、「ファイル名」の各オプションを設定する変数の使用方法を説明します
source-git-commit: 8b6294425c6e60d1c5b37d98e99114014a104ee6
workflow-type: tm+mt
source-wordcount: '352'
ht-degree: 0%

---


# 変数を使用して、[ 宛先のパス ]、[ サイト名 ]、または [ ファイル名 ] オプションを設定します


AEM Site またはPDFで出力を生成する際に、変数を使用して、「Destination Path」、「AEM Site Name」、「Destination File Name」のいずれかのオプションを定義できます。 変数の 1 つまたは組み合わせを使用して、これらのオプションを定義できます。

次の表に、標準でサポートされる変数を示します。

| 変数 | 最終宛先パス | 例 |
| --- | --- | --- |
| `${map_filename}` | DITA マップファイル名を使用して、宛先のパスを作成します。 | **DITA マップファイル名**:<br>`AEMGuides.ditamap`<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${map_filename}`<br><br>**最終出力場所**:<br>`/content/output/sites/aemGuides/AEMGuides.html` |
| `${map_title}` | DITA マップタイトルを使用して、宛先パスを作成します。 | **DITA マップファイル名**:<br>`AEMGuides.ditamap`<br><br>**DITA マップのタイトル**:<br>`AEMGuides`<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${map_title}`<br><br>**最終出力場所**:<br>`/content/output/sites/AEMGuides/AEMGuides.html` |
| `${preset_name}` | 出力プリセット名を使用して、宛先のパスを作成します。 | **出力プリセット名**:<br>`AEM Guides PDF Output`<br><br>**DITA マップファイル名**:<br>`SampleDita.ditamap`<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${preset_name}`<br><br>**最終出力場所**:<br>`/content/output/sites/AEM Guides PDF Output/SampleDita.html` |
| `${language_code}` | マップファイルの場所にある言語コードを使用して、宛先のパスを作成します。 | **DITA マップファイル名**:<br>`SampleDita.ditamap`<br><br>**DITA マップファイルのパス**:<br>`/content/dam/projects/AEM-Guides/en/user-guide/`<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${language_code}`<br><br>**最終出力場所**:<br>`/content/output/sites/en/SampleDita.html` |
| `${map_parentpath}` | マップファイルの完全パスを使用して、宛先パスを作成します。<br><br>**注意**：この変数は、AEM Site Name またはPDF・ファイル名の指定には使用できません。 | **DITA マップファイル名**:<br>`SampleDita.ditamap`<br><br>**DITA マップファイルのパス**:<br>`/content/dam/projects/AEM-Guides/en/user-guide`/<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${map_parentpath}`<br><br>**最終出力場所**:<br>`/content/output/sites/content/dam/projects/AEM-Guides/en/user-guide/SampleDita.html` |
| `${path_after_langfolder}` | 言語フォルダーの後のマップファイルのパスを使用して、宛先のパスを作成します。<br><br>**注意**:この変数は、AEM Site Name またはPDFFile Name を指定するためには使用できません。 | **DITA マップファイル名**:<br>`SampleDita.ditamap`<br><br>**DITA マップファイルのパス**:<br>`/content/dam/projects/AEM-Guides/en/user-guide/`<br><br>**宛先のパス** 次のように設定：<br>`/content/output/sites/${path\_after\_langfolder}`<br><br>**最終出力場所**:<br>`/content/output/sites/user-guide/SampleDita.html` |

また、DITA マップまたはブックマップファイル用に定義されたメタデータを変数として使用することもできます。 メタデータは、 `/jcr:content/metadata` DITA マップまたはブックマップファイルのノード。 例えば、 `/jcr:content/metadata` ノードが `dc:title`. 次を指定できます。 `${dc:title}` タイトル値は最終出力で使用されます。
**親トピック：**[&#x200B;出力の生成](generate-output.md)

