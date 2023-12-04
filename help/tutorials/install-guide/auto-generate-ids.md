---
title: 要素 ID を自動生成
description: 要素 ID を自動生成する方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '337'
ht-degree: 0%

---

# 要素 ID を自動生成 {#id20CIL40016I}

AEMガイドは、作成する新しいドキュメントのドキュメント ID を生成します。 例えば、DITA マップを作成する際に、 `map.ditamap_random_digits` はマップの ID に割り当てられます。 また、ID が自動的に生成され、割り当てられる要素を定義することもできます。

AEMガイドでは簡単な設定を提供します。この設定では、ID が自動生成される要素と、ID のパターンを定義する必要があります。 デフォルトでは、 `section`, `table`, `ul`, `ol`に設定され、ID を自動生成するために使用されます。 このリストに他の要素を追加して、ドキュメントにこれらの要素が挿入されるたびに、AEMガイドは指定されたパターンに基づいて ID を生成し割り当てることができます

自動生成された ID を持つ要素を設定するには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.xmleditor.config.XmlEditorConfig** バンドル。

1. Adobe Analytics の *XmlEditorConfig* 設定では、 **要素タグの ID を自動生成** フィールドに入力します。

   >[!NOTE]
   >
   > 要素タグは、次のような DITA 要素名です。 `body`, `title`, `codeblock`など。 複数の要素を指定する場合は、要素名をコンマで区切ります。

1. Adobe Analytics の&#x200B;**ID 生成のパターン** 「 」フィールドで、ID を生成するパターンを指定します。

   このフィールドのデフォルト値はに設定されています。 `${elementName}_${id}`. The `${elementName}` の値は、要素の名前に置き換えられます。 The `${id}` 変数は、要素の連続した番号を生成します。 例えば、自動生成された ID を持つ段落要素を割り当てた場合、トピックまたはドキュメントの最初の段落には p\_1 のような ID が、次の段落には p\_2 のような ID が付けられます。 ただし、別のドキュメントでは、ID 生成プロセスが再起動します。 つまり、別のドキュメントでは、p\_1 や p\_2 などの ID を段落要素に割り当てることができます。

   ドキュメントに指定したパターンに ID が既に含まれている場合、自動生成プロセスはそれらの ID を新しい要素に割り当てません。

1. 「**保存**」をクリックします。


**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)
