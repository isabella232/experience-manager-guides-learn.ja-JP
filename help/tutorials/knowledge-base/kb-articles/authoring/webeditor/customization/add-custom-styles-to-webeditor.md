---
title: Guides Webeditor にカスタムスタイルを追加する
description: カスタムスタイルを追加して、ガイドウェブエディターの外観と操作性を変更する方法を説明します。
source-git-commit: 9e7d5bb4c8f6c6ebe21bfcebdd7d2e13971b8df2
workflow-type: tm+mt
source-wordcount: '282'
ht-degree: 0%

---

# Guides Webeditor にカスタムスタイルを追加する

この記事では、カスタムスタイルを追加して、Webeditor のデフォルトの外観と操作性を変更する方法について説明します。

これには次の手順が含まれます。
- フォルダープロファイル XML エディター設定を使用したカスタムスタイルの追加
- WebEditor での各フォルダープロファイルの選択と変更のテスト


## 例を見て実装する

短い説明とタイトルを別々のブロックとして、エディターのスタイルの側面を使用して表示する例を使用して、これを理解してみましょう。

![カスタムスタイルを使用した WebDetior のプレビュー](../../../assets/authoring/webeditor-customstyles-preview.png)


## 実装


### フォルダープロファイルへのカスタム CSS の追加

フォルダープロファイルを使用して、 *css_layout.css* 「XML エディター設定」タブで、カスタムスタイルを持つ CSS を追加します。

[このリンクを使用して、フォルダープロファイルと CSS テンプレートレイアウトの設定について詳しく知る](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/videos/advanced-user-guide/editor-configuration.html?lang=en#customize-the-css-template-layout)

以下を使用して、上記のスタイルをウェブエディターで設定します。
- 用途 [css_layout.css](../../../assets/authoring/webeditor-customstyles-css_layout.css) 選択したフォルダープロファイルにアップロードします。
- 添付のパッケージをインストールします。 [webeditor-styles-resources.zip](../../../assets/authoring/webeditor-styles-resources.zip) AEMパッケージマネージャーを使用した上記の CSS ファイルで使用するリソースのインストール

```
This will install the resources at path "/content/dam/resources" which will include sub-folders "fonts" and "images"
```


### テスト

- Web-editor を開く
- ユーザーの環境設定から、カスタムスタイルを追加したフォルダープロファイルを選択します。 グローバルプロファイルに追加した場合は、既に使用されている可能性があります。
- トピックを開くと、編集領域にカスタム UI が必要になります

```
Please note this is compatible to AEM Guides version 4.2 and AEM Guides cloud version 2303 (March)
```


## 参照

また、Webeditor の設定やカスタマイズに関するエキスパートセッション ( [ウェブディターに関するエキスパートセッション](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/knowledge-base/expert-session/webbased-authoring-jan2023.html?lang=en)