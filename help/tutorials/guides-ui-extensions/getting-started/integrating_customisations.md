---
sidebar_position: 2
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '338'
ht-degree: 2%

---


# AEM Guides 拡張機能パッケージのインストールと使用

拡張機能を使用すると、AEMガイドアプリをニーズに合わせてカスタマイズできます。 この拡張機能フレームワークは、AEMガイド v4.3（オンプレミス）および 2310（クラウド）でサポートされます。

## 要件

このパッケージにはが必要です [git bash](https://github.com/git-guides/install-git) および npm

## インストール

AEM Guides フレームワークのインストールをブートストラップする最も簡単な方法は、cli を使用することです

```bash
npx @adobe/create-guides-extension
```

## カスタマイズコードの追加

1. で拡張する各コンポーネントのコードファイルを追加します。 `src/` ディレクトリ。 一部のサンプルファイルは既に追加されています。
2. 現在は、 `index.ts` 次の場所にあるファイル： `src/` ディレクトリ：
   - 次をインポート： `.ts` ファイルを作成し、ビルドに追加するカスタマイズを含めます。
   - インポートの追加先 `window.extension`
   - カスタマイズされたコンポーネントの登録 `id` 対応するインポート `tcx extensions`
   - サンプルを参照してください。 [index.ts](../../../src/index.ts)

## カスタマイズされたコードの構築

- 実行 `npm run build` をルートディレクトリに追加します。 ディレクトリに 3 つのファイルが格納されます。 `dist/`:
   - `build.css`
   - `guides-extension.js`
   - `guides-extension.umd.cjs`

![ビルド出力](./../imgs/build_output.png)

## カスタマイズのAEMへの追加

- `CRXDE` に移動します。`crx/de/index.jsp#/`
- の下 `apps` フォルダー、タイプの新しいノードを作成 `cq:ClientLibraryFolder`

![フォルダー構造](./../imgs/crxde_folder_structure.png)

- Adobe Analytics の `properties` ノードで、「 」を選択します。 `Multi` 次のプロパティ名を追加します。 `categories`
タイプ： `String []`
値： `apps.fmdita.review_overrides`, `apps.fmdita.xml_editor.page_overrides`

![フォルダーのプロパティ](./../imgs/crxde_folder_properties.png)

- ビルド js を追加するには、新しいファイルを作成します。例えば、 `tcx1.js` 上記の作成済みノード内。 ここで、 `dist/guides-extension.umd.cjs` または `dist/guides-extension.js`. 新しいファイルを作成します `js.txt`で、js ファイルの名前を追加します。この場合、次のようになります。

```t
#base=.
tcx1.js
```

- ビルド CSS を追加するには、次のように新しいファイルを作成します。 `tcx1.css` 上記の作成済みノード内。 ここで、 `dist/build.css`. 新しいファイルを作成します `css.txt`ここで、css ファイルの名前を追加します。この場合、次のようになります。

```t
#base=.
tcx1.css
```

- 以下を実行します。 `shift + refresh` を追加しました。

## トラブルシューティング

上記の手順がすべて正しく実行されたことを確認します。
tcx.js にコードを追加した後、必ずハードリフレッシュ（Shift+リフレッシュ）を行ってください。
AEMを開き、右クリックして「 」をクリックします。 `Inspect`
ソースに移動し、 `[node_name].js` （例： extensions.js）ファイル。 Ctrl/Cmd+D キーを押して、ファイルを検索します。 次の場合、 `.js` ファイルは、貼り付けた JS コードを含む `dist/guides-extension.umd.cjs` または `dist/guides-extension.js`、設定が完了している
