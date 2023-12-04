---
title: コンバージョンプロセスのイベントハンドラー
description: コンバージョンプロセスのイベントハンドラーについて説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '189'
ht-degree: 0%

---

# コンバージョンプロセスのイベントハンドラー {#id175UB30E05Z}

AEMガイドでは、ドキュメント変換プロセスの完了後に後処理操作を実行するために使用される com/adobe/fmdita/conversion/complete イベントが公開されています。 このイベントは、DITA 以外の文書が DITA ファイル形式に移行されるたびにトリガーされます。 例えば、Word から DITA への変換またはInDesignから DITA への変換プロセスを実行した場合、このイベントは、変換プロセスが終了した後に呼び出されます。

このイベントで使用可能なプロパティを読み取り、さらに処理をおこなうには、AEMイベントハンドラーを作成する必要があります。

イベントの詳細については、以下で説明します。

**イベント名**:

```HTTP
com/adobe/fmdita/conversion/complete 
```

**パラメーター**:\
|名前|型|説明| |—|—|—| |`status`|String|実行された操作の戻り値のステータス。 - SUCCESS：変換処理が正常に完了した。 <br> - COMPLETED WITH ERRORS：変換プロセスは完了しましたが、エラーが発生しました。 <br> — 失敗：致命的なエラーが原因で、変換プロセスが失敗しました。| |`filePath`|String|AEMリポジトリ内のソースファイル（変換する）の絶対パス。| |`outputPath`|String|変換された DITA ファイルを保存する宛先の場所の絶対パス。| |`logPath`|String|変換ログを保存するノードの絶対パス。|
