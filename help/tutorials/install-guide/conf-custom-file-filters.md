---
title: ファイル参照ダイアログのフィルターを設定する
description: ファイル参照ダイアログのフィルターを設定する方法を説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '325'
ht-degree: 0%

---

# ファイル参照ダイアログのフィルターを設定する {#id20CIL7009GN}

Web エディターで作業を行う際は、ファイル参照ダイアログを使用して、画像、参照、キー参照などの要素を挿入する必要があります。 デフォルトのファイル参照ダイアログには、ファイルのフィルタリングオプションはありません。 必要なファイルに簡単かつ迅速にアクセスできる独自のフィルターを追加できます。

次の手順を実行して、カスタムのファイルフィルタリングオプションをファイル参照ダイアログに追加します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/clientlibs/clientlibs/xmleditor/ui_config.json`

1. 次の場所にデフォルトの設定ファイルのコピーを作成します。

   `/apps/fmdita/xmleditor/ui_config.json`

1. に移動して、を開きます。 `ui_config.json` ファイルを `apps` ノードを編集します。

1. Adobe Analytics の `ui_config.json` ファイルを開き、追加するフィルターの定義を追加します。

   次のコードスニペットに、DITA ファイルと画像ファイルの 2 つのフィルタリングオプションを追加する方法を示します。

   ```json
   "browseFilters": [
       {
         "title": "DITA Files",
         "property": "jcr:content/metadata/dita_class",
         "operation": "exists"
       },
       {
         "title": "Image Files",
         "property": "jcr:content/metadata/dc:format",
         "value": [        
           "image/jpeg",
           "image/gif",
           "image/png"
         ]
       }
   ]
   ```

   上記のコードスニペットでは、最初のフィルターは DITA ファイル用です。 フィルター定義では、次のパラメーターを取ります。

   - **タイトル：**   フィルターの表示名。 このタイトルは、ファイル参照ダイアログでフィルタリングオプションとして表示されます。

   - **プロパティ：**   ファイルのメタデータで一致させるプロパティ。 例えば、 `dita_class` プロパティ内のメタデータの場合、プロパティフィルターは「`jcr:content/metadata/dita_class`」を値として使用します。

   - **操作：**   &quot;`exists`」と指定し、プロパティパラメーターで指定された値の存在を照合します。

   2 つ目のフィルターは、画像ファイル用です。 パラメーターは、 `value` パラメーター。 The `value` パラメーターは、画像タイプの配列を値として受け取ります。 値パラメータで指定されたすべてのファイルタイプが検索され、ファイル参照ダイアログに表示されます。その他のファイルタイプはすべて無視されます。

1. を保存します。 *ui\_config.json* ファイルを作成し、Web エディタを再読み込みします。

   ファイルの参照ダイアログを起動すると、ui\_config.json ファイルで設定したフィルターオプションが表示されます。

   ![](assets/file-browse-custom-filters.png){width="300" align="left"}
