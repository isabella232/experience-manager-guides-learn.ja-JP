---
sidebar_position: 4
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '259'
ht-degree: 1%

---

# Jui Framework

拡張機能の記述方法に進む前に、フレームワークのアーキテクチャを理解します。
効果的に拡大できるように。

## はじめに

JUI は、React および React Spectrum コンポーネントの上にある MVCAdobeです。 JUI は JSON ユーザーインターフェイスです。 複数の Git リポジトリで構成されています。

JUI-Core は、JSON 設定を動作中の React コンポーネントに変換し、関連するコントローラークラスのインスタンスにリンクさせるすべてのロジックを備えたコアライブラリです。
JUI-React-Spectrum ライブラリには、AdobeReact Spectrum コンポーネントのラッパーウィジェットがあります。

## JUI コアデザイン

### MVC UI デザイン

![代替テキスト](./imgs/jui-mvc-flow.png)

### ウィジェット

- 一意の ID を持つ。
- 表示用の個々の JSON ファイルがある。
- 独自または共有のコントローラを持つことができます。
- 親モデルまたは新しいモデルを使用できます。
- UI 要素（React コンポーネント）を持つことができる
- 他のウィジェットを持つことができます
- アプリがウィジェット

![代替テキスト](./imgs/jui-widget.png)

### 要素

- HTML/React コンポーネントです。
- モデルがなく、親ウィジェットモデルを使用します。

### イベントハンドラー

- 次へ (eventOpts)
   - 一部のオプトでトリガーイベントを設定するには
- Subscribe(callback)
   - 設定でイベントが発生したことを通知する

### アプリ/グローバルモデル

- 次へ（新しい値）
   - 新しい値を公開するには
- Subscribe(callback)
   - 値変更の通知を取得するには
   - 初めて古い値を取得する
- GetValue()
   - 現在の値を取得するには

### コントローラ

- コントローラクラスから拡張する必要があります。
- API
- CreateModel
   - 子ウィジェットを別のモデルで作成するには
- InitEventHandler
   - 子ウィジェットを別々のイベントハンドラーで作成するには
- RegisterCommands
   - ローカルイベント、親イベントまたはアプリイベントを登録するには
- Next(eventName, eventHandler)
   - 子ウィジェットイベントハンドラーのトリガーイベント、親ウィジェットイベントハンドラー、またはアプリイベントハンドラーを設定するには
- Subscribe(callback, eventHandler)
- SubscribeAppModel(callback)

### サンプルのアプリデザイン

![代替テキスト](./imgs/jui-sample-app.png)
