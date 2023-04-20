---
title: WebEditor ツールバーにアクションにつながる新しいカスタムボタンを追加する
description: 新しいカスタムボタンを webeditor ツールバーに追加し、javascript を呼び出してカスタム操作する方法を説明します。
source-git-commit: 26a6acde54953eab1d751f165d0f7769c7e790fe
workflow-type: tm+mt
source-wordcount: '543'
ht-degree: 0%

---

# WebEditor ツールバーにアクションにつながる新しいカスタムボタンを追加する

この記事では、webeditor ツールバーに新しいカスタムボタンを追加し、javascript を呼び出して、目的のカスタム操作を実行する方法について説明します。

実用的なボタンを Webeditor に追加するには、次の手順に従います。
- ボタンを *ui_config.json* 必要な位置に
- クリック時にユーザーがアクションを実行できるように、ボタンのオンクリックイベントを Webeditor に登録する


## 例を見て実装する

作成者がトピックのプロローグセクションに jira 参照を追加する例を使用して、この点を理解してみましょう。 jira reference-id が埋め込まれた prolog セクションは、次のようになります。

![JIRA ID 参照を含むプロローグセクション](../../../assets/authoring/webeditor-add-customtoolbarbutton-prolog-sample.png)

JIRA ID を含む「change-request-id」要素は、API から取得する必要があります（例えば、アプリケーションで表される特定の JIRA クエリに基づいています）。 ユーザーがプロログセクションを作成している場合、ユーザーは、ボタンをクリックして、Web エディターのツールバーから jira 参照 ID を挿入できるはずです。次に例を示します。

![Prolog セクション — JIRA 参照を追加](../../../assets/authoring/webeditor-add-customtoolbarbutton-prolog-insertjirareference.png)

ユーザーがボタンをクリックすると、次のようなオプションを取り込み、ユーザーが目的の JIRA ID を選択できるダイアログが表示されます。

![「Prolog」セクションの「JIRA ID を追加」ダイアログ](../../../assets/authoring/webeditor-add-customtoolbarbutton-prolog-insertjirareference-dialog.png)

次に、「change-request-id」をプロログに追加します。

![JIRA ID 参照を含むプロローグセクション](../../../assets/authoring/webeditor-add-customtoolbarbutton-prolog-sample.png)



## 実装


### ボタンを *ui_config.json*

フォルダープロファイルを使用して、 *ui_config.json* 「XML Editor Configuration」タブの下で、ボタン設定 JSON を「toolbar」グループの目的のセクションに追加します。

```
{
    "on-click":"insertJIRARef",
    "icon":"linkCheck",
    "variant":"quiet",
    "type":"button",
    "title":"Insert JIRA Reference"
}
```

[このリンクを使用して、フォルダープロファイルと ui_config.json の設定に関する詳細を確認できます](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/videos/advanced-user-guide/editor-configuration.html?lang=en)


### 新しいボタンのクリック時イベントを処理します

    注意：以下の手順は、この投稿に添付されたパッケージとして利用できます


- フォルダープロファイルを保存した後、プロジェクトディレクトリ（の下）に「cq:ClientLibraryFolder」を作成します。 */apps*) をクリックし、以下のスクリーンショットに示すように、プロパティを追加します。
   ![webeditor のクライアントライブラリ設定](../../../assets/authoring/webeditor-add-customtoolbarbutton-clientlibrarysettings.png)

```
This example uses "coralui3" library to show a dialog as it is used in the Javascript sample we presented.
You may use different library of your choice.
```

- このクライアントライブラリフォルダーの下に、以下に示すように 2 つのファイルを作成します。
   - *overrides.js*:これには、「insertJIRARef」のオンクリックイベントを処理する javascript コードが含まれます（この javascript のコンテンツを取得するには、添付のパッケージを使用します）。
   - *js.txt*:これにより、この javascript を有効にする「overrides.js」が含まれます。

- 変更を保存すると、テストの準備が整います。


### テスト

- Web-editor を開く
- ユーザーの環境設定から、カスタム *ui_config.json*. Global プロファイルに追加した場合は、既に使用されている可能性があります。
- トピックを開くと、ツールバーに新しいボタン「Insert Jira Reference」が表示されます。
- 次に、以下に示すようにプロログセクションをトピックに追加し、プロログ要素「change-request-reference」内の「Insert Jira Reference」ボタンをクリックしてみてください。

```
<prolog>
    <change-historylist>
        <change-item>
            <change-request-reference>
            </change-request-reference>
            <change-completed></change-completed>
            <change-summary></change-summary>
        </change-item>
    </change-historylist>
</prolog>
```

以下のスクリーンショットを参照して、どのように表示されるかを確認してください。

![新規ボタンをテスト](../../../assets/authoring/webeditor-add-customtoolbarbutton-testing.png)


### 添付ファイル

- ツールバーボタンのアクション用の JavaScript コードを持つ webeditor クライアントライブラリをインストールする、サンプルの clientlibs パッケージです。 [このリンクを使用してダウンロード](../../../assets/authoring/webeditor-addbuttonontoolbar-insertjira-clientlib.zip)
- サンプル *ui_config.json* 次のフォルダープロファイルにアップロードできます。 [サンプル ui_config.json をダウンロード](../../../assets/authoring/sample_ui_config_Guides4.2-InsertJiraReference.json)

```
Please note this is compatible to AEM 6.5 and AEM Guides version 4.2.
If you are using a different version please add the toolbar button to the ui_config.json manually.
```
