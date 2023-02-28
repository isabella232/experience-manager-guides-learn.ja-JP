---
title: Webeditor での Schematron のサポート
description: Webeditor でのスキーマトロンの操作
source-git-commit: 2a036ec628424f0dedfdb69a5e860906ca100cc6
workflow-type: tm+mt
source-wordcount: '412'
ht-degree: 0%

---


# Web エディター内でのコンテンツ品質の制御

この記事では、AEMガイド Web エディター内の検証機能の概要を説明します。
設計により、Web エディターは、システムでの DITA スキーマ設定を利用して、DITA 準拠のコンテンツを作成するユーザーを強制します。 これにより、システムに保存されるすべてのコンテンツは、構造化され、再利用可能で有効な DITA コンテンツになります。

DITA ルールのサポートの他に、Web エディターは、「*Schematron*」ルールを使用します。

&quot;*Schematron*「 」は、XML ファイルのテストを定義する際に使用される、ルールベースの検証言語を指します。 Schematron ファイルをインポートし、Web エディタで編集することもできます。 &quot;Schematron&quot;ファイルを使用すると、特定のルールを定義し、DITA トピックまたはマップに対して検証できます。 スキーマトロンルールを使用すると、ルールとして定義された制限を課すことで、XML 構造の一貫性を確保できます。 これらの制限は、コンテンツの品質と一貫性を所有する中小企業によって推進されている。

    注意：Web エディタは、ISO スキーマトロンをサポートしています。


## Web エディタでの「Schematron」の動作の理解

### スキーマトロンルールの設定

Schematron ファイルのサポートの節を参照してください。 [ユーザーガイド](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_UUID_User-Guide_EN.pdf#page=148)


### ファイルの保存時に検証ルールを適用する

Webeditor 設定を使用すると、ユーザーがコンテンツを更新するたびに実行される Schematron のルール/ファイルをパワーユーザーが設定できます。 詳しくは、 [ユーザーガイド](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-2/Adobe-Experience-Manager-Guides_UUID_User-Guide_EN.pdf#page=58)

![Web エディター設定からルールを設定する](../../../assets/authoring/schematron-editorsettings-validation-tab.png)


### 検証を手動で実行できますか？

はい。コンテンツを作成する際に、作成者またはユーザーとして、webeditor の Schematron パネルを使用してスキーマファイルをアップロードし、エディターで開くファイルで検証を実行できます。

    この機能を有効にするには、フォルダープロファイル管理者が、すべてのユーザーに検証パネルで Schemtron ファイルの追加を許可する必要があります。 エディター設定を参照（上のスクリーンショット）

![Schematron ファイルを選択](../../../assets/authoring/schematron-rightpanel-validation-addsch.png)
![検証を実行](../../../assets/authoring/schematron-rightpanel-validation-runsch.png)


### サポートされるルール

現在のバージョンのAEMガイドでは、「アサーション」ベースのルールを使用した検証のみサポートしています。 ( [アセットとレポート](https://schematron.com/document/205.html))「レポート」に基づくルールは、まだサポートされていません。


### Schematron ルールのサンプルおよびその他のヘルプ

#### サンプルのユースケース

- リンクが外部かどうか、およびリンクのスコープが「外部」かどうかを確認します。

   ```
   <sch:pattern>
       <sch:rule context="xref[contains(@href, 'http') or contains(@href, 'https')]">
           <sch:assert test="@scope = 'external' and @format = 'html'">
               All external xref links must be with scope='external' and format='html'
           </sch:assert>
       </sch:rule>
   </sch:pattern>
   ```

- マップ内に少なくとも 1 つの「topicref」があるか、「ul」の下に少なくとも 1 つの「li」があるかを確認します。

   ```
   <sch:pattern>
       <sch:rule context="map">
           <sch:assert test="count(topicref) > 0">
               There should be atleast one topicref in map
           </sch:assert>
       </sch:rule>
   
       <sch:rule context="ul">
           <sch:assert test="count(li) > 1" >
               A list must have more than one item.
           </sch:assert>
       </sch:rule>
   </sch:pattern>
   ```

- 「indexterm」要素は、常に「prolog」に存在する必要があります

   ```
   <sch:pattern>
       <sch:rule context="*[contains(@class, ' topic/indexterm ')]">
           <sch:assert test="ancestor::node()/local-name() = 'prolog'">
               The indexterm element should be in a prolog.
           </sch:assert>
       </sch:rule>
   </sch:pattern>
   ```

#### リソース

- について  [スキーマトロンの基本](https://da2022.xatapult.com/#what-is-schematron)
- 詳細情報 [スキーマトロンのアサーション規則](https://www.xml.com/pub/a/2003/11/12/schematron.html#Assertions)
- [サンプルの Schematron ファイル](../../../assets/authoring/sample_schematron.sch)