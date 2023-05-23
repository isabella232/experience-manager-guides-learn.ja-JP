---
title: 出力生成設定の指定
description: 出力生成設定の設定方法を説明します
source-git-commit: 5ac066bb8db32944abd046f64da11eeb1bdbe467
workflow-type: tm+mt
source-wordcount: '5761'
ht-degree: 1%

---

# 出力生成設定の指定 {#id181AI0B0E30}

AEMガイドには、出力生成プロセスをカスタマイズするための多くの設定オプションが付属しています。 このトピックでは、出力生成プロセスの設定に役立つすべての設定とカスタマイズについて説明します。

## DITA マップダッシュボードの「ベースライン」タブを設定します。 {#id223MD0D0YRM}

マップダッシュボードで使用できる「ベースライン」タブを設定および非表示にすることができます。

この **ベースラインタブを非表示** このオプションはデフォルトでは有効になっていないので、configMgr から有効にする必要があります。 Web エディターでデフォルトでこのオプションを有効にするには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. を選択します。 **ベースラインタブを非表示** オプション。

1. 「**保存**」をクリックします。

   >[!NOTE]
   >
   > この設定はデフォルトで無効になっており、マップダッシュボードで「ベースライン」タブを使用できます。


## FrameMaker Publishing Server を設定 {#id1678G0Z0TN6}

FrameMaker Publishing Server \(FMPS\) を使用して、DITA コンテンツの出力を生成できます。 FMPS を設定すると、FMPS でサポートされる複数の形式で出力を生成できます。

>[!NOTE]
>
> FMPS を使用して出力を生成するには、FMPS サーバーを設定する必要があります。 インストールと設定の詳細については、『FrameMaker Publishing Server ユーザガイド』を参照してください。

FMPS を使用するようにAEMガイドを設定するには、 `com.adobe.fmdita.config.ConfigManager` バンドルを Web コンソールに追加します。

>[!NOTE]
>
> http://にアクセス&lt;server name=&quot;&quot;>:&lt;port>/system/console/configMgr Web コンソールを開くための URL です。

| プロパティ | 説明 |
|--------|-----------|
| FrameMaker Publishing Server ログインドメイン | FrameMaker Publishing Server がホストされているドメイン名またはワークグループ名を指定します。 FMPS バージョンに基づいて、ドメイン名を次のように指定します。   **FMPS 2020**:192.168.1.101 という IP アドレス <br>- **FMPS 2019 以前**:IP アドレスまたはドメイン名 |
| FrameMaker Publishing Server URL | FrameMaker Publishing Server の URL を指定します。 FMPS バージョンに基づいて、FMPS URL を次のように指定します。<br>- **FMPS 2020**: `http://<fmps_ip>:<port>` \(http://192.168.1.101:7000\) <br> - **FMPS 2019 以前**: `http://<fmps_ip>:<port>/fmserver/v1/` |
| FMPS バージョン | FrameMaker Publishing Server のバージョン番号を指定します。 FMPS バージョンに基づいて、バージョン情報を次のように指定します。 <br>- **FMPS 2020**:2020 年 <br> - **FMPS 2019 以前**:2019 年または 2017 年 |
| FrameMaker Publishing Server のユーザ名とパスワード | FrameMaker Publishing Server にアクセスするためのユーザー名とパスワードを指定します。 |
| FMPS タイムアウト | \(*オプション*\) AEMガイドが FrameMaker Publishing Server からの応答を待機する時間（秒）を指定します。 指定された時間内に受け取った応答がない場合、AEM Guides は公開タスクを終了し、タスクに失敗というフラグを設定します。 <br> デフォルト値：300 秒\（5 分\） |
| 外部AEM URL | *\（オプション\）* FrameMaker Publishing Server が生成された出力ファイルを配置するAEM URL。 例：`http://<server-name>:<port>/` |
| AEM管理者のユーザー名とパスワード | *\（オプション\）* AEM設定の管理者のユーザー名とパスワード。 これは、AEMとの通信に FrameMaker Publishing Server で使用されます。 |
| FMPS タスク実行待ちタイムアウト | この設定は、FMPS 2020 にのみ適用されます。 FMPS がこのプロセスの実行を待機して停止する時間（秒）を指定します。 |

## 既存のAEM Site 内でのブレンド公開の設定 {#id1691I0V0MGR}

DITA コンテンツを含むAEMサイトがある場合は、DITA コンテンツをサイト内の事前定義された場所に公開するようにAEM Site の出力を設定できます。 例えば、AEM Site ページの次のスクリーンショットでは、 `ditacontent` ノードは DITA コンテンツの格納用に予約されています。

![](assets/publish-in-aem-site.png){width="300" align="left"}

ページに残っているノードは、AEM Site Editor から直接作成します。 DITA コンテンツを事前定義の場所に公開するように公開設定を指定すると、AEM Guides の公開プロセスで、既存の DITA 以外のコンテンツが変更されなくなります。

事前定義されたノードに DITA コンテンツを公開できるようにするには、既存のサイトで次の設定を実行する必要があります。

- サイトのテンプレートプロパティを設定する

- サイトにノードを追加して DITA コンテンツを公開します


次の手順を実行して、既存のサイトのテンプレートプロパティを設定します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. サイトのテンプレート設定ノードに移動します。 例えば、AEMガイドでは、次のノードにデフォルトのテンプレート設定が格納されます。

   `/libs/fmdita/config/templates/default`

   >[!NOTE]
   >
   > デフォルトの設定ファイルを `libs` ノード。 オーバーレイを作成するには、 `libs` ノードを `apps` ノードに追加し、 `apps` ノードのみ。

1. 以下のプロパティを追加します。

   | プロパティ名 | タイプ | 値 |
   |-------------|----|-----|
   | `topicContentNode` | 文字列 | DITA コンテンツを公開するノード名を指定します。 例えば、AEMガイドが DITA コンテンツを公開するデフォルトのノードは次のようになります。 <br>`jcr:content/contentnode` |
   | `topicHeadNode` | 文字列 | DITA コンテンツのメタデータ情報を格納するノード名を指定します。 例えば、AEMガイドにメタデータ情報が格納されるデフォルトのノードは次のようになります。 <br>`jcr:content/headnode` |


次のスクリーンショットは、AEM Guides のデフォルトのテンプレートノードに追加されたプロパティを示しています。

![](assets/add-content-node.png){width="800" align="left"}

次回、サイトのテンプレート設定を使用して DITA コンテンツを公開する際に、そのコンテンツが `topicContentNode` および `topicHeadNode` プロパティ。

ただし、既存のサイトの場合は、手動で `topicContentNode` および `topicHeadNode` ノード。

次の手順を実行して、必要なノードを既存のサイトに追加します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 場所 `jcr:content` をサイトノード内に追加します。

1. 追加 `topicContentNode` および `topicHeadNode` サイトのテンプレート設定で指定したのと同じ名前のノード。


## AEM Site 出力のカスタマイズ {#id166TG0B30WR}

AEMガイドは、次の形式での出力の作成をサポートしています。

- AEM Site

- PDF

- HTML 5
- EPUB
- DITA-OT によるカスタム出力

AEM Site の出力に対して、出力タスクごとに異なるデザインテンプレートを割り当てることができます。 これらのデザインテンプレートは、異なるレイアウトで DITA コンテンツをレンダリングできます。 例えば、内部オーディエンスと外部オーディエンスに異なるデザインテンプレートを指定できます。

また、AEMガイド付きのカスタマイズ DITA Open Toolkit \(DITA-OT\) プラグインを使用することもできます。 これらのカスタム DITA-OT プラグインをアップロードして、特定の方法でPDF出力を生成できます。

>[!TIP]
>
> 詳しくは、 *AEM Site Publishing* の節（ベストプラクティスガイド）[appendix.md\#](appendix.md#) AEM Site 出力の作成に関するベストプラクティスを参照してください。

### 出力を生成するためのデザインテンプレートのカスタマイズ {#customize_xml-add-on}

AEMガイドでは、事前に定義された一連のデザインテンプレートを使用して、AEM Site 出力を生成します。 AEMガイドのデザインテンプレートをカスタマイズして、企業のブランディングに合った出力を生成できます。 デザインテンプレートは、各種スタイル\(CSS\)、スクリプト\（サーバー側とクライアント側の両方\）、リソース\（画像、ロゴ、その他のアセット\）、および JCR ノードの集まりで、これらすべてのリソースを結び付けます。 デザインテンプレートは、JCR ノードの数個だけを含む単一のサーバーサイドスクリプトと同じくらい簡単なものでも、スタイル、リソース、JCR ノードの複雑な組み合わせでも構いません。 デザインテンプレートは、AEM Site 出力を生成する際にAEM Guides の公開サブシステムで使用され、生成された出力の構造、ルックアンドフィールを制御します。

デザインテンプレートリソースをサーバー上のどこに配置するかに制限はありませんが、通常は、関数に従って論理的に整理されます。 例えば、デフォルトのテンプレートには、すべての JavaScript ファイルと CSS ファイルが格納されています。 `/etc/designs/fmdita/clientlibs/siteoutput/default` フォルダー。 これらのファイルが配置されている場所は、JCR ノードのコレクションで相互にリンクされます。 これらの JCR ノードとファイルが共に、デザインテンプレート全体を構成します。

AEMガイドに付属しているデフォルトのデザインテンプレートを使用すると、ランディング、トピック、検索ページのコンポーネントをカスタマイズできます。 デフォルトのデザインと対応する参照テンプレートのコピーを作成し、必要な出力を生成するために、様々なコンポーネントを指定できます。

次の手順を実行して、AEM Site の出力生成に使用する独自のデザインテンプレートを指定します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. デフォルトのデザインテンプレートノードに移動します。 デフォルトのデザインテンプレートノードの場所は次のとおりです。

   `/libs/fmdita/config/templates/`

   ![](assets/templates-node.png){width="300" align="left"}

   >[!NOTE]
   >
   > デフォルトのデザインテンプレートのコピーを `libs` フォルダーを `apps` フォルダーを作成し、 `apps` フォルダー。 また、デフォルトのテンプレートノードから参照されるテンプレートを変更する必要があります。 参照されるテンプレートは、の下に配置されます。 `/libs/fmdita/templates/default/cqtemplates` ノード。 参照先のテンプレートを `apps` フォルダーに保存しておく必要があります。

1. 次をクリック： *デフォルト* コンポーネント *テンプレート* ノードを使用して、そのプロパティにアクセスします。

   次の表に、AEM Guides のデザインテンプレートのプロパティについて説明します。

   | プロパティ | 説明 |
   |--------|-----------|
   | `landingPageTemplate`、`searchPageTemplate`、`topicPageTemplate`、`shadowPageTemplate` | 次を指定： `cq:Template` ノードを使用して、これらの対応するページ（landing、search および topic）を検索できます。 デフォルトでは、 `cq:Template` ノードは、 `/libs/fmdita/templates/default/cqtemplates` ノード。 このノードは、ランディングページ、検索ページ、トピックページの構造とプロパティを定義します。 <br>この `shadowPageTemplate` を使用して、まとまったコンテンツを最適化します。 このプロパティの値を次の値に設定する必要があります。 <br> `fmdita/templates/default/cqtemplates/shadowpage` <br> **注意** 次の項目の値を指定する必要があります： `topicPageTemplate`. この `landingPageTemplate` および `searchPageTemplate` はオプションのプロパティです。 検索およびランディングページを生成しない場合は、これらのプロパティを指定しないでください。 |
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

詳しくは、 [最初のAdobe Experience Manager 6.3 Web サイトの作成](https://helpx.adobe.com/experience-manager/using/first_aem63_website.html) および [基本](https://helpx.adobe.com/jp/experience-manager/6-3/sites/developing/using/the-basics.html) AEM上で独自の web サイトを開発する

### ドキュメントタイトルを使用してAEMサイト出力を生成

AEM Site 出力を生成する際、URL の生成方法は、コンテンツの検出性に重要な役割を果たします。 UUID ベースのファイル名を使用している場合、ファイルの UUID に基づいて URL を生成しても、検索でわかりにくくなります。 管理者または発行者は、AEM Site 出力の URL を生成する方法を制御できます。 AEMガイドでは、AEMサイト出力の URL を生成する際に、UUID ベースのファイル名ではなく、ファイルのタイトルを使用して設定できます。 UUID ベースのファイルシステムの場合、デフォルトでは、このオプションはオンになっています。 これは、UUID ベースのファイルシステム用にAEM Site 出力を生成する場合、ファイルの UUID ではなく、ファイルのタイトルが URL の生成に使用されることを意味しています。

AEM Site 出力を生成する際、URL の生成方法は、コンテンツの検出性に重要な役割を果たします。 非 UUID ベースのファイルシステムの場合、AEM Site の出力は、ファイルのタイトルではなくファイル名を使用して生成されます。 管理者または発行者は、AEM Site 出力の URL を生成する方法を制御できます。 AEMガイドでは、ファイル名ではなくファイルのタイトルを使用してAEM Site 出力の URL を生成する設定を提供します。 デフォルトでは、このオプションはオフになっています。 これは、AEM Site 出力を生成する際に、ファイル名が URL の生成に使用され、ファイルのタイトルは生成されないことを意味しています。 このオプションを有効にすると、ファイルのタイトルに基づいて URL を生成することを選択できます。

>[!NOTE]
>
> さらに、AEM Site 出力の URL 内に一連の文字のみを許可するようにルールを設定することもできます。 詳しくは、 [トピックを作成し、AEM Site 出力を公開するためのファイル名のサニタイズルールを設定する](#id2164D0KD0XA).

AEM Site の出力で URL の生成を設定するには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. を選択します。 **AEMサイトのページ名にタイトルを使用** オプション。

   >[!NOTE]
   >
   > ファイル名を使用して出力を生成する場合は、このオプションの選択を解除します。

1. 「**保存**」をクリックします。


### トピックを作成し、AEM Site 出力を公開するためのファイル名のサニタイズルールを設定する {#id2164D0KD0XA}

管理者は、ファイル名で使用できる有効な特殊文字のリストを定義でき、最終的にAEM Site 出力の URL を形成します。 以前のリリースでは、ユーザーは、次のような特殊文字を含むファイル名を定義できました。 `@`, `$`, `>`など。 これらの特殊文字を使用すると、AEM Site ページの生成時に URL がエンコードされていました。

3.8 リリースより、ファイル名で許可される特殊文字のリストを定義する設定が追加されました。 デフォルトでは、有効なファイル名設定に「`a-z A-Z 0-9 - _`&quot;. つまり、ファイルを作成する際に、ファイルのタイトルに任意の特殊文字を含めることができますが、内部的にはハイフン\(`-`\) をファイル名に含めます。 例えば、ファイルのタイトルを Introduction 1 またはIntroduction@1と指定できます。これらの場合、対応するファイル名は Introduction-1 となります。

有効な文字のリストを定義する場合は、「`*/:[\]|#%{}?&<>"/+`&quot;および&quot; `a space` は常にハイフン\(`-`\) です。

>[!NOTE]
>
> 有効な特殊文字のリストを設定しないと、ファイルの作成プロセスで予期しない結果が生じる場合があります。

ファイル名およびAEM Site 出力で有効な特殊文字を設定するには、次の手順に従います。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 *com.adobe.fmdita.common.SanitizeNodeNameImpl* バンドル。

1. 内 **AEM Sitesに公開するための禁止文字セット** プロパティの場合、プロパティが ```'<>`@$```. このリストに特殊文字を追加できますが、これらの特殊文字が必要です。

   >[!NOTE]
   >
   > また、 **小文字を使用** ファイル名で **区切り文字** 無効な文字を処理するには、 **最大文字数** ファイル名で許可されています。

1. 「**保存**」をクリックします。

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. 内 **有効な文字の正規表現** プロパティの場合、プロパティが `[-a-zA-Z0-9_]`. このリストにはさらに文字を追加できますが、このリストにはこれらの基本的な文字が含まれ、リストはハイフン\(`-`\) です。

   >[!NOTE]
   >
   > このプロパティは、新しいファイルの作成に使用される有効な文字のリストを定義します。

1. 「**保存**」をクリックします。


### AEM Site ノード構造の統合を設定

AEM Site 出力を生成すると、トピック内のすべての要素のノードが内部的に作成されます。 何千ものトピックを含む DITA マップの場合、このノード構造が深すぎる可能性があります。 このタイプの深くネストされたノード構造は、大規模なサイトでパフォーマンスの問題を引き起こす可能性があります。 次のスナップショットは、AEM Site 出力用に深くネストされたノード構造を示しています。

![](assets/deep-nested-aem-site-node-structure.png){width="300" align="left"}

上記のスナップショットでは、 `p` 要素とその後続のサブ要素、および同様の構造が、トピックで使用される他のすべての要素に対して作成されます。

AEMガイドを使用すると、AEM Site 出力のノード構造を内部で作成する方法を設定できます。 指定した要素でノード構造を統合できます。つまり、メイン要素と見なされる要素を定義し、その中のすべてのサブ要素をメイン要素と結合できます。 例えば、 `p` 要素を選択し、その中に現れる任意の要素を `p` 要素がメインと結合されます `p` 要素。 内のサブ要素に対して別のメモは作成されません。 `p` 要素。 次のスナップショットは、フラット化されたノード構造を示しています： `p` 要素：

![](assets/flattened-aem-site-node-structure.png){width="300" align="left"}

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

1. configMgr で、サイトノードのフラット化設定を有効にします。

   1. Adobe Experience Manager Web コンソール設定ページを開きます。

      設定ページにアクセスするデフォルトの URL は次のとおりです。

      ```http
      http://<server name>:<port>/system/console/configMgr
      ```

   1. を検索して、 *com.adobe.dxml.flattening.FlatteningConfigurationService* バンドル。

   1. を選択します。 **プロパティ flattening.enabled** オプション。

   1. 「**保存**」をクリックします。


>[!IMPORTANT]
>
> elementmapping.xml ファイルに変更を加えた場合は、configMgr を開き、変更を反映するためのバンドルを保存します。

これで、AEM Site の出力を生成する際に、 `p` 要素が統合され、 `p` 要素自体。 新しい統合プロパティは、 `p` 要素を作成します。

![](assets/flatten-aem-site-note-props-crxde.png){width="650" align="left"}

**AEM Site のメモ構造のフラット化を防ぐ**

AEM Site の出力で統合するノードを指定する場合と同様に、この設定から除外する要素を指定することもできます。 例えば、 `body` 要素が必要ですが、 `table` 内の要素 `body` を統合する場合、「次を除外する」プロパティを `table` 要素の定義。

を除外するには、 `table` 要素をフラット化から、 `table` 要素の定義：

`<preventancestorflattening>true|false</preventancestorflattening>`

### AEM Site 出力で削除されたページのバージョン管理を設定します

を使用してAEM Site 出力を生成する場合 **およびを削除**&#x200B;作成&#x200B;****オプションが「既存の出力ページ」設定で選択されている場合、削除するページのバージョンが作成されます。 削除する前にバージョンの作成を停止するようにシステムを設定できます。

削除するページのバージョンの作成を停止するには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 *com.adobe.fmdita.config.ConfigManager* バンドル。

1. 選択&#x200B;**削除されたページのバージョンを作成しない** オプション。

   >[!NOTE]
   >
   > このオプションを選択すると、ユーザーはバージョンを作成せずに、任意のページを直接削除できます。 このオプションが選択されていない場合、ページが削除される前にバージョンが作成されます。

1. 「**保存**」をクリックします。

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

   1. 新しいフィールドを選択して、 **設定** 」と入力します。

   1. 内 **フィールドラベル**、メタデータ名として「オーディエンス」を入力します。

   1. 内 **プロパティにマッピング** を設定する際に、と指定します。/jcr:content/metadata/&lt;name of=&quot;&quot; the=&quot;&quot; metadata=&quot;&quot;>. この例では、をに設定します。/jcr:content/metadata/audience.

   これらの手順を使用して、必要なすべてのメタデータパラメーターを追加します。

1. 「**保存**」をクリックします。


すべての DITA マップのプロパティページに新しいパラメータが表示されるようになりました。

![](assets/properties-page-custom-metadata.PNG){width="650" align="left"}

次に、DITA マップコンソールでカスタムメタデータを使用できるようにする必要があります。 DITA マップダッシュボードでカスタムメタデータを使用できるようにするには、次の手順を実行します。

1. AEMにログインし、CRXDE Liteモードを開きます。

1. 次の場所にある metadataList ファイルにアクセスします。

   /libs/fmdita/config/metadataList

   >[!NOTE]
   >
   > metadataList ファイルには、 **プロパティ** マップダッシュボードの DITA マップのドロップダウンリスト デフォルトでは、このファイルには docstate、dc:language、dc:description、dc:title の 4 つのプロパティがリストされています。

1. メタデータスキーマFormsページに追加したカスタムメタデータを追加します。 この例では、デフォルトリストの末尾にオーディエンスパラメーターを追加します。

1. 「**すべて保存**」をクリックします。


カスタムメタデータが DITA マップコンソールの **プロパティ** 」ドロップダウンリストから選択できます。

最後に、パブリッシャーは、公開済み出力にカスタムメタデータを含める必要があります。 出力の生成時にカスタムメタデータを処理するには、次の手順を実行します。

1. Assets UI で、公開する DITA マップに移動します。

1. DITA マップファイルを選択し、そのプロパティページを開きます。

1. プロパティページで、カスタムメタデータの値を指定します。 この例では、オーディエンスパラメーターに External という値を指定しています。

   ![](assets/properties-page-custom-metadata-value.png){width="650" align="left"}

1. 「**保存して閉じる**」をクリックします。

1. DITA マップファイルをクリックして、DITA マップコンソールを開きます。

1. 内 **出力プリセット** 「 」タブで、出力の生成に使用する出力プリセットを選択します。

1. クリック **編集**.

1. 次の **プロパティ** ドロップダウンリストから、公開プロセスに渡すプロパティを選択します。

   ![](assets/props-in-publish-output.PNG){width="650" align="left"}


選択したプロパティまたはメタデータが公開プロセスに渡され、最終的な出力で使用できるようになります。

## AEMコンポーネントを使用した DITA 要素マッピングのカスタマイズ {#id1679J600HEL}

AEMガイドの DITA 要素は、対応するAEMコンポーネントにマッピングされます。 AEMガイドは、公開やレビューなどのワークフローでこのマッピングを使用し、DITA 要素を対応するAEMコンポーネントに変換します。 マッピングは、 `elementmapping.xml` ファイルに含まれます。このファイルには、CRXDE Lite・モードからアクセスできます。 CRXDE Liteモードで次の URL にアクセスします。

`/libs/fmdita/config/elementmapping.xml`

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
       <class>- topic/title</class> 
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
    <attribute from="attrname" to="propname" ispath="true|false" rel="source|target" />     
    </attributemap>     
    <skip>true|false</skip> 
</ditaelement>
```

次の表に、DITA 要素スキーマの要素を示します。

| 要素 | 説明 |
|-------|-----------|
| `<ditaelement>` | 各マッピング要素の最上位ノード。 |
| `<class>` | コンポーネントを書き込むターゲット DITA 要素の class 属性。 <br>例えば、DITA トピックの class 属性は次のようになります。 <br>`topic/topic` |
| `<componentpath>` | マッピングされたAEMコンポーネントの CRXDE パス。 |
| `<type>` | 可能な値： <br>- **複合**:子要素も処理します <br>- **スタンドアロン**:子要素の処理をスキップします |
| `<attributeprop>` | シリアル化された DITA 属性および値をプロパティとしてAEMノードにマッピングするために使用されます。 例えば、 `<note type="Caution">` 要素と、この要素にマッピングされるコンポーネントには、 `<attributeprop>attr_t</ attributeprop>`に値がセットされた場合、ノードの属性と値は `attr_t` 対応するAEMノードのプロパティ\( `attr_t->type="caution"`\) です。 |
| `<textprop>propname_t</textprop>` | 保存する `getTextContent()` 次で定義されたプロパティに出力 `propname_t.` **注意：**  これは最適化されたプロパティです。 |
| `<xmlprop>propname_x </xmlprop>` | このノードのシリアル化された XML を、 `propname_x.` **注意：** これは最適化されたプロパティです。 |
| `<xpath>` | 要素マッピングに XPath 要素が指定されている場合は、要素名とクラスともに XPath 条件も満たされ、コンポーネントマッピングが使用されます。 |
| `<target>` | DITA 要素の場所を指定した場所に配置します。 <br>可能な値：<br>- **head**:head ノードの下 <br>- **テキスト**:段落ノードの下 |
| `<wrapelement>` | コンテンツを折り返すHTML要素。 |
| `<wrapclass>` | プロパティの要素の値 `wrapclass.` |
| `<attributemap>` | 1 つ以上の `<attribute>` ノード。 |
| `<attribute from="attrname" to="propname" ispath="true|false" rel="source|target" />` | DITA 属性をAEMプロパティにマッピングします。<br>- **`from`**:DITA 属性名<br>- **`to`**:AEMコンポーネントのプロパティ名 <br>- **`ispath`**:属性がパス値\( 例： *画像*\)<br>- **`rel`**:パスがソースまたはターゲットの場合 <br>**注意：** If `attrname` 次で始まる `%`，次にマップ `attrname minus '%'` 「 」を prop に設定 `propname`&#39;. |

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
> AEMクライアントライブラリの作成について詳しくは、 [クライアント側ライブラリの使用](https://helpx.adobe.com/jp/experience-manager/6-4/sites/developing/using/clientlibs.html).

## 出力生成時に画像レンディションを処理 {#id177BF0G0VY4}

AEMには、アセットを処理するためのデフォルトのワークフローとメディアハンドルのセットが付属しています。 AEMには、最も一般的な MIME タイプのアセット処理を処理するための事前定義済みのワークフローがあります。 通常、AEMは、アップロードするすべての画像に対して、同じレンディションをバイナリ形式で複数作成します。 これらのレンディションは、サイズ、解像度、透かしの追加、その他の変更された特性を持つレンディションです。 AEMでのアセットの処理方法について詳しくは、 [メディアハンドラーとワークフローを使用したアセットの処理](https://helpx.adobe.com/experience-manager/6-5/assets/using/media-handlers.html) (AEMドキュメント )

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

/var/dxml/metadata/outputHistory/

ある期間、すべてのログファイルの総サイズが GB になる可能性がありました。 AEMガイドでは、これらのログファイルをリポジトリに保持する期間を設定できます。 指定した期間が過ぎると、出力生成履歴と共にログがリポジトリから削除されます。

>[!NOTE]
>
> 出力生成履歴は、「出力」タブの「生成された出力」リストのログエントリです。

履歴のパージ機能を設定すると、リポジトリ内のすべての DITA マップの出力生成に影響します。 DITA マップの「出力」タブでは、指定した日数の経過後、設定で指定した時刻に履歴がパージされます。

>[!NOTE]
>
> ログファイルと出力生成履歴を削除しても、生成される出力には影響しません。

次の手順を実行して、出力履歴とログをパージする日時を設定します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. 内 **出力履歴のパージ期間** プロパティを使用して、出力ログと共に出力履歴がパージされるまでの日数を指定します。 デフォルトでは、5 日に設定されています。 この機能を無効にする場合は、このプロパティを 0 に設定します。

1. 内 **出力履歴のパージ時間** プロパティを使用して、パージプロセスが開始される時間を指定します。 デフォルトでは、0:00 \（または 12:00 midnight\）に設定されています。 この時点で毎日、パージプロセスは、 **出力履歴のパージ期間** プロパティ。

   >[!NOTE]
   >
   > デフォルトでは、パージ機能は、5 日より古い出力で、午前 0 時ごとに実行されます。

1. 「**保存**」をクリックします。


## 最近生成した出力リストの制限を変更 {#id1679JH0H0O2}

DITA マップの「出力」タブに表示される、生成された出力の最大数を変更できます。 デフォルトでは、最後に生成された 25 個の出力のリストが表示されます。 リストに表示する出力数を変更するには、 **出力リストの制限** 設定 `com.adobe.fmdita.config.ConfigManager` バンドル。

>[!TIP]
>
> 詳しくは、 *出力履歴* の節（ベストプラクティスガイド）[appendix.md\#](appendix.md#) 出力履歴の操作に関するベストプラクティスを参照してください。

## 出力生成パフォーマンスの最適化 {#id176LB050VUI}

AEMガイドを使用すると、同時に実行する出力生成プロセスの数を制御する、出力生成プロセスのプールサイズを設定できます。 デフォルトでは、プロセスプールサイズは、システムで使用可能な処理コアの数に 1 を加えた数に設定されます。 順次公開する場合は、この値を 1 に変更します。 この場合、最初の公開タスクが実行され、次の公開タスクが公開キューに保存されます。

出力生成処理プールのサイズを変更するには、 **生成プールサイズ** 設定 `com.adobe.fmdita.publish.manager.PublishThreadManagerImpl` バンドル。

