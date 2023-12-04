---
title: Schematron ファイルのサポート
description: DITA トピックを読み込んで検証する方法、assert レポートステートメントを使用してルールを確認する方法、正規表現式を使用する方法、およびAEMガイドの Schematron ファイルで抽象パターンを定義する方法を説明します。
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '765'
ht-degree: 0%

---

# Schematron ファイルのサポート

「Schematron」は、XML ファイルのテストを定義するルールベースの検証言語を指します。 Web エディタは、Schematron ファイルをサポートします。 Schematron ファイルをインポートし、Web エディタで編集することもできます。 Schematron ファイルを使用すると、特定のルールを定義し、DITA トピックまたはマップ用に検証できます。

>[!NOTE]
>
> Web エディタは、ISO スキーマトロンをサポートしています。


## Schematron ファイルのインポート

Schematron ファイルをインポートするには、次の手順を実行します。

![](images/scematron-panel-add.png){width="300" align="left"}

1. にある必要なフォルダー（ファイルをアップロードするフォルダー）に移動します。 *リポジトリ表示*.
1. 次をクリック： **オプション** アイコンをクリックしてコンテキストメニューを開き、を選択します。 **アセットをアップロード**.
1. Adobe Analytics の **アセットをアップロード** ダイアログでは、 **アセットフォルダを選択** フィールドに入力します。
1. クリック **ファイルを選択** をクリックし、Schematron ファイルを参照して選択します。 1 つ以上の Schematron ファイルを選択し、 **アップロード**.

## Schematron を使用した DITA トピックまたはマップの検証

Schematron ファイルをインポートした後、Web エディタで編集できます。 Schematron ファイルを使用して、トピックまたは DITA マップを検証できます。 例えば、DITA マップまたはトピックに対して次のルールを作成できます。

* DITA マップのタイトルが定義されます。
* 特定の長さに関する短い説明が追加されました。
* マップには少なくとも 1 つの topicref が必要です。

Web エディタでトピックを開くと、右側に「スキーマの検証」パネルが表示されます。 Schematron ファイルを使用してトピックまたはマップを追加および検証するには、次の手順を実行します。
![](images/schematron-validate.png){width="300" align="left"}

1. Schematron アイコン () をクリックして、Schematron パネルを開きます。
1. Schematron ファイルを追加するには、Schematron ファイルの追加を使用します。
1. Schematron ファイルにエラーがない場合は、ファイルが追加され、検証パネルに表示されます。 エラーを含む Schematron ファイルに関するエラーメッセージが表示されます。
   >[!NOTE]
   >
   >Schematron ファイル名の近くにある十字アイコンを使用して、ファイル名を削除できます。
1. トピックを検証するには、「スキーマで検証」をクリックします。

   * トピックでルールが壊れない場合は、検証の成功メッセージがファイルに対して表示されます。
   * トピックがルールを破る場合（タイトルが含まれず、上記の Schematron に対して検証される場合など）は、検証エラーが表示されます。

1. エラーメッセージをクリックして、開いているトピック/マップ内のエラーを含む要素をハイライトします。

Web エディタでの Schematron のサポートにより、一連のルールに対してファイルを検証し、トピック全体で一貫性と正確性を維持できます。

## assert ステートメントと report ステートメントを使用して、ルールを確認する{#schematron-assert-report}

AEMガイドでは、Schematron の assert 文と report 文もサポートしています。 これらの文は、DITA トピックを検証するのに役立ちます。

### Assert 文

assert 文は、test 文が false と評価されると、メッセージを生成します。 例えば、タイトルを太字にしたい場合は、タイトルに assert 文を定義できます。

```XML
<sch:rule context="title"> 
    <sch:assert test = "b"> Title should be bold </sch:assert>
  </sch:rule>
```

Schematron を使用して DITA トピックを検証すると、タイトルが太字でないトピックに関するメッセージが表示されます。

### レポート明細書

テストステートメントが true と評価されると、レポートステートメントはメッセージを生成します。 例えば、短い説明を 150 文字以下にしたい場合、レポート文を定義して、短い説明が 150 文字を超えるトピックを確認できます。
スキーマトロンを使用して DITA トピックを検証すると、レポート文が true と評価されるルールの完全なレポートが取得されます。 短い説明が 150 文字を超えるトピックに関するメッセージが表示されます。


```XML
<sch:rule context="shortdesc"> 
        <sch:let name="characters" value="string-length(.)"/> 
        <sch:report test="$characters &gt; 150">  
        The short description has <sch:value-of select="$characters"/> characters. It should contain more than 150 characters.      
        </sch:report>   
    </sch:rule> 
```

>[!NOTE]
>
> Schematron ルールを記述する際は、Xpath 2.0 式のみを使用します。

## 正規表現の使用{#schematron-regex-espressions}

正規表現式を使用して matches() 関数でルールを定義し、Schematron ファイルを使用して検証を実行することもできます。

例えば、タイトルに単語が 1 つしか含まれていない場合は、このフィールドを使用してメッセージを表示できます。

```XML
<assert test="not(matches(.,'^\w+$'))"> 
No one word titles.
</assert>  
```


## 抽象パターンの定義{#schematron-abstract-patterns}

AEMガイドは、Schematron の抽象パターンもサポートしています。 汎用の抽象パターンを定義して、これらの抽象パターンを再利用できます。  実際のパターンを指定するプレースホルダパラメータを作成できます。


抽象パターンを使用すると、ルールの重複を減らし、検証ロジックの管理と更新を容易にすることで、Schematron スキーマを簡略化できます。 また、複雑な検証ロジックを単一の抽象パターンで定義し、スキーマ全体で再利用できるので、スキーマを理解しやすくすることもできます。


例えば、次の XML コードは抽象パターンを作成し、実際のパターンは ID を使用して参照します。

```XML
<sch:pattern abstract="true" id="LimitNoOfWords"> 

<sch:rule context="$parentElement"> 

<sch:let name="words" value="string-length(.)"/> 

<sch:assert test="$words &lt; $maxWords"> 

You have <sch:value-of select="$words"/> letters. This should be lesser than <sch:value-of select="$maxWords"/>. 

</sch:assert>  

<sch:assert test="$words &gt; $minWords"> 

You have <sch:value-of select="$words"/> letters. This should be greater than <sch:value-of select="$minWords"/>. 

</sch:assert>  

</sch:rule> 

</sch:pattern> 

<sch:pattern is-a="LimitNoOfWords" id="extend-LimitNoOfWords"> 

<sch:param name="parentElement" value="title"/> 

<param name="minWords" value="1"/> 

<param name="maxWords" value="8"/> 

</sch:pattern> 
```
