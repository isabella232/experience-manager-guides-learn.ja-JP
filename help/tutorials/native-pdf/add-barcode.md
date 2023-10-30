---
title: ネイティブPDF公開機能 |バーコードを追加
description: バーコードの追加方法を説明します。
source-git-commit: 31225583f45337b209f325174176b9a4199db648
workflow-type: tm+mt
source-wordcount: '294'
ht-degree: 2%

---

# バーコード出力へのPDFの追加

バーコードは、機械で簡単に処理できる情報を含める場合に役立ちます。 同様に、読者がモバイルデバイスで開くことのできるリンクにも QR コードが使用されます。

このチュートリアルでは、PDF出力の各ページの上にバーコードを追加します。

## バーコードを生成する手順

バーコードを生成するには、次の手順を実行します。

### DITA マップへのリソース ID の追加

DITA マップにリソース ID 要素を追加します。 リソース ID は、バーコードを生成するためのメイン入力として機能します。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "technicalContent/dtd/map.dtd">
<map id="GUID-3c330691-4dac-4020-904a-d2d6246aeeb1-en">
  <title>Barcode Sample</title>
  <topicmeta>
    <resourceid id="7a5bda1c-b1db-4fd8-8763-a731e2e8abba">
    </resourceid>
  </topicmeta>
  <topicref href="GUID-139f6c64-bea3-4f17-8b22-ee131557e249-en.dita" type="topic">
  </topicref>
</map>  
```

オーサリングモードでリソース ID を編集することもできます。

<img src="./assets/barcode-map.png" alt="バーコードを含むサンプル出力" width="700" border="2px solid blue">


### テンプレートヘッダーにバーコードプレースホルダーを追加する

を変更します。 `Common.plt` ファイルを **基本** テンプレートを使用して、プロジェクトタイトルの後にバーコードを追加します。

```html
...
  <div data-region="header">
    <p class="chapter-header"><span data-field="project-title" data-format="default">Project Title</span> </p>
    <p><span class="barcode" data-field="metadata" data-format="default" data-subtype="//resourceid/@id">Resource ID (barcode)</span></p>
  </div>
} 
...
```


### バーコード値をレンダリングするためにテンプレートの CSS を更新する

を変更します。 `content.css` バーコードの生成中にバーコードをレンダリングするPDFファイル。 「qrcode」や「pdf417」など、様々なバーコードタイプがサポートされています。  詳しくは、 [バーコードタイプ](#barcode-types).



```css
...
.barcode {
  -ro-replacedelement: barcode;
  -ro-barcode-type: code128;
}
...
```

上記の手順を実行した後、バーコード付きのPDF出力を生成できます。

次のスクリーンショットは、サンプルバーコードをPDF出力に表示したものです。

<img src="./assets/barcode-output-sample.png" alt="バーコードを含むサンプル出力" width="700">


## バーコードタイプ {#barcode-types}

| タイプ | CSS 属性 | 追加の属性 |
| ------------------------------- | ----------------------- | -------------------------- |
| QR コード | qrcode |                            |
| PDF417 | pdf417 |                            |
| DataMatrix | data-matrix |                            |
| Aztec コード | aztec-code |                            |
| グリッドマトリックス | grid-matrix |                            |
| Maxicode | maxicode mode-4 |                            |
| マイクロ QR | microqr |                            |
| コード 1 | code-one |                            |
| Codablock F | codablockf |                            |
| GS1 データバー制限 | データバー制限の |                            |
| GS1 データバーの全方向 | データベース全方向 |                            |
| EAN-13 | ean-13 |                            |
| GS1-128 (EAN-128) | code128 | -ro-barcode-encoding: gs1; |
| ITF-14 | itf14 |                            |
| UPC-A | upc-a |                            |
| コード 128 | code128 |                            |
| インターリーブ 2/5 | code2of5 interleaved |                            |
| POSTNET | postnet |                            |
| Datch Post Kixcode | kixcode |                            |
| Korea Post | 朝鮮ポスト |                            |
| Deutsche Post Litcode | dp-leitcode |                            |
| オーストラリアの投稿 | auspost |                            |
| ログマーズ | logmars |                            |
| 薬所 | 薬局 |                            |
| USPS OneCode （インテリジェントメール） | usps-onecode |                            |


