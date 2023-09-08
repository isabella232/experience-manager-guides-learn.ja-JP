---
title: フォルダープロファイルを操作する Java ベースの API
description: フォルダープロファイルを操作する Java ベースの API について説明します。
source-git-commit: fad5049962f258bbe59c7d172436d82b3d6cd68f
workflow-type: tm+mt
source-wordcount: '242'
ht-degree: 0%

---


# フォルダープロファイルを操作する Java ベースの API {#id175UB30E05Z}

次の Java ベースの API を使用すると、フォルダーレベルのプロファイルに条件属性を追加できます。 この API は、バンドルの形式で使用できます。 この API を使用するには、コードにこのバンドルを含める必要があります。

バンドルの詳細：

- グループ ID : **com.adobe.fmdita**

- アーティファクト ID: **api**

- バージョン： **3.2**

- パッケージ： **com.adobe.fmdita.api.profiles**

- クラスの詳細：

  ```JAVA
  public class FolderProfileUtils extends Object
  ```

  The **`FolderProfileUtils`** クラスには、フォルダープロファイルに条件付き属性を追加するメソッドが含まれます。


## フォルダープロファイルへの条件付き属性の追加

The ``addAttributeProfiles`` メソッドは、フォルダーレベルのプロファイルに条件付き属性を追加します。

**構文**：

```JAVA
public static boolean addAttributeProfiles
(List
<String> attributeNames, 
List
    <String> values, 
List
        <String> labels,
String profileName, 
Session session) throws GuidesApiException
```

**パラメーター**: |名前|型|説明| |—|—|—| |``attributeNames``|String|属性名のリスト。| |``values``|String|指定された属性の値のリスト。| |`labels`|String|ラベルのリスト `attribute`- `value` ペア。 [1](#fntarg_1)| |`profileName`|String|これらの属性、値およびラベルを適用する必要があるフォルダーレベルのプロファイルの名前。 **重要：** プロファイルで定義されている既存の attributes-values-labels はすべて上書きされます。| |`session`|javax.jcr.Session|有効な JCR セッション。|

**戻り値**:
`true` 成功のために。 失敗した場合は、例外がスローされます。

**例外**：スロー ``java.lang.Exception`` 次のシナリオでは、

- API が `resourceResolverFactory` オブジェクト。 その場合は、バンドルを再起動する必要があります。
- API に渡されたパラメーターが無効な場合。
- API が、許可されていないユーザーセッション（特定のフォルダープロファイルの管理者でないユーザーなど）によって呼び出された場合。

[1](#fnsrc_1) The `attributeNames`, `values`、および `labels` 配列リスト内の同じインデックスが同じエントリに対応している必要があります。

