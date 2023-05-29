---
title: キーの操作
description: 組織コンテンツ全体で使用するキーの作成方法
role: Admin
exl-id: b8e3a6d2-ea82-4fdb-bd16-3f4b6594af52
source-git-commit: c8feab55ed3b8e7b36ec46b21f63155766627e40
workflow-type: tm+mt
source-wordcount: '176'
ht-degree: 0%

---

# キーの作成

製品名や製品のピッチなど、多くの場所で使用されているが変更しやすい結果的で一般的なテキストが含まれる場合は、キーを使用する必要があります。 このような再利用可能なテキストにキーを使用すると、キー値などの 1 か所で変更を行うことで、複数の場所で更新をプッシュできます。

## 手順 1:キーを保存するグローバルマップを作成します

マップを作成し、 [!UICONTROL keyref] 要素を追加します。

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "technicalContent/dtd/map.dtd">
<mapid="map.ditamap_ffbdbf06-8658-4311-ad84-1c631bba904f">
  <title>global-keys-map</title>
  <keydefkeys="adobe">
    <topicmeta>
      <linktext>Adobe Systems</linktext>
    </topicmeta>
  </keydef>
  <keydefkeys="AEM">
    <topicmeta>
      <linktext>Adobe Experience Manager</linktext>
    </topicmeta>
  </keydef>
</map>
```

ここでは、上に示すように、次の 2 つの定義を定義しました。 [!UICONTROL keyref] as _AEM_ の _Adobe Experience Manager_ テキスト。

## 手順 2:このマップをパブリケーションマップに追加

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "technicalContent/dtd/map.dtd">
<mapid="map.ditamap_cbf4a96d-e382-4e8c-8830-bcc093fe6638">
  <title>sample-map</title>
  <topicrefhref="sample-topic-using-the-keys.dita"type="topic">
  </topicref>
  <maprefformat="ditamap"href="global-keys-map.ditamap"type="map">
  </mapref>
</map>
```

## 手順 3:キーを使用して、グローバルキーマップで定義された変数を参照します

+ トピックを編集し、 [!UICONTROL keyref].
+ スクリーンショットに示すように、小さなウィンドウが表示され、そこからキーワードを選択できます。 これは、「keyword」要素を追加する際に表示されます。
   ![要素を挿入](assets/insert_element.png)
   ![キー参照](assets/key_ref.png)

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "technicalContent/dtd/topic.dtd">
<topicid="topic.dita_31b00e61-04b5-4193-af7a-68503e88b087">
  <title>sample-topic-using-the-keys</title>
  <shortdesc></shortdesc>
  <body>
    <p>This is a sample topic using the keys defined in the global map</p>
    <p>here i am using the key definition for AEM :<keywordkeyref="AEM"></keyword></p>
  </body>
</topic>
```
