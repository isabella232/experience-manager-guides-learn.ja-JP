---
title: タグ表示のデフォルト値の設定
description: タグ表示のデフォルト値を設定する方法を説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '214'
ht-degree: 0%

---

# タグ表示のデフォルト値の設定 {#id223GN0M0NDC}

AEMガイドを使用すると、Web エディターでタグ表示のデフォルトの状態を設定できます。これは、新しいユーザーのセッションでタグ表示をデフォルトでオンまたはオフにするのに役立ちます。次の手順を実行して、タグ表示のデフォルト値を設定します。

1. 管理者としてAdobe Experience Managerにログインし、UI 設定ファイルをダウンロードします。
1. 上部の「 Adobe Experience Manager 」リンクをクリックし、「 」を選択します。 **ツール**.
1. 選択 **ガイド** ツールのリストから、 **フォルダープロファイル**.
1. をクリックします。 **Global Profile** タイル。
1. を選択します。 **XML エディターの設定** 」タブをクリックし、 **編集** アイコンをクリックします。
1. Adobe Analytics の **XML Editor UI の設定** セクションで、 **ダウンロード** アイコンを使用して、 `ui_config.json` ファイルをローカルシステム上に置きます。
1. Adobe Analytics の `ui_config.json` ファイルのデフォルトのタグ表示状態を変更するには、次に示すように「 defaultValues 」セクションを変更します。

   ```json
   "defaultValues":
                   {
                   "tagsView": true
                   }
   ```

1. ファイルを保存してアップロードします。

>[!NOTE]
>
> Web エディターでのユーザーのタグ表示の有効/無効を設定する環境設定は、このデフォルト値よりも優先されます。 したがって、ユーザーが Web エディターからタグ表示を有効にした場合、セッションをまたいでもタグ表示が有効なままになります。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)
