---
title: 設定の上書き
description: 設定の上書きの方法を説明します
source-git-commit: 6051181e243cf71919901093c1b5590f21832545
workflow-type: tm+mt
source-wordcount: '92'
ht-degree: 0%

---


# 設定の上書き {#id216IFC003XA}

設定を更新する場合は、次の一般的な方法を使用する必要があります。

1. Cloud Manager の Git リポジトリにアクセスします。

1. 次の場所に新しい JSON ファイルを作成します。

   src/main/content/jcr\_root/apps/fmditaCustom/config/

1. ファイルに次の形式で名前を付けます。

   $\{PID\}.cfg.json

   ここでは、PID は設定のプロセス ID です。

1. 次の形式を使用して、JSON ファイルにプロパティを追加します。

   ```
   {
      "aem.adminuname": "updatedUserjson",
      "valid.characters": "[-a-zA-Z0-9_@$]",
      "dita.serialization": true
   }
   ```

1. 変更をコミットし、Cloud Manager パイプラインを実行して、更新された設定をデプロイします。


**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)

