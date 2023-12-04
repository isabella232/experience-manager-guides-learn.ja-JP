---
title: Web エディターのツールバーで追加の特殊文字を設定する
description: AEMガイドの Web エディターで追加の特殊文字を設定する方法について説明します。
feature: Web Editor
role: User
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '250'
ht-degree: 0%

---

# Web エディターのツールバーで追加の特殊文字を設定する方法

作成者が既に特殊文字を挿入できるように、Web エディターのツールバーにショートカットオプションがあります。
以下のスクリーンショットでも同じことがわかります。

![特殊文字](assets/special-chars.png)


これらの文字のリストはここで設定できます。 これにさらに文字を追加する必要がある場合は、次の手順に従います。

+ AEMにログインし、CRXDE Liteモードを開きます。

+ 次の場所に symbols.json ファイルを作成します： &#39;/apps/fmdita/xmleditor/&#39; ( デフォルトの場所は — &#39;/libs/fmdita/clientlibs/clientlibs/xmleditor/symbols.json&#39;からコピーできます )

+ symbols.json ファイルに次のように特殊文字定義を追加します。

```
{
      "label": "Logical Symbols",
      "items": [
        {
          "name": "≥",
          "title": "Greater-Than or Equal To"
        },
        {
          "name": "≤",
          "title": "Smaller-Than or Equal To"
        }
      ]
}
```

symbols.json ファイルの構造を次に示します。

+ &quot;label&quot;: &quot;Logical Symbols&quot;：特殊文字のカテゴリを指定します。 スニペットでは、「論理記号」という名前のカテゴリが定義されます。

+ &quot;items&quot;：カテゴリ内の特殊文字のコレクションを定義します。

+ &quot;name&quot;: &quot;≥&quot;, &quot;title&quot;: &quot;Greater-Than or Equal To&quot;：これは、特殊文字の定義です。 先頭には「名前」ラベルが付きますが、このラベルは変更しないでください。 名前の後に特殊文字が続きます。 「タイトル」は、その特殊文字のツールチップとして表示される特殊文字の名前またはタイトルです。

1 つのカテゴリ内で特殊文字の複数の定義を定義できます。

これにより、特殊文字ダイアログに別のカテゴリが追加されます。

![特殊記号カテゴリ](assets/special-char-category.png)

![特殊文字の挿入](assets/insert-special-char.png)

>[!MORELIKETHIS]
>
>+ [インストールおよび設定ガイド](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/3-6/XML-Documentation-for-Adobe-Experience-Manager_Installation-Configuration-Guide_EN.pdf)
