---
title: Dispatcher の設定
description: Dispatcher の設定方法について説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '302'
ht-degree: 6%

---

# Dispatcher の設定 {#id213BCM0M05U}

AEMオーサーインスタンス上でAEMガイドと共に Dispatcher を使用する予定がある場合は、次の追加設定を実行して、設定を完了する必要があります。

>[!NOTE]
>
> Dispatcher は、Adobe Experience Manager のキャッシュやロードバランシングを管理するツールです。Dispatcher の使用について詳しくは、 [Dispatcher の概要](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html?lang=ja).

## URL での AllowEncodedSlashes の有効化

AEM Dispatcher の設定では、エンコードされたスラッシュを含む URL はデフォルトで有効になっていませんが、AEMガイドで作業中に、これを有効にする必要があります。 これをおこなうには、次のスニペットに示すように、Apache 設定で AllowEncodedSlashes パラメーターを On に設定する必要があります。

```XML
<VirtualHost *:80>
                ServerName www.geometrixx-outdoors.com
                **AllowEncodedSlashes On**
                <Directory />
                <IfModule disp_apache2.c>
                SetHandler dispatcher-handler
                </IfModule>
                Options FollowSymLinks
                AllowOverride None
                </Directory>
                </VirtualHost>
            
```

## DITA 用の mime.types ファイルの設定

AEMガイドと共に Dispatcher を使用する場合、作成者が（生のテキスト形式ではなく）期待どおりにコンテンツを表示できるように、DITA マップおよびトピックファイルをHTMLとしてレンダリングする必要があります。

mime.types ファイルを更新するには、次の手順を実行します。

1. SSH を使用して Dispatcher サーバーに接続し、 httpd.conf ファイルを参照します。

1. 「mime.types」ファイルのパスを確認します。

1. mime.types ファイルを開き、「text/html」を検索します。 「text/html」のデフォルトのマッピングは次のとおりです。

   `text/html html htm`

1. ditamap および dita 拡張を次のように追加して、マッピングを更新します。

   `text/html html htm ditamap dita`

1. ファイルを保存して閉じます。


この設定の更新により、Dispatcher によってレンダリングされた DITA マップおよびトピックファイルが、Assets UI でHTMLとして表示されるようになりました。

## ユーザーの環境設定のリクエスト URL を許可

AEMガイドと共に Dispatcher を使用する場合、オーサーインスタンスの前に Dispatcher がある場合は、次の 2 つの変更を行います。

- POSTリクエスト URL をホワイトリストに登録します。 サンプル&quot; `/filters`「 」ルールは以下のとおりです — このルールを Dispatcher 設定ファイルに追加します。

```json
/xxxx {/type "allow" /method "POST" /url "/home/users/*/preferences"}
```

- URL パターン「/libs/cq/security/userinfo.json」がオーサー Dispatcher 上でキャッシュされていないことを確認します。そのため、author\_dispatcher.any にルール（以下のように）を追加します。

```json
/xxxx {
                /glob "/libs/cq/security/userinfo.json"
                /type "deny"
                }
```

**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)
