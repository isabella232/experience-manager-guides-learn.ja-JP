---
sidebar_position: 2
source-git-commit: 0f20681fa4de859053c8d2baae0e53f347ce5859
workflow-type: tm+mt
source-wordcount: '44'
ht-degree: 2%

---


# ラベル

任意のテキストや文字列を表示するには、コンポーネント、ラベルを使用します。
JUI のラベルコンポーネントは html を表します `<label/>`.

静的ラベルの追加例を以下に示します

```js title="staticLabel.js"
const staticLabelJSON =  {
    "component": "label", //tells the component name
    "label": "This is an example label", // the string to be displayed
}
```

以下の JSON に動的文字列が表示されます。

```js title="dynamicLabel.js"
const labelJSON =  {
    "component": "label", //tells the component name
    "label": "@name", // the variable storing the text to be displayed
},
```

レンダリングされたラベルは次のようになります。

![ラベル](./imgs/label.png "ラベル")