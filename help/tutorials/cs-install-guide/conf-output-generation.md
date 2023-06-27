---
title: 出力生成設定の指定
description: 出力生成設定の設定方法を説明します
source-git-commit: 4f15166b1b250578f07e223b0260aacf402224be
workflow-type: tm+mt
source-wordcount: '5252'
ht-degree: 1%

---


# 出力生成設定の指定 {#id181AI0B0E30}

AEMガイドには、出力生成プロセスをカスタマイズするための多くの設定オプションが付属しています。 このトピックでは、出力生成プロセスの設定に役立つすべての設定とカスタマイズについて説明します。

## DITA マップダッシュボードの「ベースライン」タブを設定します。 {#id223MD0D0YRM}

DITA マップダッシュボードの「ベースライン」タブを非表示にするには、次の手順を実行します。

1. に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。
1. 設定ファイルで、マップダッシュボード上のベースラインタブを設定する次の\（プロパティ\）詳細を指定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `hide.tabs.baseline` | Boolean\(`true/false`\).**デフォルト値**: `true` |

>[!NOTE]
>
> この設定はデフォルトで有効になっており、マップダッシュボードでは「ベースライン」タブを使用できません。

## 既存のAEM Site 内でのブレンド公開の設定 {#id1691I0V0MGR}

DITA コンテンツを含むAEMサイトがある場合は、DITA コンテンツをサイト内の事前定義された場所に公開するようにAEM Site の出力を設定できます。 例えば、AEM Site ページの次のスクリーンショットでは、 `ditacontent` ノードは DITA コンテンツの格納用に予約されています。

![](assets/publish-in-aem-site.png)

ページに残っているノードは、AEM Site Editor から直接作成します。 DITA コンテンツを事前定義の場所に公開するように公開設定を指定すると、AEM Guides の公開プロセスで、既存の DITA 以外のコンテンツが変更されなくなります。

事前定義されたノードに DITA コンテンツを公開できるようにするには、既存のサイトで次の設定を実行する必要があります。

- サイトのテンプレートプロパティを設定する

- サイトにノードを追加して DITA コンテンツを公開します


次の手順を実行して、既存のサイトのテンプレートプロパティを設定します。

1. パッケージマネージャーを使用して、/libs/fmdita/config/templates/default ファイルをダウンロードします。

   >[!NOTE]
   >
   > デフォルトの設定ファイルを `libs` ノード。 オーバーレイを作成するには、 `libs` ノードを `apps` ノードに追加し、 `apps` ノードのみ。

1. 以下のプロパティを追加します。

   | プロパティ名 | タイプ | 値 |
   |-------------|----|-----|
   | `topicContentNode` | 文字列 | DITA コンテンツを公開するノード名を指定します。 例えば、AEMガイドが DITA コンテンツを公開するデフォルトのノードは次のようになります。 <br> `jcr:content/contentnode` |
   | `topicHeadNode` | 文字列 | DITA コンテンツのメタデータ情報を格納するノード名を指定します。 例えば、AEMガイドにメタデータ情報が格納されるデフォルトのノードは次のようになります。 <br> `jcr:content/headnode` |


次回、サイトのテンプレート設定を使用して DITA コンテンツを公開する際に、そのコンテンツが `topicContentNode` および `topicHeadNode` プロパティ。

## AEM Site 出力のカスタマイズ {#id166TG0B30WR}

AEMガイドでは、次の形式での出力の作成をサポートしています。

- AEM Site

- PDF

- HTML 5
- EPUB
- DITA-OT によるカスタム出力

AEM Site の出力に対して、出力タスクごとに異なるデザインテンプレートを割り当てることができます。 これらのデザインテンプレートは、異なるレイアウトで DITA コンテンツをレンダリングできます。 例えば、内部オーディエンスと外部オーディエンスに異なるデザインテンプレートを指定できます。

また、AEMガイド付きのカスタマイズ DITA Open Toolkit \(DITA-OT\) プラグインを使用することもできます。 これらのカスタム DITA-OT プラグインをアップロードして、特定の方法でPDF出力を生成できます。

>[!TIP]
>
> 詳しくは、 *AEM Site Publishing* AEM Site 出力の作成に関するベストプラクティスに関する節を参照してください。

### 出力を生成するためのデザインテンプレートのカスタマイズ {#customize_xml-add-on}

AEMガイドでは、AEM Site 出力を生成するために、事前定義済みの一連のデザインテンプレートを使用します。 AEMガイドのデザインテンプレートをカスタマイズして、企業のブランディングに合った出力を生成できます。 デザインテンプレートは、各種スタイル\(CSS\)、スクリプト\（サーバー側とクライアント側の両方\）、リソース\（画像、ロゴ、その他のアセット\）、および JCR ノードの集まりで、これらすべてのリソースを結び付けます。 デザインテンプレートは、JCR ノードの数個だけを含む単一のサーバーサイドスクリプトと同じくらい簡単なものでも、スタイル、リソース、JCR ノードの複雑な組み合わせでも構いません。 デザインテンプレートは、AEM Site 出力を生成する際にAEM Guides の公開サブシステムで使用され、生成された出力の構造、ルックアンドフィールを制御します。

デザインテンプレートリソースをサーバー上のどこに配置するかに制限はありませんが、通常は、関数に従って論理的に整理されます。 例えば、デフォルトのテンプレートには、すべての JavaScript ファイルと CSS ファイルが格納されています。 `/etc/designs/fmdita/clientlibs/siteoutput/default` フォルダー。 これらのファイルが配置されている場所は、JCR ノードのコレクションで相互にリンクされます。 これらの JCR ノードとファイルが共に、デザインテンプレート全体を構成します。

AEMガイドに付属しているデフォルトのデザインテンプレートでは、ランディング、トピックおよび検索ページのコンポーネントをカスタマイズできます。 デフォルトのデザインと対応する参照テンプレートのコピーを作成し、必要な出力を生成するために、様々なコンポーネントを指定できます。

次の手順を実行して、AEM Site の出力生成に使用する独自のデザインテンプレートを指定します。

1. パッケージマネージャーを使用して、次の場所からデフォルトのデザインテンプレートをダウンロードします。

   /libs/fmdita/config/templates

1. ダウンロードしたファイルのコピーを、Cloud Manager の Git リポジトリー内の次の場所に作成します。

   /apps/fmdita/config/templates

1. また、デフォルトのテンプレートノードから参照されるテンプレートをダウンロードしてコピーする必要があります。 参照されるテンプレートは、次の場所に配置されます。

   /libs/fmdita/templates/default/cqtemplates

   次の表に、AEM Guide のデザインテンプレートのプロパティについて説明します。

   | プロパティ | 説明 |
   |--------|-----------|
   | `landingPageTemplate`、`searchPageTemplate`、`topicPageTemplate`、`shadowPageTemplate` | 次を指定： `cq:Template` ノードを使用して、これらの対応するページ（landing、search および topic）を検索できます。 デフォルトでは、 `cq:Template` ノードは、 `/libs/fmdita/templates/default/cqtemplates` ノード。 このノードは、ランディングページ、検索ページ、トピックページの構造とプロパティを定義します。<br> この `shadowPageTemplate` を使用して、まとまったコンテンツを最適化します。 このプロパティの値を次の値に設定する必要があります。 `fmdita/templates/default/cqtemplates/shadowpage` <br> **注意：** 次の項目の値を指定する必要があります： `topicPageTemplate`. この `landingPageTemplate` および `searchPageTemplate` はオプションのプロパティです。 検索およびランディングページを生成しない場合は、これらのプロパティを指定しないでください。 |
   | `title` | デザインテンプレートのわかりやすい名前。 |
   | `topicContentNode` | トピックページ内の DITA コンテンツを含むノードの場所。 パスはトピックページに対する相対パスです。 |
   | `topicHeadNode` | DITA コンテンツから派生した head 値（または metadata）を含むノードの場所。 パスはトピックページに対する相対パスです。 |
   | `tocNode` | 目次を含むノードの場所。 パスは、ランディングページまたは宛先パスを基準とした相対パスです。 |
   | `basePathProp` | 公開済みサイトのルートのパスを保存するためのプロパティ名。 |
   | `indexPathProp` | 公開済みサイトのランディングページ/インデックスページのパスを保存するためのプロパティ名です。 |
   | `pdfPathProp` | トピックPDFの生成が有効な場合に、トピックパスを保存するためのプロパティPDF。 |
   | `pdfTypeProp` | PDF生成のタイプを保存するためのプロパティ名。 現在、このプロパティには常に「トピック」が含まれています。 |
   | `searchPathProp` | テンプレートに検索ページが含まれる場合に、検索ページのパスを保存するためのプロパティ名。 |
   | `siteTitleProp` | 公開するサイトのタイトルを保存するためのプロパティ名。 このタイトルは、通常、パブリッシュされるマップのタイトルと同じです。 |
   | `sourcePathProp` | 現在のページのソース DITA トピックのパスを保存するプロパティ名です。 |
   | `tocPathProp` | 公開済みサイトの TOC ルートのパスを保存するためのプロパティ名です。 |


>[!NOTE]
>
> カスタムデザインテンプレートノードを作成した後、カスタムデザインテンプレートノードを使用するには、AEM Site の出力プリセットの「デザイン」オプションを更新する必要があります。

詳しくは、 [最初のAdobe Experience Manager Web サイトの作成](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-wknd-tutorial-develop/overview.html?lang=ja) および [基本](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/developing/full-stack/develop-wknd-tutorial.html?lang=en) AEM上で独自の web サイトを開発する

### ドキュメントタイトルを使用してAEMサイト出力を生成

AEM Site 出力を生成する際、URL の生成方法は、コンテンツの検出性に重要な役割を果たします。 UUID ベースのファイル名を使用している場合、ファイルの UUID に基づいて URL を生成しても、検索でわかりにくくなります。 管理者または発行者は、AEM Site 出力の URL を生成する方法を制御できます。 AEMガイドでは、AEMサイト出力の URL を生成する際に、UUID ベースのファイル名ではなく、ファイルのタイトルを使用して設定できます。 UUID ベースのファイルシステムの場合、デフォルトでは、このオプションはオンになっています。 これは、UUID ベースのファイルシステム用にAEM Site 出力を生成する場合、ファイルの UUID ではなく、ファイルのタイトルが URL の生成に使用されることを意味しています。

>[!NOTE]
>
> さらに、AEM Site 出力の URL 内に一連の文字のみを許可するようにルールを設定することもできます。 詳しくは、 [トピックを作成し、AEM Site 出力を公開するためのファイル名のサニタイズルールを設定する](#id2164D0KD0XA).

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）の詳細を指定して、AEM Site 出力で URL の生成を設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `aemsite.pagetitle` | ブール値\(true/false\)。 ページタイトルを使用して出力を生成する場合は、このプロパティを true に設定します。 デフォルトでは、ファイル名を使用するように設定されています。<br> **デフォルト値**:false |

### トピックを作成し、AEM Site 出力を公開するためのファイル名のサニタイズルールを設定する {#id2164D0KD0XA}

管理者は、ファイル名で使用できる有効な特殊文字のリストを定義でき、最終的にAEM Site 出力の URL を形成します。 以前のリリースでは、ユーザーは、次のような特殊文字を含むファイル名を定義できました。 `@`, `$`, `>`など。 これらの特殊文字を使用すると、AEM Site ページの生成時に URL がエンコードされていました。

3.8 リリースより、ファイル名で許可される特殊文字のリストを定義する設定が追加されました。 デフォルトでは、有効なファイル名設定に「`a-z A-Z 0-9 - _`&quot;. つまり、ファイルを作成する際に、ファイルのタイトルに任意の特殊文字を含めることができますが、内部的にはハイフン\(`-`\) をファイル名に含めます。 例えば、ファイルのタイトルを Introduction 1 またはIntroduction@1と指定できます。これらの場合、対応するファイル名は Introduction-1 となります。

有効な文字のリストを定義する場合は、「`*/:[\]|#%{}?&<>"/+`&quot;および&quot; `a space` は常にハイフン\(`-`\) です。

>[!NOTE]
>
> 有効な特殊文字のリストを設定しないと、ファイルの作成プロセスで予期しない結果が生じる場合があります。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\(property\) 詳細を指定して、ファイル名とAEM Site 出力で有効な特殊文字を設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.common.SanitizeNodeNameImpl` | `aemsite.DisallowedFileNameChars` | プロパティがに設定されていることを確認します。 ``'<>`@$``. このリストには、さらに特殊文字を追加できます。 |

また、ファイル名で小文字を使用する、無効な文字を処理する区切り文字、ファイル名で許可される最大文字数など、他のプロパティを設定することもできます。 これらのプロパティを設定するには、設定ファイルに次のキーと値のペアを追加します。

| プロパティキー | プロパティの値 |
|------------|--------------|
| `nodename.uselower` | ブール値\(true/false\)。<br> **デフォルト値**:true |
| `nodename.separator` | 任意の文字。 <br> **デフォルト値**:\_ *\（アンダースコア\）* |
| `nodename.maxlength` | 整数値。<br> **デフォルト値**:50 |

### AEM Site ノード構造の統合を設定

AEM Site 出力を生成すると、トピック内のすべての要素のノードが内部的に作成されます。 何千ものトピックを含む DITA マップの場合、このノード構造が深すぎる可能性があります。 このタイプの深くネストされたノード構造は、大規模なサイトでパフォーマンスの問題を引き起こす可能性があります。 次のスナップショットは、AEM Site 出力用に深くネストされたノード構造を示しています。

![](assets/deep-nested-aem-site-node-structure.png)

上記のスナップショットでは、 `p` 要素とその後続のサブ要素、および同様の構造が、トピックで使用される他のすべての要素に対して作成されます。

AEMガイドを使用すると、AEM Site 出力のノード構造を内部で作成する方法を設定できます。 指定した要素でノード構造を統合できます。つまり、メイン要素と見なされる要素を定義し、その中のすべてのサブ要素をメイン要素と結合できます。 例えば、 `p` 要素を選択し、その中に現れる任意の要素を `p` 要素がメインと結合されます `p` 要素。 内のサブ要素に対して別のメモは作成されません。 `p` 要素。 次のスナップショットは、フラット化されたノード構造を示しています： `p` 要素：

![](assets/flattened-aem-site-node-structure.png)

AEM Site のノード構造を統合するには、次の手順を実行します。

1. ノード構造を統合する要素を指定します。

1. のオーバーレイ `libs` ノードを `apps` ノードに移動し、 elementmapping.xml ファイルを開きます。

1. を `<flatten>true</flatten>` プロパティを含めます。 例えば、 `p` 要素を選択し、 `p` 要素を次に示します。

   ```XML
   <ditaelement>
         <name>p</name>
         <class>- topic/p</class>
         <componentpath>fmdita/components/dita/wrapper</componentpath>
         <type>COMPOSITE</type>
         <target>para</target>
         <flatten>true</flatten>
         <wrapelement>div</wrapelement>
      </ditaelement>
   ```

   >[!NOTE]
   >
   > デフォルトでは、flatten ノードのプロパティは `p` 要素。

1. に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。
1. 設定ファイルで、次の\(property\) 詳細を指定します。

   | PID | プロパティキー | プロパティの値 |
   |---|------------|--------------|
   | `com.adobe.dxml.flattening.FlatteningConfigurationService` | `flattening.enabled` | ブール値\(true/false\)。<br> **デフォルト値**: `false` |


これで、AEM Site の出力を生成する際に、 `p` 要素が統合され、 `p` 要素自体。 新しい統合プロパティは、 `p` 要素を作成します。

![](assets/flatten-aem-site-note-props-crxde.png)

**AEM Site 出力のコンテンツ内の文字列を検索**

デフォルトでは、AEM Site 出力内のタイトル内の文字列のみを検索できます。 タイトル内の文字列と、AEM Site 出力のコンテンツまたは本文の両方を検索するようにシステムを設定できます。

>[!NOTE]
>
> コンテンツ内の一部の要素に対して検索が機能する場合がありますが、コンテンツ全体に対して機能するように設定することもできます。

![](assets/flatten-aem-site-note-props-crxde-search.png)

検索を有効にするには、AEM Site ノード構造の統合を設定する必要があります。

注意：:

最大 1 MB の統合されたコンテンツを検索できます。 例えば、前のスクリーンショットでは、以下のコンテンツを検索できます。 &lt;p> タグが &lt;= 1 MB の場合。

>[!NOTE]
>
> 検索は、 `<flatten>`属性が true に設定されている。 デフォルトでは、AEMガイドには `<flatten>` 属性は、 &lt;p> &lt;ul> &lt;li>. ただし、一部のカスタム要素を作成している場合は、 `<flatten>` elementmapping.xml ファイルの属性を true に設定します。

**AEM Site ノード構造のフラット化を防ぐ**

AEM Site の出力で統合するノードを指定する場合と同様に、この設定から除外する要素を指定することもできます。 例えば、 `body` 要素が必要ですが、 `table` 内の要素 `body` を統合する場合、「次を除外する」プロパティを `table` 要素の定義。

を除外するには、 `table` 要素をフラット化から、 `table` 要素の定義：

`<preventancestorflattening>true|false</preventancestorflattening>`

### AEM Site 出力で削除されたページのバージョン管理を設定します

を使用してAEM Site 出力を生成する場合 **およびを削除**&#x200B;作成&#x200B;****オプションが「既存の出力ページ」設定で選択されている場合、削除するページのバージョンが作成されます。 削除する前にバージョンの作成を停止するようにシステムを設定できます。

削除するページのバージョンの作成を停止するには、次の手順を実行します。

1. に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。
1. 設定ファイルで、次の\(property\) 詳細を指定して **削除されたページのバージョンを作成しない** オプション：

   | PID | プロパティキー | プロパティの値 |
   |---|------------|--------------|
   | `com.adobe.fmdita.confi g.ConfigManager` | `no.version.creation.on.deletion` | ブール値\(true/false\)。<br> **デフォルト値**: `true` |

   >[!NOTE]
   >
   > このオプションを選択すると、ユーザーはバージョンを作成せずに、任意のページを直接削除できます。 このオプションが選択されていない場合、ページが削除される前にバージョンが作成されます。


## DITA-OT を使用した出力の公開でのメタデータの使用 {#id191LF0U0TY4}

AEMガイドでは、DITA-OT を使用して出力を公開する際にカスタムメタデータを渡す方法を提供します。 管理者およびパブリッシャーは、次のタスクを実行して、公開された出力でカスタムメタデータを設定および使用する必要があります。

- 管理者は、必要なメタデータをシステムに追加して、DITA マップのプロパティページで使用できるようにします。

- 管理者は、DITA マップコンソールに表示されるように、カスタムメタデータをメタデータリストに追加します。

- パブリッシャーとして、DITA マップを使用してカスタムメタデータを設定および追加し、必要な出力を生成します。


必要なメタデータをシステムに追加するには、次の手順に従います。

1. 管理者としてAdobe Experience Managerにログインします。

1. 上部の「 Adobe Experience Manager 」リンクをクリックし、「 」を選択します。 **ツール**.

1. 選択 **Assets** を選択します。

1. をクリックします。 **メタデータスキーマ** タイル。

   メタデータスキーマフォームページが表示されます。

1. を選択します。 **デフォルト** フォームをリストから削除します。

   >[!NOTE]
   >
   > DITA マップのプロパティページに表示されるプロパティは、このフォームから取得されます。

1. クリック **編集**.

1. 公開した出力で使用するカスタムメタデータを追加します。 例えば、次の手順を使用してオーディエンスメタデータを追加します。

   1. 次の **フォームを作成** コンポーネントリスト、ドラッグ&amp;ドロップ **1 行のテキスト** コンポーネントをフォームに貼り付けます。

   2. 新しいフィールドを選択して、 **設定** 」と入力します。

   3. 内 **フィールドラベル**、メタデータ名として「オーディエンス」を入力します。

   4. 内 **プロパティにマッピング** を設定する際に、と指定します。/jcr:content/metadata/&lt;name of=&quot;&quot; the=&quot;&quot; metadata=&quot;&quot;>. この例では、をに設定します。/jcr:content/metadata/audience.

   これらの手順を使用して、必要なすべてのメタデータパラメーターを追加します。

1. 「**保存**」をクリックします。


すべての DITA マップのプロパティページに新しいパラメータが表示されるようになりました。

![](assets/properties-page-custom-metadata.PNG)

次に、DITA マップコンソールでカスタムメタデータを使用できるようにする必要があります。 DITA マップダッシュボードでカスタムメタデータを使用できるようにするには、次の手順を実行します。

1. パッケージマネージャーを使用して、Cloud Manager の Git リポジトリ内の次の場所にある metadataList ファイルにアクセスします。

   /libs/fmdita/config/metadataList

   >[!NOTE]
   >
   > metadataList ファイルには、 **プロパティ** マップダッシュボードの DITA マップのドロップダウンリスト デフォルトでは、このファイルには docstate、dc:language、dc:description、dc:title の 4 つのプロパティがリストされています。

1. メタデータスキーマFormsページに追加したカスタムメタデータを追加します。 この例では、デフォルトリストの末尾にオーディエンスパラメーターを追加します。


カスタムメタデータが DITA マップコンソールの **プロパティ** 」ドロップダウンリストから選択できます。

最後に、パブリッシャーは、公開済み出力にカスタムメタデータを含める必要があります。 出力の生成時にカスタムメタデータを処理するには、次の手順を実行します。

1. Assets UI で、公開する DITA マップに移動します。

1. DITA マップファイルを選択し、そのプロパティページを開きます。

1. プロパティページで、カスタムメタデータの値を指定します。 この例では、オーディエンスパラメーターに External という値を指定しています。

   ![](assets/properties-page-custom-metadata-value.png)

1. 「**保存して閉じる**」をクリックします。

1. DITA マップファイルをクリックして、DITA マップコンソールを開きます。

1. 内 **出力プリセット** 「 」タブで、出力の生成に使用する出力プリセットを選択します。

1. クリック **編集**.

1. 次の **プロパティ** ドロップダウンリストから、公開プロセスに渡すプロパティを選択します。

   ![](assets/props-in-publish-output.PNG)


選択したプロパティまたはメタデータが公開プロセスに渡され、最終的な出力で使用できるようになります。

### DITA-OT に渡されたメタデータを処理のために検証

DITA-OT に渡されるメタデータ値を検証するには、クラウド対応 JAR を使用したローカル環境を使用できます。 クラウド上のローカルファイルシステムにアクセスできないので、メタデータファイルを検証する方法は、cloud ready jar を使用する場合のみです。

- ファイル名：metadata.xml
- ファイルの場所：crx-quickstart/profiles/ditamaps/&lt;ditamap-1234>

  metadata.xml にアクセスするには：

   - AEMインスタンスが実行されているサーバーの場所にログインします。
   - crx-quickstart/profiles/ditamaps/に移行&lt;newly-created-directory-name>/metadata.xml.
- サンプルファイル形式：

  **metadata.xml**

  ```XML
  <?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <root>
     <Path id="/absolutePath/sampleMap.ditamap">
        <metadata>
           <meta isArray="false" key="dc:description">This is a file</meta>
           <meta isArray="false" key="dc:title">Myfile</meta>
           <meta isArray="true" key="multivalueText">One;Two;Three</meta>
        </metadata>
     </Path>
     <Path id="/absolutePath/sampleTopic.dita">
        <metadata>
           <meta isArray="false" key="dc:description">description for the accountability</meta>
           <meta isArray="false" key="dc:title">accountability title</meta>
           <meta isArray="true" key="multivalueText">value1</meta>
        </metadata>
     </Path>
  </root>
  ```


- isArray:メタデータが複数値\(Array\) であるかどうかを定義する Boolean 属性。 値はセミコロンで区切られます。
- パス ID :一時ディレクトリに保存されたファイルの絶対パス。

>[!NOTE]
>
> ファイルに特定のメタデータが存在しない場合は、 &lt;meta> タグにキーが含まれていても、metadata.xml ファイルではそのファイルのプロパティとして表示されません。

## AEMコンポーネントを使用した DITA 要素マッピングのカスタマイズ {#id1679J600HEL}

AEMガイド内の DITA 要素は、対応するAEMコンポーネントにマッピングされます。 AEMガイドは、公開やレビューなどのワークフローでこのマッピングを使用し、DITA 要素を対応するAEMコンポーネントに変換します。 マッピングは、 `elementmapping.xml` ファイルにアクセスします。このファイルには、パッケージマネージャーを使用してアクセスできます。

>[!NOTE]
>
> デフォルトの設定ファイルを ``libs`` ノード。 オーバーレイを作成するには、 ``libs`` ノードを ``apps`` ノードに追加し、 ``apps`` ノードのみ。

定義済みの DITA 要素のマッピングを使用するか、DITA 要素をカスタムAEMコンポーネントにマッピングできます。 カスタムAEMコンポーネントを使用するには、 `elementmapping.xml` ファイル。

### elementmapping.xml 構造

の概要 `elementmapping.xml` 構造については、以下で説明します。

1. 各 DITA 要素は、最初に、要素名に基づいて、対応するコンポーネントマッピングを検索します。 次に例を示します。

   ```XML
   <ditaelement>     
      <name>**substeps**</name>  
      <class>- topic/ol task/substeps</class>  
      <componentpath>dita/components/ditaolist</componentpath>  
      <type>COMPOSITE</type>  
      <target>para</target>
   </ditaelement>
   ```

   上記の例では、 `substeps` DITA 要素は、 `dita/components/ditaolist` コンポーネント。

1. DITA 要素が名前に基づいて一致を見つけられない場合、 `class` が完了しました。 次に例を示します。

   ```XML
   <ditaelement>  
      <name>topic</name>  
      <class>**- topic/topic**</class>  
      <componentpath>fmdita/components/dita/topic</componentpath>  
      <type>COMPOSITE</type>  
      <target>para</target>  
      <attributemap> 
         <attribute from="id" to="id" />  
      </attributemap>
   </ditaelement>
   ```

   上記の例で、 `task` 要素を選択し、 `task` 要素が上記のコンポーネントにマッピングされるのは、 `task` は、 `topic` コンポーネント。

1. 要素に対応するコンポーネントマッピングがある場合、その子要素のさらなる処理は `type`. 次に例を示します。

   ```XML
   <ditaelement>  
      <name>title</name>  
      <class>- topic/title</class>  
      <componentpath>foundation/components/title</componentpath>  
      <type>**STANDALONE**</type>  
      <target>para</target>  
      <textprop>jcr:title</textprop>
   </ditaelement>
   ```

   `type` は次の値を取ります。

   - 複合：要素とコンポーネント *子要素のマッピングは継続されます* 同様に。

   - スタンドアロン：現在の要素の子要素は *これ以上マッピングされません*.

   上記の例で、 `<title>` 要素に子要素があり、他のコンポーネントにマッピングされません。 のコンポーネント `<title>` 要素は、内のすべての子要素をレンダリングします。 `<title>` 要素。

1. 1 つの DITA 要素にマッピングされた複数のコンポーネントがある場合は、その要素に最も一致するコンポーネントが選択されます。 最適一致コンポーネントを選択するには、DITA 要素のドメインおよび構造の特殊化を考慮します。

   ドメイン特殊化を持つ DITA 要素が存在し、ドメインの特殊化に対してコンポーネントがマッピングされている場合、そのコンポーネントの優先度が高くなります。

   同様に、構造特殊化を持つ DITA 要素が存在し、コンポーネントが構造特殊化にマッピングされている場合は、そのコンポーネントの優先度が高くなります。

1. 以下を使用できます。 `<attributemap>` （要素マッピング）を使用して、属性値を対応するノードプロパティにマッピングします。
1. `textprop` を使用して、DITA 要素のテキストコンテンツをノードプロパティにシリアル化できます。 また、要素タグで複数回使用して、公開済み階層の複数の場所でテキストコンテンツをシリアル化できます。 また、ターゲットプロパティの場所と名前をカスタマイズすることもできます。 次に例を示します。

   ```XML
   <ditaelement>
      <name>title</name>
      <componentpath>foundation/components/title</componentpath>
      <type>STANDALONE</type>
      <target>para</target>
       <textprop>**jcr:title**</textprop>
   </ditaelement>
   ```

   上記の要素マッピングは、 `<title>` 要素は、 `jcr:title` を出力ノードに設定します。

1. `xmlprop` は、特定の要素の XML 全体をノードプロパティにシリアル化するために使用できます。 その後、コンポーネントはこのノードプロパティを読み取り、カスタムレンダリングを実行できます。 次に例を示します。

   ```XML
   <ditaelement>
       <name>svg-container</name>
      <class>+ topic/foreign svg-d/svg-container</class>
       <componentpath>fmdita/components/dita/svg</componentpath>
       <type>STANDALONE</type>
       <target>para</target>
      <xmlprop>**data**</xmlprop>
   </ditaelement>
   ```

   上記の要素のマッピングは、要素の XML マークアップ全体を指定します `<svg-container>` は、 `data` を出力ノードに設定します。

1. 出力生成プロセスでパスの解決を処理するための特別な属性マッピングがあります。 次に例を示します。

   ```XML
   <attributemap>
      <attribute from="href" to="fileReference" ispath="true" rel="source" />
      <attribute from="height" to="height" />
       <attribute from="width" to="width" />
   </attributemap>
   ```

   上記の `attributemap`、 `href` 属性が DITA 要素内の次の名前のノードプロパティにマッピングされます： `fileReference`. 今後 `ispath` が `true`出力生成プロセスはこのパスを解決し、次に `fileReference` ノードプロパティ。

   この解決方法は、 `rel` 属性のマッピングに含まれる属性。

   - If `rel=source`、の値 `href` は、現在処理中の DITA ソースファイルに関して解決されます。 の値 `href` が解決され、 `fileReference` プロパティ。

   - If `rel=target`、の値 `href` は、ルート公開の場所を基準に解決されます。 の値 `href` が解決され、 `fileReference` プロパティ。

   パス属性で前処理や解決をおこなわない場合は、 `ispath` 属性。 値はそのままコピーされ、コンポーネントは必要な解像度を実行できます。


### DITA 要素スキーマ

次に、 `elementmapping.xml` ファイル：

```XML
<ditaelement>        
    <name>element_name</name>    
    <class>element_class</class>    
    <componentpath>fmdita/components/dita/component_name</componentpath>    
    <type>COMPOSITE|STANDALONE</type>     
    <attributeprop>propname_a</attributeprop>      
    <textprop>propname_t</textprop>    
    <xmlprop>propname_x</xmlprop>     
    <xpath>xpath expression string</xpath>     
    <target>head|para</target>     
    <wrapelement>div</wrapelement>     
    <wrapclass>class_name</wrapclass>     
    <attributemap>         
        <attribute from="attrname"         to="propname"         ispath="true|false"         rel="source|target" />    
    </attributemap>    
    <skip>true|false</skip> 
</ditaelement>
```

次の表に、DITA 要素スキーマの要素を示します。

| 要素 | 説明 |
|-------|-----------|
| `<ditaelement>` | 各マッピング要素の最上位ノード。 |
| `<class>` | コンポーネントを書き込むターゲット DITA 要素の class 属性。<br> 例えば、DITA トピックの class 属性は次のようになります。 <br> `- topic/topic` |
| `<componentpath>` | マッピングされたAEMコンポーネントの CRXDE パス。 |
| `<type>` | 可能な値：<br> -   **複合**:子要素も処理します <br> -   **スタンドアロン**:子要素の処理をスキップします |
| `<attributeprop>` | シリアル化された DITA 属性および値をプロパティとしてAEMノードにマッピングするために使用されます。 例えば、 `<note type="Caution">` 要素と、この要素にマッピングされるコンポーネントには、 `<attributeprop>attr_t</ attributeprop>`に値がセットされた場合、ノードの属性と値は `attr_t` 対応するAEMノードのプロパティ\( `attr_t->type="caution"`\) です。 |
| `<textprop>propname_t</textprop>` | 保存する `getTextContent()` 次で定義されたプロパティに出力 `propname_t.` <br> **注意：** これは最適化されたプロパティです。 |
| `<xmlprop>propname_x </xmlprop>` | このノードのシリアル化された XML を、 `propname_x.<br> `**注意：** これは最適化されたプロパティです。 |
| `<xpath>` | 要素マッピングに XPath 要素が指定されている場合は、要素名とクラスともに XPath 条件も満たされ、コンポーネントマッピングが使用されます。 |
| `<target>` | DITA 要素の場所を指定した場所に配置します。<br> 可能な値： <br> - **head**:head ノードの下 <br> - **テキスト**:段落ノードの下 |
| `<wrapelement>` | コンテンツを折り返すHTML要素。 |
| `<wrapclass>` | プロパティの要素の値 `wrapclass.` |
| `<attributemap>` | 1 つ以上の `<attribute>` ノード。 |
| `<attribute from="attrname" to="propname" ispath="true|false" rel="source|target" />` | DITA 属性をAEMプロパティにマッピングします。 <br> -   **`from`**:DITA 属性名 <br> -   **`to`**:AEMコンポーネントのプロパティ名 <br> -   **`ispath`**:属性がパス値\( 例： *画像*\) <br> -   **`rel`**:パスがソースまたはターゲットの場合 <br> **注意：** If `attrname` 次で始まる `%`，次にマップ `attrname minus '%'` 「 」を prop に設定 `propname`&#39;. |

**追加情報**

- デフォルトの要素マッピングを上書きする予定がある場合は、デフォルトで変更を加えないことをお勧めします。 `elementmapping.xml` ファイル。 新しいマッピング XML ファイルを作成し、作成する別の場所（できれば作成するカスタムアプリフォルダー内）にファイルを配置する必要があります。

- 内 `elementmapping.xml` ファイル内には、fmdita/components/dita/wrapper コンポーネントを参照するマッピングエントリが多数あります。 ラッパーは、サイトノードのプロパティを使用して比較的シンプルな DITA 構成をレンダリングし、関連するHTMLを生成する汎用コンポーネントです。 使用する `wrapelement` プロパティを使用して、含まれるタグを生成し、子レンダリングを対応するコンポーネントに委任します。 これは、コンテナコンポーネントのみが必要な場合に便利です。 のような特定のコンテナタグをレンダリングする新しいコンポーネントを作成する代わりに、 `div` または `p`を使用する場合、Wrapper コンポーネントを `wrapelement` および `wrapclass` プロパティを使用して同じ効果を得ることができます。

- String JCR プロパティに大量のテキストを保存することはお勧めしません。 出力生成で最適化されたプロパティタイプの計算を使用すると、大きなテキストコンテンツが文字列タイプとして保存されなくなります。 代わりに、特定のしきい値を超えるコンテンツを保存する必要がある場合、プロパティのタイプはバイナリに変更されます。 デフォルトでは、このしきい値は 512 バイトに設定されていますが、Configuration Manager で変更できます\(*com.adobe.fmdita.config.ConfigManager*\) **バイナリしきい値として保存** 設定。

- 要素マッピングの一部の\（すべてではなく）を上書きする場合は、 `elementmapping.xml` ファイル。 新しい XML マッピングファイルを作成し、上書きする要素のみを定義する必要があります。

- カスタムの場所に XML ファイルを作成した後、 `Override Element Mapping` 設定 `com.adobe.fmdita.config.ConfigManager` バンドル。


## DITA マップコンソールのカスタマイズ {#id188HC08M0CZ}

AEMガイドを使用すると、DITA マップコンソールの機能を柔軟に拡張できます。 例えば、AEMガイドで使用可能なレポートとは異なる一連のレポートがある場合、そのようなレポートをマップコンソールに追加できます。 マップコンソールをカスタマイズするには、必要な機能を実行するコードを含むAEMクライアントライブラリ（または ClientLib）を作成する必要があります。

>[!NOTE]
>
> 製品の新しいリリースで上書きされるので、ページコンポーネントに直接変更することはお勧めしません。

AEMガイドでは、 `apps.fmdita.dashboard-extn` マップコンソールをカスタマイズするためのカテゴリ。 マップコンソールが読み込まれるたびに、 `apps.fmdita.dashboard-extn` カテゴリが実行され、読み込まれます。

>[!NOTE]
>
> AEMクライアントライブラリの作成について詳しくは、 [クライアント側ライブラリの使用](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/developing/full-stack/clientlibs.html?lang=ja).

## 出力生成時に画像レンディションを処理 {#id177BF0G0VY4}

AEMには、アセットを処理するためのデフォルトのワークフローとメディアハンドルのセットが付属しています。 AEMには、最も一般的な MIME タイプのアセット処理を処理するための事前定義済みのワークフローがあります。 通常、AEMは、アップロードするすべての画像に対して、同じレンディションをバイナリ形式で複数作成します。 これらのレンディションは、サイズ、解像度、透かしの追加、その他の変更された特性を持つレンディションです。 AEMでのアセットの処理方法について詳しくは、 [メディアハンドラーとワークフローを使用したアセットの処理](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/asset-microservices-overview.html?lang=ja) (AEMドキュメント )

AEMガイドを使用すると、ドキュメントの出力を生成する際に使用する画像レンディションを設定できます。 例えば、デフォルトの画像レンディションの 1 つを選択するか、作成して同じレンディションを使用してドキュメントを公開することができます。 ドキュメントを公開するための画像レンディションマッピングは、 `/libs/fmdita/config/ **renditionmap.xml**` ファイル。 のスニペット `renditionmap.xml` ファイルの内容は次のとおりです。

>[!NOTE]
>
> この場合、 `renditionmap.xml` ファイルを `apps` すべてのカスタマイズ用フォルダー。

```XML
<renditionmap>
   <mapelement>
      <mimetype>image/png</mimetype>
      <rendition output="AEMSITE">cq5dam.web.1280.1280.jpeg</rendition>
      <rendition output="PDF">original</rendition>
      <rendition output="HTML5">cq5dam.web.1280.1280.jpeg</rendition>
      <rendition output="EPUB">cq5dam.web.1280.1280.jpeg</rendition>
      <rendition output="CUSTOM">cq5dam.web.1280.1280.jpeg</rendition>
   </mapelement>
...
</renditionmap>
```

この `mimetype` element は、ファイル形式の MIME タイプを指定します。 この `rendition output` element 出力形式のタイプとレンディション名を指定します\( 例： `cq5dam.web.1280.1280.jpeg`\) 指定した出力の公開に使用する必要がある。 サポートされるすべての出力形式 (AEMSITE、PDF、HTML5、EPUB、カスタム ) で使用する画像レンディションを指定できます。

指定したレンディションが存在しない場合、AEM Guides の公開プロセスはまず、指定された画像の Web レンディションを探します。 Web レンディションが見つからない場合は、画像の元のレンディションが使用されます。

>[!NOTE]
>
> これらの画像レンディションは、出力の生成のみを制御します。 画像の Web レンディションは、プレビューまたはレビュー用にドキュメントを開くときに使用されます。

## 出力履歴の自動パージ期間の設定 {#id19AAI070V8Q}

出力を生成すると、出力ログと共に出力が作成されます。 大きな DITA マップの場合、これらのログはリポジトリ内の大量のスペースを取る場合があります。 デフォルトでは、ログはリポジトリ内の次の場所に保存されます。

`/var/dxml/metadata/outputHistory`

ある期間、すべてのログファイルの総サイズが GB になる可能性がありました。 AEMガイドでは、これらのログファイルをリポジトリに保持する期間を設定できます。 指定した期間が過ぎると、出力生成履歴と共にログがリポジトリから削除されます。

>[!NOTE]
>
> 出力生成履歴は、「出力」タブの「生成された出力」リストのログエントリです。

履歴のパージ機能を設定すると、リポジトリ内のすべての DITA マップの出力生成に影響します。 DITA マップの「出力」タブでは、指定した日数の経過後、設定で指定した時刻に履歴がパージされます。

>[!NOTE]
>
> ログファイルと出力生成履歴を削除しても、生成される出力には影響しません。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）詳細を指定して、出力履歴とログをパージする日時を設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `output.history.purgeperiod` | 出力ログと共に出力履歴がパージされるまでの日数を指定します。 この機能を無効にする場合は、指定した時間にこのプロパティを 0.Everyday に設定します。このプロパティで指定した日数より前に生成された出力に対して、パージプロセスが実行されます。 <br> **デフォルト値**:5 |
| `output.history.purgetime` | パージ処理が開始される時間を指定します。 <br> **デフォルト値**:0:00 \（または 12:00 midnight\） |

## 最近生成した出力リストの制限を変更 {#id1679JH0H0O2}

DITA マップの「出力」タブに表示される、生成された出力の最大数を変更できます。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) 設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）詳細を指定して、リストに表示する出力の数を変更します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `output.historylimit` | 整数値。<br> **デフォルト値**:25 |

>[!TIP]
>
> 詳しくは、 *出力履歴* 出力履歴の操作に関するベストプラクティスについては、ベストプラクティスガイドの節を参照してください。

