---
title: 付録
description: 変換用のInDesignファイルを準備する方法
source-git-commit: 5ac066bb8db32944abd046f64da11eeb1bdbe467
workflow-type: tm+mt
source-wordcount: '2861'
ht-degree: 0%

---

# 付録 {#id195AD0L60Y4}

## 変換用のInDesignファイルを準備する {#id195DBF0045Z}

InDesignでは、魅力的で複雑なドキュメントを作成するための豊富な機能セットを作成者に提供します。 多くの場合、ドキュメントの様々な部分がページ上に視覚的に配置されますが、それらのテキストフレーム間にフローが作成されることはありません。 &#39;*読み取り順序*&#x200B;テキストフレームの&#39;が定義されていません。IDML ファイルには、意味のある順序に従わないストーリーが含まれます。 段落、表、グラフィックをランダムな順序で含む 1 つ以上の DITA トピックが最終結果として表示されます。

DITA エディターでは DITA コンテンツを賢明な順序に編集できますが、IDML ファイルを作成する前にInDesignファイルを修正すると、作業が容易になります。 これは、ソースドキュメントの外観を変更せずに実行できます。 また、読み取り順序を適切に定義することで、ソースドキュメントにアクセスできるようにする利点もあります。

***テキストフレームをスレッド化***

InDesignは *&#39;スレッド化&#39;* 1 つのフレームを別のフレームにリンクするプロセスの場合。 テキストフレームの連結の詳細については、 *[テキストをスレッド](https://helpx.adobe.com/in/indesign/using/threading-text.html)* トピック (InDesignドキュメント )。

***重複するフレーム***

一部のInDesignドキュメントでは、レイアウト上の理由から、ねじが付いていない重なりフレームが使用されます。 このコンテンツをメインスレッドに結合するのは非常に困難な場合があります。 DITA 環境での結果の編集が最適な方法です。

***InDesign***

InDesignドキュメント内のコンテンツのスレッド化された各フローは、「*ストーリー*&#39;. 最良の結果を得るには、ストーリー数を制限することをお勧めします。 ただし、DITA 出力では必要でない可能性のある文書の一部があります。 例えば、ページフッターがほとんど必要になることはありませんが、慎重に処理されない場合は、トピックの途中に表示されることがあります。

ドキュメントで不要なテキストを除外する最も簡単な方法は、特別なテキストを指定することです *段落タグ* 不要なコンテンツにのみ使用されます。 例えば、 *\[ 基本段落\]* フッターには、専用の *フッター* タグを使用します。 次に、MapStyle ファイルで、 *フッター* 次のようにドロップする段落：

```XML
<paraRule style="Footer" local="0" refactor="drop">
   <attributeRules createID="false"/>
</paraRule>
```

***DITA doctype へのマッピング***

ソースドキュメントに、トピックの開始をマークできる段落スタイルまたは要素が少なくとも 1 つ含まれている必要があります。 ドキュメントが使用されるのは一般的です *見出し 1* をドキュメントの最上位タイトルの名前として使用します。 その後、そのスタイルから特定の DITA 文書型へのマッピングを作成できます。 文書が適切に整理され、 *見出し 1* が全体で一定である場合は、良い結果が得られます。

***複数の DITA ドキュメントタイプ***

以下の *見出し 1* 段落を別の DITA 文書型に変換してから、InDesignで段落スタイルを複製する必要があります。 これらのスタイルに、次のような名前を簡単に識別できるようにします。 *Heading1\_genTask* または *Heading1\_troubleshooting* 必要に応じて。 次に、次に示すように mapStyle ファイルを設定します。

```XML
<doctypes>
   <doctypeParaRule style="Heading1" local="0" mapToDoctype="concept">
      <attributeRules createID="true"/>
   </doctypeParaRule>
   <doctypeParaRule style="Heading1_genTask" local="0" mapToDoctype=" generalTask">
      <attributeRules createID="true"/>
   </doctypeParaRule>
   <doctypeParaRule style="Heading1_troubleshooting" local="0"mapToDoctype=" troubleshooting">
      <attributeRules createID="true"/>
   </doctypeParaRule>
</doctypes>
```

***構造化InDesign文書***

InDesignは XML と緩い関係にあります。 文書は XML DTD を含み、その DTD に対してメインストーリーが有効な場合もありますが、コンテンツの一部が XML であるが DTD が含まれていないハイブリッド文書を作成することもできます。 これらは、DITA への変換を成功させるための望ましくないケースです。 ドキュメントに XML 部分が含まれる場合は、出力を XML に保存し、結果が許容可能かどうかを確認します。 そうでない場合、DITA コンテンツに無効なコンテンツも含まれるか、完全に失敗する場合があります。

***テーブルの書式設定***

DITA でのInDesign表書式設定ルールから対応する表書式設定への変換は複雑な処理です。 これは、DITA で使用される Oasis \(CALS\) テーブルモデルで提供される基本オプションと比較して、ソースファイルで使用できる豊富な書式設定機能が原因です。 縦書きおよび横書きのテキストの整列が指定され、同様の結果が得られます。ただし、「両端揃え」のテキストは常にテキストの方向に従って両端揃えされます。一方、「InDesign」では「左揃え」と「右揃え」が可能です。

InDesignの列と行の区切り文字の処理は、Oasis 表モデルの基本オプションよりもはるかに高い機能を持ちます。 InDesignには、境界線の種類（「実線またはパターン」）、境界線の太さ、境界線の色、境界線の色、境界線の間隔の色および境界線の間隔の色の色合いの 4 つのセルの境界線が用意されています。 これらはすべて、各セルの右と下の境界線にマッピングする必要があります（エントリ要素）。選択肢は 0 または 1 のみです。境界線を非表示にしたり、境界線を表示したりします。

境界線のInDesignは、次のレベルで適用できます。

- テーブルスタイル
- セルのスタイル
- 各セルのローカル上書き

InDesignから DITA への変換プロセスでは、次のように境界線の罫線が適用されます。

- テーブルスタイルは `colspec/@colsep` 属性を設定します。 水平方向ルールは `row/@rowsep` 属性。 どちらの場合も、border が定義されていない場合、属性は作成されません。
- セルのスタイルは `entry/@colsep` および `entry/@rowsep` 属性。 これらの値は、表スタイルの派生境界線の規則に優先します。
- ローカルオーバーライドは、セルに直接書式を適用し、テーブルスタイルとセルスタイルをオーバーライドします。

***交互パターン***

InDesignのテーブルスタイルを使用すると、列とセルの罫線を交互に設定することができます。 この機能は変換でサポートされていますが、1 つのパターングループが rearing \(1\) を表示するようにマッピングし、他のパターングループが arring \(0\) を非表示にするようにマッピングした場合にのみ、結果が明確になります。

## DITA への移行のInDesign用のマッピングファイルの準備 {#id194AF0003HT}

正しい DITA 変換を行うには、ソース文書の内容と一致するマッピングファイルが必要です。 非構造化InDesignドキュメントの場合は、使用可能なすべての段落スタイルと文字スタイルをマッピングする必要があります。 XML 構造化InDesign文書の場合、関連する DTD 内のすべての要素をマッピングする必要があります。

非構造化ドキュメントと構造化InDesign・ドキュメントのマッピング・ファイルは異なります。 これは、非構造化ソースコンテンツを DITA に変換する際の処理要件がより複雑になるためです。

マッピングファイルの例を以下に示します。

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE styleMap SYSTEM "mapStyle.dtd">
<styleMap xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="mapStyle.xsd" >
   <doctypes>
      <mapDoctypeParaRule root="itpx:stories" mapToDoctype="map">
         <attributeRules createID="true">
            <addNew name="outputclass" value="map"/>
         </attributeRules>
      </mapDoctypeParaRule>
      <doctypeParaRule style="Heading 1" local="0" mapToDoctype="concept">
         <attributeRules createID="true"/>
      </doctypeParaRule>
      <doctypeParaRule style="Heading A" local="0" mapToDoctype="topic">
         <attributeRules createID="true"/>
      </doctypeParaRule>
   </doctypes>
   <wrappingRules>
      <wrap elements="li+" context="number" wrapper="ol">
         <attributeRules createID="true"/>
      </wrap>
      <wrap elements="li+" context="bullet" wrapper="ul">
         <attributeRules createID="true"/>
      </wrap>
   </wrappingRules>
   <paragraphStyleRules>
      <paraRule style="Heading 2" local="0"  mapTo="p">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="Heading 3" local="0"  mapTo="p">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="List Paragraph" local="p[-|-|-|-|-|b|-|-]" context="bullet" mapTo="li">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="List Paragraph" local="p[-|-|-|-|-|n|-|-]" context="number" mapTo="li">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="List Paragraph" local="0" context="bullet" mapTo="li">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="Normal" local="0"  mapTo="p">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="Normal" local="p[-|-|-|-|-|b|-|-]" context="bullet" mapTo="li">
         <attributeRules createID="true"/>
      </paraRule>
      <paraRule style="Title" local="0"  mapTo="p">
         <attributeRules createID="true"/>
      </paraRule>
   </paragraphStyleRules>
   <characterStyleRules>
      <charRule style="Bold" local="0" mapTo="b">
         <attributeRules createID="false"/>
      </charRule>
      <charRule style="Code" local="0" mapTo="codeph">
         <attributeRules createID="false"/>
      </charRule>
      <charRule style="[No character style]" local="c[Bold|-|-|-|-|-|-|-]" mapTo="b">
         <attributeRules createID="false"/>
      </charRule>
      <charRule style="[No character style]" local="c[Italic|-|-|-|-|-|-|-]" mapTo="i">
         <attributeRules createID="false"/>
      </charRule>
   </characterStyleRules>
</styleMap>
```

マッピングファイルは、ソース段落スタイルと文字スタイルコードをすべてリストする単純な構造を持つ XML ファイルです。 ファイルの内容については、以下で説明します。

**スタイルマッピング**

内 `styleMap` 要素を使用する場合、2 つのオプションの属性を指定できます。 `@map_date` および `@map_version` マッピングファイルのバージョンを記録するための。

**ドキュメントタイプ**

この `doctypes` 要素は、サポートされる DITA マップおよびトピックマッピングをリストします。

**ドキュメントタイプの段落ルールをマッピング**

この `mapDoctypeParaRule` 要素は必須です。 ソース XML のルート要素は常に DITA マップのルートにマッピングされるので、この要素の属性は編集できません `map` 要素。

**ドキュメントタイプの段落ルール**

この `doctypeParaRule` 要素は必須です。 これにより、変換プロセスで新しいトピックの開始を識別できるようになります。 通常、 `@style` 属性は、 `@local` 属性を 0 に設定します。 ただし、選択したスタイルに常にローカルの書式の上書きがある場合は、各スタイルとそのローカルの上書きに関するルールを追加する必要があります。 これは、生成されたマッピングファイル内で、次のようなものを見つけることが可能な場所を認識するのが簡単です。

```XML
<paraRule style="Heading 1" local="0" mapTo="p">
   <attributeRules createID="true"/>
</paraRule>
<paraRule style="Heading 1" local="p[Italic|-|-|-|-|-|-|-]" mapTo="p">
   <attributeRules createID="true"/>
</paraRule>
```

上記の例では、次の 2 つがあります。 `paraRule` の要素 `@style` = &quot;Heading1&quot; 単に、同等の `doctypeParaRule` 要素を `@mapToDoctype` 必要に応じて属性セットを設定します。

で使用される属性 `doctypeParaRule` 以下に説明します。

- `@style`:ソースInDesignドキュメント内のスタイルの名前。
- `@local`:詳しくは、 [\#id194CG0V005Z](#id194CG0V005Z).
- `@mapToDoctype`:すべての有効な DITA トピックタイプの列挙リストの名前 `doctypes`.

**要素のラッピングルール**

要素のラッピングルールは、一連の属性値に従って、読み込むドキュメント内の要素を事前定義済みの要素にラップまたは移動する方法を定義します。

***`wrap`element***

これはオプションの要素です。 この `wrap` element は、ラップまたは移動する要素のリストを表示します。 ラッピングは、通常、一連の要素に共通の親要素を指定する必要がある場合に使用します。 例：複数 `li` 要素を `ol` 要素。 また、 `wrap` は、図や表のタイトルなどの移動要素に使用できます。

で使用される属性 `wrap` 以下に説明します。

- `@element`:要素名の後にプラス記号を付けると、同じ名前を持つ隣接するすべての要素が、 `@wrapper`属性。
- `@wrapper`:ラッピング要素の名前。
- `@context`:特定の要素のラップ方法をさらに絞り込む方法を提供します。 次の例は、一連の `li` 順序付きリストの要素 `ol` または順不同のリスト `ul` 次によると `@context` 値\( コンテキストは `paraRule` element\):

   ```XML
   <wrap elements="li+" context="number" wrapper="ol">
      <attributeRules createID="true"/>
   </wrap>
   <wrap elements="li+" context="bullet" wrapper="ul">
      <attributeRules createID="true"/>
   </wrap>
   ```


次の例は、 `fig` 要素 `title` および `image` 要素：

- `@elements`:リストで区切られた要素は、 `@wrapper` 属性。 画像の下に図のタイトルを含めるのが一般的な方法なので、タイトルは `title` 直後の要素 `image`.

   次のラップルールは次のとおりです。

   ```XML
   <wrap elements="title, image" context="FigTitle" wrapper="fig">
      <attributeRules createID="true"/>
   </wrap>
   ```

   次の中間 XML を変換します。

   ```XML
   <image href="Links/myImage.png" scale="59">
      <title>IDML2DITA workflow</title>
   ```

   次の有効な DITA 図形構造へ：

   ```XML
   <fig id="id397504">
      <title>IDML2DITA workflow</title>
      <image href="Links/myImage.png" scale="59">
   </fig>
   ```

- `@wrapper`:ラッピング要素の名前。
- `@context`:指定された要素がラップされる方法をさらに絞り込む方法を提供します\( コンテキストは `paraRule` element\) で使用できます。

次の例は、 `title` に `table`:

- `@elements`:この `title` 直前または直後にある要素 `table` は、 `@wrapper` 属性。 XPath スタイルの述語は、タイトル要素の位置を `[before]` または `[after]`.

   例：次のラップルールは次のとおりです。

   ```XML
   <wrap elements="title[before]" context="TableTitle" wrapper="table">
      <attributeRules createID="true"/>
   </wrap>
   ```

   次の中間 XML を変換します。

   ```XML
   <title>IDML2DITA workflow</title>
   <table id="id289742" outputclass="BasicTable">
      <tgroup cols="2">
         <colspec colname="0" colwidth="0.7*">
            <colspec colname="1" colwidth="0.3*">
   ```

   この有効な DITA 図形構造に対して、次の操作を行います。

   ```XML
   <table id="id289742" outputclass="BasicTable">
      <title>IDML2DITA workflow</title>
      <tgroup cols="2">
         <colspec colname="0" colwidth="0.7*">
            <colspec colname="1" colwidth="0.3*">
   ```

- `@wrapper`:ラッピング要素の名前。

- `@context`:指定された要素がラップされる方法をさらに絞り込む方法を提供します\( コンテキストは `paraRule` element\) で使用できます。


**段落スタイルルール**

この `<paragraphStyleRule>` 要素については、以下で説明します。

***`paraRule`element***

この `paraRule` 要素は必須です。 すべての段落スタイルのマッピングルールを指定します。 InDesignドキュメントでは、スタイルのない段落にも名前が付けられ、すべてのテキストが段落スタイルのサブ構造内に含まれます `[No paragraph style]`. 角括弧は、組み込みのInDesignスタイル名を示します。

>[!NOTE]
>
> 角括弧は組み込みのInDesignスタイル名を示します。

で使用される属性 `paraRule` 以下に説明します。

- `@style`:ソースInDesignドキュメント内のスタイルの名前。
- `@local`:詳しくは、 [\#id194CG0V005Z](#id194CG0V005Z).
- `@mapTo`:DITA ターゲット要素の名前。

- `@context`:この属性は、特定の **折り返し** ルールは、複数のラッパー選択を使用できる場合に使用します。 例：の `li` 要素は `ol`、または `ul` 要素。 異なるリストタイプを識別するには、特定のスタイル名または `@local` 属性を次のように表示できます。
   - `local="p[-|-|-|-|-|b|-|-]"` ここで、`b`フィールド 6 の「 」は箇条書きリスト項目を示します。 この場合、 `@context` &#39;へ`bullet`&#39;.
   - `local="p[-|-|-|-|-|n|-|-]"` ここで、`n`フィールド 6 の&#39;は番号付きリスト項目を示します。 この場合、 `@context` &#39;へ`number`&#39;.

- `@commentOut`:この属性を使用すると、XML コメントでターゲット要素をラッピングして、情報が失われるのを防ぎ、ユーザーが手動で処理できるようになります。 これは、ソースコンテンツを DITA 構造ルールに強制的に準拠させることができない場合に役立ちます。

- `@refactor`:このオプションの属性には、次の 2 つの値の選択肢があります。

- `unwrap`:一致した要素は、そのコンテンツを保持したまま削除されます。

- `drop`:一致した要素とそのすべてのコンテンツが削除されます。


**文字スタイルルール**

この `charRule` 要素については、以下で説明します。

>[!NOTE]
>
> 組み込みの文字スタイルに対するマッピングはありません `[No character style]` when `local="0"`（前処理中に削除されるので）。

***`charRule`element***

これはオプションの要素です。

これらは、すべての文字スタイルのマッピング規則です。 InDesignドキュメントでは、すべてのテキストは文字スタイルの子要素内に含まれます。

で使用される属性 `charRule` 以下に説明します。

- `@style`:ソースInDesignドキュメント内のスタイルの名前。
- `@local`:詳しくは、 [\#id194CG0V005Z](#id194CG0V005Z).
- `@mapTo`:DITA ターゲット要素の名前。
- `@refactor`:このオプションの属性には、次の 2 つの値の選択肢があります。
   - `unwrap`:一致した要素は、そのコンテンツを保持したまま削除されます。

   - `drop`:一致した要素とそのすべてのコンテンツが削除されます。


**属性ルール**

この要素は、次の要素コンテキストの子にすることができます。

- `mapDoctypeParaRule`
- `mapDoctypeElemRule`
- `doctypeParaRule`
- `doctypeElemRule`
- `paraRule`
- `charRule`
- `elementRule`

属性ルールの目的は、一致する要素の属性を管理することです。

コンテキストに応じて、次の属性を使用できます。 `attributeRules` 要素：

- `@createID`:一致する要素の一意の ID を生成します。 許可されている値 `true` または `false`. すべてのコンテキストで使用できます。
- `@copyAll`:構造化ソースファイルのソース XML コンテンツからすべての属性をコピーします。 使用できる値は次のとおりです。 `true` または `false`. コンテキストで使用可能 `mapDoctypeParaRule`, `mapDoctypeElemRule`, `doctypeElemRule` および `elementRule`.


で使用される属性 `attributeRules` 以下に説明します。

>[!NOTE]
>
> この要素には、複数の子要素を含めることができます。

- `addNew`:一致する要素に新しい属性を追加します。 すべてのコンテキストで使用できます。 これには次の 2 つの属性があります。
   - `@name`:正しい XML 名を指定する必要があります。できれば DITA コンテキストで有効です。
   - `@value`:リテラルテキストまたは単純な XPath 式を指定できます。
- `copyAtt`:1 つの属性をターゲットにコピーしますが、必要に応じてプロセス内で名前を変更します。 値は変更されません。 コンテキストで使用可能 `mapDoctypeParaRule`, `mapDoctypeElemRule`, `doctypeElemRule` および `elementRule`. この要素が存在する場合、 `@copyAllAtts` 値は `false`. これには次の 2 つの属性があります。
   - `@name`:ソース XML 要素に存在する属性の名前である必要があります。
   - `@mapTo`:正しい XML 名を指定する必要があります。できれば DITA コンテキストで有効です。

**ローカル書式コード**

どのInDesignドキュメントでも、段落スタイルと文字スタイルで、数百種類の書式設定の上書きを繰り返すことができます。 これらのプロパティのほとんどでは、変換プロセスに役立つ役割はありません。 ただし、ドキュメントのセマンティクスに影響を与え、変換プロセスに影響を与える必要がある書式設定機能のコアセットが特定されました。

この `@local` 属性は特別な区切り形式で表され、8 つのフィールドにプレフィックスと共に付けられ、書式の上書きのタイプを示します。 書式コードフィールドを次に示します。

- プレフィックス **p** パラスタイルのローカル上書きまたは **c** 文字スタイルのローカル優先設定の場合
- **フォントスタイル** ファミリ名とプロパティ (「***太字縮小斜体***&#39;.
- **フォントサイズ** ポイント単位。
- **文字位置** 上付き文字または下付き文字の場合。
- **の下** アンダースコア用。
- **取り消し** 打ち消し線。
- **リストコード** リストの種類を箇条書きとして識別する場合は、「番号付き」を選択します。InDesignでは常に使用されるわけではありません。
- **箇条書きコード** ドキュメント内の定義済みの箇条書きタイプをすべて一覧表示します。
- **番号コード** ドキュメント内の定義済みのすべての番号付けスタイルを一覧表示します。

この機能を慎重に使用すると、ローカルの書式が失われた場合に、スタイル設定されたコンテンツから DITA への転送の品質を向上させるのに役立ちます。 次の例は、斜体（箇条書きリスト内の 16pt テキスト）に解決できます。 `p[Italic|16|-|-|-|b|-|-]`.

**構造マッピング**

構造マッピングファイルは、すべてのソース要素と関連する属性タイプをリストする単純な構造を持つスタイルマッピングファイルに似ています。 2 つの属性 `@map_date` および `@map_version` は、使用するマッピングファイルのバージョンを記録するために提供されます。

**ドキュメントタイプ**

この `doctypes` 要素は、サポートされる DITA マップおよびトピックマッピングをリストします。

**ドキュメントタイプ要素ルールをマッピング**

この `mapDoctypeElemRule` 要素は必須です。 ソース XML のルート要素は常に DITA マップのルートにマッピングされるので、この要素の属性は編集できません `map` 要素。

**要素のラッピングルール**

**`elementRules`要素** すべての要素が表示されます。

**`elementRule`要素** この `elementRule` 要素は必須です。 これらは、すべてのソース要素のマッピングルールです。 InDesignドキュメントには非構造化スタイル要素が含まれていますが、構造化コンテンツでは「***ハイブリッドモード***「 」の処理が有効になっています。

で使用される属性 `elementRule` 以下に説明します。

- `@elementName`:ソース要素ドキュメント内のInDesignの名前。

- `@local`:詳しくは、 [\#id194CG0V005Z](#id194CG0V005Z). \（ハイブリッドドキュメントでのみ有用）。

- `@mapTo`:DITA ターゲット要素の名前。

- `@refactor`:このオプションの属性には、次の 2 つの値の選択肢があります。

   - `unwrap`:一致した要素は、そのコンテンツを保持したまま削除されます。

   - `drop`:一致した要素とそのすべてのコンテンツが削除されます。

- `@context`:この属性は、複数のラッパー選択肢がある場合に、特定のラップルールにリンクするために使用されます。 例：の `li` 要素は `ol`、または `ul` 要素。

- `@commentOut`:この属性を使用すると、XML コメントでターゲット要素をラッピングして、情報が失われるのを防ぎ、ユーザーが手動で処理できるようになります。 これは、ソースコンテンツを DITA 構造ルールに強制的に準拠させることができない場合に役立ちます。


## トラブルシューティングAEMガイド

AEMガイドをインストールして設定したら、問題のトラブルシューティングをおこなうことができます。

## 参照を検証

指定したスクリプトを実行して、参照を検証できます。 これらのスクリプトは、壊れた参照を識別し、それらをパッチまたは修正するのに役立ちます。

- `/bin/fmdita/validatebtree?operation=validate`  — 壊れたコンテンツ参照を報告しますが、修正されません。
- `/bin/fmdita/validatebtree?operation=patch` — 壊れたコンテンツ参照、パッチ、または修正をリストします。

**スクリプトを検証**

製品パッケージで使用可能な検証スクリプトを使用して、次の手順を実行して参照を確認します。

1. 検証スクリプト\[ を実行します`/bin/fmdita/validatebtree?operation=validate`\] をクリックして、新しい壊れた参照がないかどうかを確認します。
1. 検証スクリプトがエラーを報告した場合は、パッチスクリプトを使用してパッチを適用できます。
1. 以下の詳細を記録し、必要に応じて、お客様の成功チームと共有します。
1. 
   - 検証スクリプトで印刷されたログ
- &quot;のパッケージ`/content/fmdita/references`&quot;
- 報告されたシナリオに応じて、その他必要な詳細

**パッチスクリプト**

製品パッケージで使用可能なパッチスクリプトを使用して、壊れた参照にパッチを適用するには、次の手順を実行します。

1. パッチスクリプトの実行 `[/bin/fmdita/validatebtree?operation=patch]` 壊れた参照を修正する。 スクリプトの実行には数分かかり、進行に応じてログが出力されます。 実行が完了すると、「`Done`「最後に」

   **注意：* 参照用として、ログをコピーして保存することをお勧めします。

1. パッチスクリプトが正常に実行されたら、次のチェックを実行できます。
1. 
   - 新しいノード「 」を確認します。`references_backup_<timestamp>"` は以下で作成されました： `/content/fmdita`
- 参照が修正されたことを確認します

**Logger**

また、次に示す詳細に従って、このスクリプト実行用に別のロガーを作成することもできます。

- クラス「 」にロガーを追加`adobe.fmdita.common.BTreeReferenceValidator`&quot;
- をに設定します。 `DEBUG`

作成されたログファイルには、スクリプトの実行に関するすべての情報が記録されます。これは、ブラウザーセッションがタイムアウトした場合に、ブラウザーからスクリプトをトリガーする際に役立ちます。

