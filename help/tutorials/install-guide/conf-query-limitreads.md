---
title: クエリの LimitReads 数の設定
description: クエリの LimitReads 数の設定方法を説明します
source-git-commit: 801c306fa120e7889d4b9428fd5bee2849bf1956
workflow-type: tm+mt
source-wordcount: '99'
ht-degree: 2%

---


# クエリの LimitReads 数の設定 {#id231RC0HL0ID}

クエリが一度に読み取るノード数を増やすには、次の手順を実行します。

1. Adobe Experience Manager Web コンソールの JMX ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/jmx
   ```

1. を検索してクリックします。 **QueryEngineSettings**.

1. の属性値を変更 **LimitReads** 属性。

1. 「**保存**」をクリックします。


この属性値を増やすと、大きな DITA マップ用のレポートを生成できます。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

