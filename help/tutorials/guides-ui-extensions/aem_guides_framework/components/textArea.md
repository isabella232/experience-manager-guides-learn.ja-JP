---
sidebar_position: 3
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '62'
ht-degree: 0%

---


# テキストフィールドとテキスト領域

テキストを入力として使用するには、コンポーネント、テキストフィールドおよびテキスト領域を使用します。
JUI のテキスト領域コンポーネントは、html を表します。 `<textarea/>`.

```js title="textArea.js"
const textAreaJSON =  {
    "component": "textarea", //tells the component name
    "id": "input_name", // can be used to give a unique identifier to a component
    "data": "@name", // the variable storing the inputted text
    "on-keyup": {
        "name": "submitName",
        "eventArgs": {
            "keys": [
            "ENTER"
            ]
        }
    },
},
```

ここで `on-keyup` は、コントローラ内のコマンドを呼び出すための構文です。
これにより、 textArea が生成され、 Enter キーを押すとイベントが呼び出されます `submitName`

レンダリングされたテキスト領域は次のようになります。

![text-area](./imgs/text_area.png "テキスト領域")
