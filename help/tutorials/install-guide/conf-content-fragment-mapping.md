---
title: トピックとコンテンツフラグメントモデルの間の JSON ベースのマッピングを設定します。
description: トピックとコンテンツフラグメントモデルの間の JSON ベースのマッピングを設定する方法を説明します。
source-git-commit: 85b2e3a2085579c7a44e31e278ff22e22677b540
workflow-type: tm+mt
source-wordcount: '236'
ht-degree: 0%

---


# トピックとコンテンツフラグメントの間のマッピングの作成

AEMガイドは、トピックとコンテンツフラグメントモデルの間の JSON ベースのマッピングを作成する機能を提供します。 このマッピングを使用して、トピック内の一部またはすべての要素に存在するコンテンツをコンテンツフラグメントに公開できます。

1. 次の手順で *contentFragmentMapping.json*、管理者としてAdobe Experience Managerにログインします。
1. 上部の「 Adobe Experience Manager 」リンクを選択し、「 」を選択します。 **ツール**.
1. ツールのリストから「ガイド」を選択し、 **フォルダープロファイル**.
1. を選択します。 **Global Profile** タイル。
1. を選択します。 **XML エディターの設定** 」タブで「 **編集** アイコンをクリックします。
1. を選択します。 **ダウンロード** アイコンを使用して、 *contentFragmentMapping.json*  ファイルをローカルシステム上に置きます。 その後、ファイルに変更を加えてから、同じファイルをアップロードできます。

1. 次の検証に従う必要があります。

   1. JSON ファイルにする必要があります
   2. この変数には、少なくとも 1 つのオブジェクトを含む配列を含める必要があり、各オブジェクトには次の値を含める必要があります。


      `"name": string `

      `"mapping": array`

      マッピングの各オブジェクトには、次の情報が含まれている必要があります。

      `"modelField": string`

      `"xpath": string`

      `"outputType": string`
1. ファイルを保存してアップロードします。

サンプルファイル：

```
[
  {
    "mapping": [
      {
        "modelField": "title",
        "xpath": "/topic[1]/title[1]",
        "outputType": "textContent"
      },
      {
        "modelField": "shortdesc",
        "xpath": "/topic[1]/shortdesc[1]",
        "outputType": "textContent"
      },
      {
        "modelField": "topicData",
        "xpath": "/topic[1]/body[1]",
        "outputType": "outerHTML"
      }
    ],
    "name": "Full Topic"
  },
  {
    "mapping": [
      {
        "modelField": "title",
        "xpath": "/topic[1]/title[1]",
        "outputType": "textContent"
      },
      {
        "modelField": "shortdesc",
        "xpath": "/topic[1]/shortdesc[1]",
        "outputType": "textContent"
      },
      {
        "modelField": "heroImage",
        "xpath": "/topic[1]/body[1]/p[1]/image[1]",
        "outputType": "outerHTML"
      },
      {
        "modelField": "dataTable",
        "xpath": "/topic[1]/body[1]/table[1]",
        "outputType": "outerHTML"
      }
    ],
    "name": "Sample Example with XPath"
  }
]
```

デフォルトのマッピングでトピック全体を公開できます。 を選択します。 `Full Topic` マッピングを **コンテンツフラグメントとして公開** ダイアログボックスに追加され、コンテンツフラグメントモデルに「topicData」フィールドが含まれていることを確認します。