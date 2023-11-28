---
sidebar_position: 3
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '330'
ht-degree: 0%

---

# アプリのカスタマイズ

MVC（モデル、ビュー、コントローラ）構造に従うアプリ

## モデル

モデルは、様々な属性を定義し、その値を保存します。 モデルに格納された各種属性の値は、構文を使用してコントローラからアクセスできます

```typescript
this.model.attributeName
```

アプリのカスタマイズの場合、新しく作成されたすべての属性が、モデル内のマップに追加されます。
モデルに新しい属性を設定するには、コントローラで次の構文を使用します。

```typescript
this.model.extraProps.set("key", value)
```

モデルに追加された属性にアクセスするには、次の構文を使用します。

```typescript
const value = this.model.extraProps.get("key")
```

## 表示

ビューは、アプリの UI を定義します。 ここでは、JSON ファイルを使用してファイルの表示を定義します。 ここでは、コンポーネント、（コンポーネントの抽出クラスで指定された）CSS を定義し、モデルに保存されている値をレンダリングします。
アプリでは、各ビューは JSON を使用して定義されます。 JSON は、 `id`.

## コントローラ

コントローラは、イベントの処理とデータの処理に使用されます。 コントローラは、サーバからデータを取得して送信するために使用されます。これは、UI に表示され、バックエンドに保存されるデータ間のインターフェイスです。

- 初期化時に値を設定するには、 `init` 関数に置き換えます。
- メソッドをコントローラに追加するには、次の構文を使用します。

```typescript
methodName: function(args){
    // functionality
}
```

The `methodName` ここは～の役割を果たす `key` JSON（表示）または他の関数でメソッドを参照するには、以下を実行します。

- コントローラでメソッドを呼び出すには、次の構文を使用します。

```typescript
this.next('methodName', args)
```

## 例

次に、簡単な例を使用して、これら 3 つのコンポーネントが相互にどのようにやり取りするかを示します。
クリック時にラベル値を切り替えるボタンを追加します。

### 例を表示

以下では、変数名の下にモデルに保存された動的テキストを表示するボタンの JSON を定義します `buttonLabel`.
この例では、ボタンをクリックするとラベルが変わります。

```JSON
{
    "component": "button",
    "label": "@extraProps.buttonLabel",
    "variant": "cta",
    "on-click": "switchButtonLabel",
}
```

### モデルの例

この場合 `extraProps.buttonLabel` ボタンのラベルを保持します。

### コントローラの例

```typescript
  controller: {
    init: function () {
      this.model.extraProps.set("buttonLabel", "Submit")
    },

    switchButtonLabel(){
        const buttonLabel = this.model.extraProps.get("buttonLabel") === "Submit"? "Cancel" : "Submit"
        this.model.extraProps.set("buttonLabel", buttonLabel)
    }
  }
```

以下のGIFに、上記のコードの動作を示します
![basic_customization](imgs/basic_customisation.gif "基本カスタマイズボタン")
