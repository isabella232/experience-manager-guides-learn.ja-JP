---
title: チェックインアイコンとチェックアウトアイコンのタイトルを設定する
description: チェックインアイコンとチェックアウトアイコンのタイトルを設定する方法を説明します。
source-git-commit: bb4b875864b31197437a944ded5862bbf937bc29
workflow-type: tm+mt
source-wordcount: '166'
ht-degree: 0%

---

# チェックインアイコンとチェックアウトアイコンのタイトルを設定します。

AEMガイドでは、Web エディターのチェックインアイコンとチェックアウトアイコンのタイトルを設定できます。 チェックインアイコンとチェックアウトアイコンのタイトルを設定するには、次の手順を実行します。

1. 管理者としてAdobe Experience Managerにログインし、UI 設定ファイルをダウンロードします。
1. 上部の「 Adobe Experience Manager 」リンクをクリックし、「 」を選択します。 **ツール**.
1. 選択 **ガイド** ツールのリストから、 **フォルダープロファイル**.
1. をクリックします。 **Global Profile** タイル。
1. を選択します。 **XML エディターの設定** 」タブをクリックし、 **編集** アイコンをクリックします。
1. Adobe Analytics の **XML Editor UI の設定** セクションで、 **ダウンロード** アイコンを使用して、 `ui_config.json` ファイルをローカルシステム上に置きます。
1. Adobe Analytics の `ui_config.json` ファイルを編集する場合は、「topbar」セクションでタイトルを変更します。 次の値を変更できます。

   ```json
   //Change title to "Check out" instead of "Lock"
           "title": "Check out"
   
   //Change title to "Check in" instead of "@checkOutBy
            "title": "Check in"
   ```

1. ファイルを保存してアップロードします。

