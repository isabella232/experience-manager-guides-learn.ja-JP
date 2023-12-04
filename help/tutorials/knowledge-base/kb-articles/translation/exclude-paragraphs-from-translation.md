---
title: トピック内の段落を翻訳から除外
description: トピック内の段落を翻訳から除外する方法
feature: Translation
role: User
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '148'
ht-degree: 0%

---

# トピック内の段落を翻訳から除外する方法

最も簡単な方法は、translation=no 属性を使用することです。

+ 作成者は、追加の属性を **translation=no** を設定します。 翻訳ベンダーは情報を提供する必要があり、最終的に設定して、この属性を持つテキストを無視できます。
+ OOTB の機械翻訳 ( 体験版Microsoft翻訳コネクタを使用 ) も同じ動作をします。
+ Microsoft Translation を使用したテスト： **translate=no** 属性を段落レベルで設定した場合、完全な段落は翻訳されません。 この属性はどの要素でも定義でき、その要素内のコンテンツは翻訳されません。


これをさらに詳しく説明するスクリーンショットを次に示します。

**ソースコンテンツ**

![ソースコンテンツ](assets/source-content.jpg)

**スペイン語の翻訳済みコンテンツ**

![スペイン語の翻訳済みコンテンツ](assets/trans-content.jpg)
