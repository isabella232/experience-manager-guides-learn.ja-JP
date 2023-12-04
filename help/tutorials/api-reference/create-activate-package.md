---
title: パッケージを作成およびアクティベートするための REST API
description: パッケージを作成およびアクティベートするための REST API について説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '117'
ht-degree: 0%

---

# パッケージを作成およびアクティベートするための REST API {#id198CF0260Y4}

次の REST API を使用して、CRX パッケージを作成し、アクティベートできます。

## パッケージの作成とアクティベート

CRX パッケージをPOSTし、アクティベートするアクティベートメソッド。

**リクエスト URL**: http://*&lt;aem-guides-server>*: *&lt;port-number>*/bin/fmdita/activate

**パラメーター**：リクエストクエリは、JSON ルール文字列で構成されます。 POSTリクエストのコンテンツタイプをに設定する必要があります `application/json; charset=UTF-8`.

**例**：次の例は、curl コマンドを使用した API 呼び出しを示しています。

    &quot;&#39;
    curl -u &lt;*username*>:&lt;*password*> -H &quot;Content-Type: application/json; charset=UTF-8&quot; -k -XPOST-d &quot;{[JSON ルール文字列 ](create-activate-package-java.md#example-create-activate-package-id198JH0B905Z)}&quot; http://&lt;*aem-server-guides-ges*>:&lt;*port-number*>/bin/fmdita/activate
    &quot;&#39;
