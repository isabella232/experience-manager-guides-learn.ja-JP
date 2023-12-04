---
title: テキストフィルターの設定
description: テキストフィルターの設定方法を説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '367'
ht-degree: 0%

---

# テキストフィルターの設定 {#id21BPD0FK0XA}

AEMガイドは、AEMリポジトリの選択されたパスに存在するファイル内のテキストを検索する機能を提供します。 フィルター検索を使用して、リポジトリパネルからファイルを検索したり、ファイルを参照したりできます。 Web エディターで作業を行う際は、ファイル参照ダイアログを使用して、画像、参照、キー参照などの要素を挿入する必要があります。

デフォルトでは、いくつかの拡張フィルターを使用してAEMリポジトリ内のファイルを検索できます。 選択したパスに存在するすべての DITA ファイルまたは非 DITA ファイルをフィルターできます。 また、DITA 要素の属性内の特定の値を検索することもできます。 また、指定したユーザーがチェックアウトしたファイルを探すこともできます。

>[!NOTE]
>
> また、グローバルプロファイルを設定し、検索用にさらにフィルターを追加することもできます。

次の手順を実行して、テキストフィルターを設定します。

1. 管理者としてAdobe Experience Managerにログインします。
1. をクリックします。**Adobe Experience Manager** 上部のリンクをクリックし、「 」を選択します。 **ツール**.
1. 選択 **ガイド** ツールのリストから、 **フォルダープロファイル**.
1. をクリックします。 **Global Profile** タイル。
1. クリック： **XML エディターの設定**.
1. クリック： **編集** アイコンをクリックします。
1. ui\_config.json ファイルをダウンロードします。
1. ファイルでフィルターを設定します。 また、次の例に示すように、カスタムフィルターを追加できます。

   次のコードスニペットは、DITA ファイル、非 DITA、DITA 要素およびファイルによるチェックアウトのフィルタリングオプションを追加する方法を示しています。 また、カスタムフィルターの —Tags も含まれます。

   ```json
   [
     {
       "title": "DITA files",
       "property": "jcr:content/metadata/dita_class",
       "operation": "like",
       "children": [
         {
           "title": "DITA Topics",
           "value": "- topic/topic",
           "checked": true
         },
         {
           "title": "DITA Maps",
           "value": "- map/map",
           "checked": true
         }
       ]
     },
     {
       "title": "DITA elements",
       "property": "jcr:content/ditameta",
       "widgetId": "dita_filter",
       "operation": "like"
     },
     {
       "title": "Checked out by",
       "property": "jcr:content/cq:drivelock",
       "operation": "like",
       "itemConfig": {
         "component": "textfield",
         "placeholder": "Checked out by"
       },
       "children": [
         {
           "title": "Check out"
         }
       ]
     },
     {
       "title": "Tags",
       "property": "jcr:content/metadata/cq:tags",
       "itemConfig": {
         "component": "textfield",
         "placeholder": "Enter Tag"
       },
       "children": [
         {
           "title": "Tags"
         }
       ]
     }
   ]
   ```

   上記のコードスニペットでは、最初のフィルターは DITA ファイル用です。 フィルター定義では、次のパラメーターを取ります。

   - **タイトル：** フィルターの表示名。 このタイトルは、ファイル参照ダイアログでフィルタリングオプションとして表示されます。

   - **プロパティ：** ファイルのメタデータで一致させるプロパティ。 例えば、プロパティに dita\_class メタデータを持つファイルのみを許可する場合、プロパティフィルターは値として「jcr:content/metadata/dita\_class」を取ります。

   - **操作** プロパティパラメーターで指定された値が存在するかどうかを調べるには、「exists」を指定します。

1. 追加したフィルターを含む、更新された ui\_config.json ファイルをアップロードします。

設定済みのフィルターは、フィルターパネルで使用できます。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)
