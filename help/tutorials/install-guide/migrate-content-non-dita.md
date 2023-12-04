---
title: DITA 以外のコンテンツの移行
description: DITA 以外のコンテンツを移行する方法を説明します
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '2761'
ht-degree: 0%

---

# DITA 以外のコンテンツの移行 {#id181AH0R02HT}

この節では、DITA 以外の文書を DITA 形式に移行する移行プロセスについて説明します。 AEMガイドでは、次のソースからの移行について説明しています。

- [Microsoft Word](#id1949B040Z5Z)

- [InDesign文書](#id195AD0B0K5Z)

- [XHTML](#id1949B04L0Y4)

- [非構造化FrameMaker文書](#id1949B050VUI)

- [その他の構造化ドキュメント](#id1949B0590YK)


## Microsoft Word ドキュメントの移行 {#id1949B040Z5Z}

AEMガイドを使用すると、既存の Word ドキュメントを移行できます\(`.docx`\) を DITA トピックタイプのドキュメントに追加しました。 入力および出力フォルダーの場所を他のパラメーターと共に指定する必要があり、ドキュメントが DITA 文書に変換されます。 内容に応じて、.dita ファイルと.ditamap ファイルが存在する場合があります。

Word 文書を正しく変換するには、文書の構造が正しく設定されている必要があります。 例えば、ドキュメントには「タイトル」、「見出し 1」、「見出し 2」などが続きます。 各見出しには、内容が含まれている必要があります。 文書の構造が適切でない場合は、プロセスが期待どおりに動作しない可能性があります。

デフォルトでは、AEMガイドは [Word-to-DITA \(Word2DITA\) 変換フレームワーク](http://www.dita4publishers.org/docs/repo/org.dita4publishers.word2dita/word2dita/word2dita-intro.html). この変換は、 [style-to-tag マッピング](http://www.dita4publishers.org/docs/repo/org.dita4publishers.word2dita/word2dita/style-to-tag-map-overview.html) 設定ファイル。 Word2DITA 変換を正しく使用できるようにするには、Word 文書を変換用に準備する際に、次のガイドラインを考慮する必要があります。

>[!NOTE]
>
> デフォルトのスタイルとタグのマッピング設定ファイルに変更を加えた場合は、更新後のスタイルマッピングに対して確認ガイドラインを更新して使用する必要があります。

- 文書がタイトルで始まっていることを確認します。このタイトルは DITA マップのタイトルにマッピングされます。 また、「タイトル」の後には、一部の通常のコンテンツが続く必要があります。

- 「タイトル」の後には、「見出し 1」、「見出し 2」などが表示されます。 各見出しには、コンテンツが含まれている必要があります。 見出しは、新しい概念タイプのトピックに変換されます。 生成されるトピックの階層は、ドキュメント内の見出しレベルに従っています。例えば、見出し 1 は見出し 2 の前、見出し 2 は見出し 3 のコンテンツの前に配置されます。

- ドキュメントには少なくとも 1 つの見出しタイプのコンテンツが必要です。

- グループ化された画像がないことを確認します。 ドキュメント内の画像をグループ化した場合は、そのような画像のグループ化をすべて解除します。

- すべてのヘッダーとフッターを削除します。

- 太字、斜体、下線などのインラインスタイルは、 `b`, `i`、および `u` 要素。

- 並べ替え済みリストと並べ替えられていないリストは、 `ol` および `ul` 要素。 これは、入れ子になったリスト、テーブル内のリスト、メモ、または脚注にも当てはまります。

- すべてのハイパーリンクは `xref`.

- 変換後のファイルのファイル名は、見出しテキストに続くファイル番号に基づきます。 ファイル番号は、ドキュメント内の見出しテキストの位置に基づく順番です。 例えば、見出しテキストが「Sample Heading」で、ドキュメント内で 10 番目の見出しである場合、このトピックの結果のファイル名は Sample\_Heading\_10.dita に似ています。


既存の Word 文書を DITA トピックタイプの文書に変換するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/config/w2d_io.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/w2d_io.xml`

   The `w2d_io.xml` ファイルには、次の設定可能なパラメーターが含まれています。

   - Adobe Analytics の `inputDir` 要素を指定する場合は、ソース Word ドキュメントを使用できる入力フォルダーの場所を指定します。 例えば、Word ドキュメントが `wordtodita` in `projects` フォルダーを開き、場所を次のように指定します。 `/content/dam/projects/wordtodita/`

   - Adobe Analytics の`outputDir` 要素を指定する場合は、出力フォルダーの場所を指定するか、デフォルトの出力場所をそのまま使用して変換後の DITA 文書を保存します。 指定した出力フォルダーが DAM 上に存在しない場合は、変換ワークフローによって出力フォルダーが作成されます。

   - の `createRev` 要素を使用する場合は、変換後の DITA トピックの新しいバージョンを作成するかどうかを指定します\(`true`\) または\(`false`\) です。

   - Adobe Analytics の `s2tMap` 要素を指定します。Word 文書スタイルの DITA 要素へのマッピングを含むマップファイルの場所を指定します。 デフォルトのマッピングは、次の場所にあるファイルに保存されます。

     ```XML
     /libs/fmdita/word2dita/word-builtin-styles-style2tagmap.xml
     ```

     >[!NOTE]
     >
     > の構造に関する詳細 `word-builtin-styles-style2tagmap.xml` ファイルとそのカスタマイズ方法については、 [スタイルとタグのマッピング](http://www.dita4publishers.org/docs/repo/org.dita4publishers.word2dita/word2dita/style-to-tag-map-overview.html) in *DITA For Publishers ユーザーガイド*.

   - props2Propagate 要素で、DITA マップに渡すプロパティを指定します。 このプロパティは、dc:title,dc:subject,dam:keywords,dam:category などのデフォルトのメタデータをドキュメントメタデータから変換後の DITA アセットに渡すために必要です。

1. `w2d_io.xml` ファイルを保存します。

1. 必要なパラメーターを `w2d_io.xml` ファイルにログインし、AEM UI を開きます。

1. 入力フォルダーの場所\(`wordtodita`\) です。

1. ソース Word ドキュメントをこのフォルダにアップロードします。 DAM でのコンテンツのアップロードについて詳しくは、 [既存の DITA コンテンツのアップロード](migrate-content-upload-existing-dita-content.md#).


の使用 `config` `/config` ブロックを使用すると、変換する設定のブロックを 1 つ以上定義できます。 変換ワークフローが実行され、DITA トピックの形式での最終出力が `outputDir` 要素を選択します。

## Adobe InDesignドキュメントの移行 {#id195AD0B0K5Z}

AEMガイドを使用すると、InDesignドキュメントを変換できます。 FrameMakerと同様に、InDesignでも、非構造化ドキュメントや構造化ドキュメントを作成できます。 非構造化ドキュメントでは、段落スタイルと文字スタイルを使用してコンテンツの書式を設定します。 構造化ドキュメントでは、要素とそれに対応する属性を使用します。

変換プロセスでは、段落スタイル形式と文字スタイル形式を関連する DITA 要素にマッピングする必要があります。 同様に、構造化文書の場合、マッピングファイルには、DITA 要素および属性を持つInDesign要素および属性の 1 対 1 のマッピングが含まれます。

変換プロセスでは、バックエンドで次のアクションが実行されます。

- The *InDesignマークアップ言語* \(IDML\) ファイルは作業ディレクトリに展開されています。
- designmap.xml ファイルが読み込まれ、個々のストーリーを検索するInDesignが表示されます。
- すべてのストーリーが 1 つの XML インスタンスに結合され、「空の」ストーリーは破棄されます。
- 埋め込まれたすべてのグラフィックが書き出されます。
- 表やグラフィックなどの標準構造を DITA 形式に事前に変換する。
- マッピングファイルに基づく最終出力へのスタイルまたは構造のマッピング。
- 個々の DITA トピックおよび DITA マップファイルの作成と検証。
- 一時ファイルの削除。

幅広く、変換プロセスでは次のことが必要になります。 [変換用のInDesignファイルを準備する](appendix.md#id195DBF0045Z) および [DITA への移行のInDesign用のマッピングファイルの準備](appendix.md#id194AF0003HT) 次に、変換プロセスを実行する上で、上記の手順に従う必要があります。

既存のトピック文書を DITAInDesignタイプの文書に変換するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/config/idml2dita_io.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/idml2dita_io.xml`

   次のパラメーターを `idml2dita_io.xml` ファイル：

   - Adobe Analytics の `inputDir` 要素：ソースフォルダードキュメントを使用できる入力InDesignーの場所を指定します。 例えば、InDesignドキュメントが `indesigntodita` in `projects` フォルダーを開き、場所を次のように指定します。 `/content/dam/idmlfiles/indesigntodita/`

   - Adobe Analytics の`outputDir` 要素を指定する場合は、出力フォルダーの場所を指定するか、デフォルトの出力場所をそのまま使用して変換後の DITA 文書を保存します。 指定した出力フォルダーが DAM 上に存在しない場合は、変換ワークフローによって出力フォルダーが作成されます。

   - Adobe Analytics の `mapStyle` 要素：DITA 要素へのInDesign文書スタイルのマッピングを含むマップファイルの場所を指定します。 デフォルトのマッピングは、次の場所にあるファイルに保存されます。

     ```XML
     /stmap.adobeidml.xml
     ```

     >[!NOTE]
     >
     > の構造に関する詳細 `stmap.adobeidml.xml` ファイルとそのカスタマイズ方法については、 [DITA への移行のInDesign用のマッピングファイルの準備](appendix.md#id194AF0003HT) のセクション *付録*.

1. `idml2dita_io.xml` ファイルを保存します。

1. 必要なパラメーターを `idml2dita_io.xml` ファイルにログインし、AEM UI を開きます。

1. 入力フォルダーの場所\(`indesigntodita`\) です。

1. このフォルダーにソースInDesignドキュメントをアップロードします。 DAM でのコンテンツのアップロードについて詳しくは、 [既存の DITA コンテンツのアップロード](migrate-content-upload-existing-dita-content.md#).


## XHTML ドキュメントの移行 {#id1949B04L0Y4}

AEMガイドを使用すると、既存の XHTML 文書を DITA トピックタイプの文書に変換できます。 入力フォルダーと出力フォルダーの場所を他のパラメーターと共に指定し、ドキュメントを DITA 形式に変換する必要があります。 構造化HTML文書の変換に使用できる方法は 2 つあります。

- すべてのドキュメントを入力フォルダーにアップロードするか、
- メディアファイルと共にすべてのドキュメントの ZIP を作成し、入力フォルダーにアップロードします。 この方法は、通常、相互にリンクされ、目次\(index.html\) が存在するHTMLファイルのセットに使用されます。 index.html ファイルには、セット内のすべてのHTMLファイルへのリンクが含まれます。

すべてのファイルを個別にアップロードするか、ZIP にバンドルするかに関わらず、HTMLプロセスは変換ファイルと結果の DITA ファイルとの間に 1 対 1 のマッピングを作成します。 つまり、入力フォルダー内の各.html ファイルに対して.dita ファイルが作成されます。

ZIP ファイルでドキュメントをアップロードする際には、次の点を考慮する必要があります。

- 参照されるすべてのトピックは、ZIP ファイル内に配置する必要があります。

- 参照されるすべてのメディアファイルは、相対リンクを使用してトピックファイル内で参照する必要があります。

- index.html ファイルを作成し、目次に追加するトピックへのリンクを追加します。 この index.html ファイルは、DITA マップファイルの作成に使用されます。 index.html ファイルでは、次のコード例に示すように、ネストされたトピックリストを作成することもできます。

  ```XML
  <?xml version="1.0" encoding="UTF-8"?>
  <html
  xmlns="http://www.w3.org/1999/xhtml">
      <head>
          <title>Sample Index File</title>
      </head>
      <body>
          <h1>Sample Index</h1>
          <div class="content">
              <ul class="book">
                  <li class="topicref">
                      <a href="Topic1.html">Topic 1</a>
                      <ul class="book">
                          <li class="topicref">
                              <a href="Topic1-1.html">Topic 1.1</a>
                          </li>
                          <li class="topicref">
                              <a href="Topic1-2.html">Topic 1.2</a>
                          </li>
                      </ul>
                  </li>
                  <li class="topicref">
                      <a href="Topic2.html">Topic 2</a>
                  </li>
              </ul>
          </div>
      </body>
  </html>
  ```

  なお、 `ul` タグには `class` 属性を `book`. 同様に、 `li` タグの `class` は、次のように設定する必要があります `topicref`.

- インラインスタイルを使用する場合は、インラインスタイルを XHTML ファイル内の CSS ベースのスタイルクラスに変換します。 次に、スタイル属性マッピングを使用して、これらのクラスベースのスタイルを DITA に変換します `outputclass` 属性を設定します。

  これらの DITA ファイルからHTMLまたはAEM Site 出力を生成する際に、 `outputclass` 属性を使用して、生成されたHTMLまたはAEM Site に style クラスを適用し、ソースHTMLのコンテンツに合わせることができます。


ZIP ファイルの作成に関する考慮事項以外に、XHTML ドキュメントの構造も適切に設定する必要があります。 例えば、ドキュメントに *タイトル*&#x200B;に続いて *見出し 1*, *見出し 2*&#x200B;など。 各見出しには、内容が含まれている必要があります。 文書の構造が適切でない場合は、移行プロセスが期待どおりに動作しない可能性があります。

既存の XHTML 文書を DITA トピックに変換するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/config/h2d_io.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/h2d_io.xml`

   The `h2d_io.xml` ファイルには、次の設定可能なパラメーターが含まれています。

   - Adobe Analytics の `inputDir` 要素を使用する場合は、入力フォルダーの場所を指定します。この場所で、ソース XHTML ドキュメントを使用できます。 例えば、XHTML ドキュメントが `xhtmltodita` in `projects` フォルダーを開き、場所を次のように指定します。 `/content/dam/projects/xhtmltodita/`

   - Adobe Analytics の`outputDir` 要素を指定する場合は、出力フォルダーの場所を指定するか、デフォルトの出力場所をそのまま使用します。 指定した出力フォルダーが DAM 上に存在しない場合は、変換ワークフローによって出力フォルダーが作成されます。

   - の `createRev` 要素を使用する場合は、変換後の DITA トピックの新しいバージョンを作成するかどうかを指定します\(`true`\) または\(`false`\) です。

1. `h2d_io.xml` ファイルを保存します。

1. 必要なパラメーターを `h2d_io.xml` ファイルにログインし、AEM UI を開きます。

1. *\（オプション\）* 変換後のドキュメントに関連リンクセクションを追加することもできます。 この機能を有効にするには、次の手順を実行します。

   >[!NOTE]
   >
   > デフォルトでは、変換後のドキュメントには関連リンクセクションが作成されません。

   1. h2d.xsl ファイルの次の場所に移動します。

      /libs/fmdita/html2dita/

   2. 次のパラメーターを検索します。

      `<xsl:param name="generate-related-links" select="false()"/>`

   3. 上記のパラメーターの値をに設定します。 `true()`.
   4. ファイルを保存して閉じます。
1. 入力フォルダーの場所\(`xhtmltodita`\) です。

1. このフォルダーにソース XHTML ドキュメントをアップロードします。 DAM でのコンテンツのアップロードについて詳しくは、 [既存の DITA コンテンツのアップロード](migrate-content-upload-existing-dita-content.md#).


の使用 `<config> </config>` ブロックを使用すると、変換する設定のブロックを 1 つ以上定義できます。 変換ワークフローが実行され、DITA トピックの形式での最終出力が `outputDir` 要素を選択します。

## 非構造化FrameMaker・ドキュメントの移行 {#id1949B050VUI}

AEMガイドを使用すると、既存の非構造化FrameMakerを変換できます\(`.fm` および `.book`\) ドキュメントを DITA ドキュメントに変換します。 最初の手順は、FrameMakerを使用してスタイルマッピングを作成し、それらの設定を.sts ファイルに保存することです。 次に、カスタム DITA を使用している場合は、カスタム要素を、 `ditaElems.xml` ファイル。 例えば、 `impnote` すべての重要なメモを処理するには、このカスタム要素を `ditaElems.xml` ファイル。 このカスタム要素を定義すると、AEMガイドは、を含むFrameMakerドキュメントの変換中にエラーを発生させませんでした。 `impnote` 要素を選択します。

また、カスタムまたは有効な DITA 要素で追加の属性を指定する場合は、style2attrMap.xml ファイルで定義できます。 例えば、 `type` 属性は `important` 人に付き合う `impnote` 要素を選択します。 この追加情報は、style2attrMap.xml ファイルで指定できます。

次を指定する以外に、

既存の非構造化FrameMaker文書を DITA 形式に変換するには、次の手順を実行します。

1. FrameMakerでスタイルマッピングを作成し、それらの設定を.sts ファイルに保存します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. カスタム DITA 要素がある場合は、 `ditaElems.xml` ファイルは次の場所にあります。

   `/libs/fmdita/config/ditaElems.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/ditaElems.xml`

   The `ditaElems.xml` ファイルには、次の設定可能なパラメータが 1 つ含まれています。

   - Adobe Analytics の `elem` パラメーターに、変換後の DITA 文書で使用するカスタム要素の名前を指定します。 この要素は、生成された DITA 文書と同様に渡されます。

1. 追加の属性を指定する場合は、 `style2attrMap.xml` ファイルは次の場所にあります。

   `/libs/fmdita/config/style2attrMap.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/style2attrMap.xml`

   The `style2attrMap.xml` ファイルには、次の設定可能なパラメーターが含まれています。

   - Adobe Analytics の `fmStyle` パラメータを指定し、マッピングするFrameMakerドキュメントで使用するソース形式を指定します。

   - Adobe Analytics の`ditaAttr` 要素を選択し、ソース形式にマッピングする DITA 属性を指定します。

   - Adobe Analytics の `ditaVal` 要素にマッピングされた属性の値を指定します。 値がない場合は、このエントリを空白のままにできます。

1. `style2attrMap.xml` ファイルを保存します。

1. 必要なパラメーターを `style2attrMap.xml` ファイルにログインし、AEM UI を開きます。

1. 変換するFrameMakerドキュメントに移動し、クリックします。

   DITA マップコンソールが表示され、出力の生成に使用できる出力プリセットのリストが表示されます。

1. DITA 出力形式を選択し、必要なパラメーターを設定します。

   >[!NOTE]
   >
   > FrameMakerで作成したのと同じ設定ファイル (.sts) を使用する必要があります。 また、「設定名」と「宛先のパス」を指定します。

1. 次をクリック： **生成** アイコンをクリックして、出力生成プロセスを開始します。


の使用 `<attrMap> </attrMap>` ブロックを使用すると、変換する設定のブロックを 1 つ以上定義できます。 内容に応じて、変換後のファイルとして.dita ファイルと.ditamap ファイルを使用できます。

## その他の構造化ドキュメントを移行する {#id1949B0590YK}

AEMガイドを使用すると、既存の構造化文書を有効な DITA 文書に変換できます。 入出力フォルダーの場所、変換ファイルの場所、最終出力の保存先となる拡張子、ドキュメントの新しいバージョンが必要かどうかを指定する必要があります。

既存の構造化文書を DITA 形式に変換するには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にあるデフォルトの設定ファイルに移動します。

   `/libs/fmdita/config/XSLConfig.xml`

1. オーバーレイノードの `config` フォルダー内の `apps` ノード。

1. 次の場所にある設定ファイルに移動します。 `apps` ノード：

   `/apps/fmdita/config/XSLConfig.xml`

   The `XSLConfig.xml` ファイルには、次の設定可能なパラメーターが含まれています。

   - Adobe Analytics の `inputDir` 要素を選択し、ソース構造化ドキュメントを使用できる入力フォルダーの場所を指定します。 例えば、構造化ドキュメントが `xsltodita` in `projects` フォルダーを開き、場所を次のように指定します。 `/content/dam/projects/xsltodita/`

   - Adobe Analytics の`outputDir` 要素を指定する場合は、出力フォルダーの場所を指定するか、デフォルトの出力場所をそのまま使用します。 指定した出力フォルダーが DAM 上に存在しない場合は、変換ワークフローによって出力フォルダーが作成されます。

   - Adobe Analytics の `xslFolder` 要素には、XSL 変換ファイルを格納するフォルダーの場所を指定します。

   - Adobe Analytics の ``xslPath`` 要素に関しては、変換処理の開始に使用するプライマリ.XSL ファイルの場所を指定します。

   - Adobe Analytics の ``outputExt`` 要素には、変換ストリームから作成される最終出力ファイルのファイル拡張子を指定します。

   - の `createRev` 要素を使用する場合は、変換後の DITA トピックの新しいバージョンを作成するかどうかを指定します\(`true`\) または\(`false`\) です。

1. `XSLConfig.xml` ファイルを保存します。

1. 必要なパラメーターを `XSLConfig.xml` ファイルにログインし、AEM UI を開きます。

1. 入力フォルダーの場所\(`xsltodita`\) です。

1. ソース構造化ドキュメントをこのフォルダーにアップロードします。 DAM でのコンテンツのアップロードについて詳しくは、 [既存の DITA コンテンツのアップロード](migrate-content-upload-existing-dita-content.md#).


の使用 `<config> </config>` ブロックを使用すると、変換する設定のブロックを 1 つ以上定義できます。 変換ワークフローが実行され、DITA トピックの形式での最終出力が `outputDir` 要素を選択します。

**親トピック：**[&#x200B;既存のコンテンツを移行](migrate-content.md)
