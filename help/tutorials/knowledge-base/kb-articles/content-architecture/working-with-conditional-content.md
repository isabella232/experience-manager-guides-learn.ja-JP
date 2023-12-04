---
title: 条件付きコンテンツの使用
description: 条件を作成し、条件付きコンテンツ生成を [!DNL AEM Guides]
role: User
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '199'
ht-degree: 5%

---

# 条件付きコンテンツの使用

**使用事例**


* 作成者は、コンテンツの一部に条件を設定して、出力に表示するかどうかを制御できます。

* 作成者は、公開時に様々な条件の表示/非表示を選択できます。

* 例えば、作成者は、属性をバージョン 1.0 およびバージョン 2.0 としてコンテンツに追加し、条件を使用して、バージョン 1.0 をリリース 1.0 に含め、バージョン 2.0 を除外できます。

**手順 1**

のドキュメントに関連する条件を定義します。 [!UICONTROL フォルダープロファイル]：の節を参照してください。 **グローバルまたはフォルダーレベルのプロファイルの条件属性の設定** in [インストールおよび設定ガイドの 69 ページ](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_Installation-Configuration-Guide_EN.pdf)

![フォルダープロファイルでの条件の設定](assets/conditions-in-profiles.png)

**手順 2**

を選択します。 **[!UICONTROL フォルダープロファイル]** 次の手順 1 で定義： **ユーザーの環境設定** XML Editor の場合：を参照してください。 **ユーザーの環境設定** in [ユーザーガイドの 41 ページ](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_User-Guide_EN.pdf)


**手順 3**

条件を使用してコンテンツのセクションに条件を設定する：を参照してください。 **条件** in [ユーザーガイドの 90 ページ](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_User-Guide_EN.pdf)

![Web エディターでの条件の使用](assets/conditions-in-web-editor.png)

**手順 4**

マップレベルで条件プリセットを定義して、出力で有効にする条件を選択します。を参照してください。 **条件プリセットの使用** in [ユーザーガイドの 249 ページ](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_User-Guide_EN.pdf)
