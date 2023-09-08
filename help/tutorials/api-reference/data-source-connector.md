---
title: データソースコネクタを登録する REST API
description: データソースコネクタを登録する REST API について説明します。
source-git-commit: 8707acf3ba01b7488eea6597c434da73a901d037
workflow-type: tm+mt
source-wordcount: '81'
ht-degree: 3%

---


# データソースコネクタを登録する REST API {#id236LG0Y0CXA}

次の REST API を使用して、データソースコネクタを登録できます。

## データソースコネクタの登録

GETソースコネクタを登録するデータメソッド。

**リクエスト URL**:
`http://server:port/bin/guides/v1/konnect/config/register?path=<uploaded file path>`

**パラメーター**: |名前|型|必須|説明| |—|—|—|—| |`path`|String|Yes|AEMリポジトリ内のパスを指す文字列。 パスは、 `/content/dam or /var/dxml`.|

**例**:\
`http://host:4502/bin/guides/v1/konnect/config/register?path=/var/dxml/konnect/jira.json`

