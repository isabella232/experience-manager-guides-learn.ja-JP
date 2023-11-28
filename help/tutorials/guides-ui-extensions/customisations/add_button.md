---
sidebar_position: 1
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '282'
ht-degree: 0%

---


# シンプルなカスタマイズの例

次に、AEM Guides アプリでこれらのカスタマイズを統合する方法を見てみましょう。

例えば、このボタンをアプリの既存のビューに追加したいとします。
そのためには、次の 3 つの基本的な要素が必要です。

1. The `id` を参照してください。
2. The `target`（新しいコンポーネントを追加する JSON 内の場所）。 The `target` が `key` および `value`. キーと値のペアは、コンポーネントを一意に識別するのに役立つ、コンポーネントの定義に使用される任意の属性にすることができます。
また、インデックスを使用してターゲットを参照することもできます。
次の 3 つの viewStates があります。  `APPEND`, `PREPEND`, `REPLACE`.
3. 新しく作成されたコンポーネントの JSON と対応するメソッド。

例えば、レビューで使用する注釈ツールボックスに、AEMでファイルを開くボタンを追加するとします。

```typescript
export default {
  id: 'annotation_toolbox', 
  view: {
    items: [
      {
        component: 'button',
        icon: 'linkOut',
        title: 'Open topic in Assets view',
        'on-click': 'openTopicInAEM',
        target: {
          key: 'value',
          value: 'addcomment',
          viewState: VIEW_STATE.APPEND

        },
      },
    ],
  },
  controller: {
    openTopicInAEM: function (args) {
        const topicIndex = tcx.model.getValue(tcx.model.KEYS.REVIEW_CURR_TOPIC)
        const {allTopics = {}} = tcx.model.getValue(tcx.model.KEYS.REVIEW_DATA) || {}
        tcx.appGet('util').openInAEM(allTopics[topicIndex])
    },
  },
}
```

上記の例では、次のようになります。

1. の `id` コンポーネントを挿入する JSON の例を次に示します。 `annotation_toolbox`
2. ターゲットは `addcomment` 」ボタンをクリックします。 ボタンを `addcomment` viewState を使用したボタン `append`.
3. コントローラー内のボタンのオンクリックイベントを定義します。

の JSON [`annotation_toolbox`](./../../../jsons/review_app/annotation_toolbox.json)

カスタマイズ前の注釈ツールボックスは次のようになりました。

![annotation-toolbox](imgs/annotation_toolbox.png "注釈ツールボックス")

カスタマイズ後、注釈ツールボックスは次のように表示されます。

![customized-annotation-toolbox](imgs/customised_annotation_toolbox.png "カスタマイズされた注釈ツールボックス")

## CSS の追加

一貫性を保つために、既にスタイル設定されたコンポーネントを提供します。 挿入された JSON には、固有のスタイルが適用されます。CSS を管理する主な方法は、拡張機能の extraClass キーを使用することです。

```js
{    
    "view":{
        items:[
            {
                compoenent:"button",
                extraClass:"underline bg-red",
            }
        ]
    }
}
```

CSS ファイルを [clientlibs](#clientlibs). ビルド時に、 [Tailwind](https://tailwindcss.com/docs/utility-first) tailwind のユーティリティクラスの出力。 同じの設定は、次の場所にあります。 [tailwind.config.js](../../../tailwind.config.js)
