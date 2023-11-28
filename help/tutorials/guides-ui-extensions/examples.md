---
sidebar_position: 8
source-git-commit: f00c135222adf57a418b4885cff2f3f036ea07ff
workflow-type: tm+mt
source-wordcount: '371'
ht-degree: 0%

---


# 例

このパッケージでは、カスタマイズ例もいくつか提供しています ( `guides_extension/src`) ) をクリックします。 以下に、それぞれについて簡単に説明します。

1. [コンテキストメニュー](./../../src/file_options.ts)
この例では、 `file_options` コンテキストメニュー、削除する `Delete` および `Edit` オプションを選択し、 `Duplicate` オプション `Download` オプション。

2. [左パネル](../../src/left_panel_container.ts)
この例では、 `left tab panel` 別の物を持つ`tab` 「TEST EXTENSION」というタイトルの、対応する `tab panel` これは、次のラベルを持ちます。 `Test Tab Panel`

3. [右パネル](../../src/right_panel_container.ts)
この例では、 `right tab panel` 別の物を持つ `tab` 「TEST EXTENSION」というタイトルの、対応する `tab panel` これは、次のラベルを持ちます。 `New Tab Panel`

4. [リポジトリパネル](../../src/repository_panel.ts)

5. [ツールバー](../../src/toolbar.ts)
この例では、 `Insert Element`, `Insert Paragraph`, `Insert Numbered List`, `Insert Bulleted List` 1 つのボタン `More Insert Options` ボタンに含まれています。

[アプリの例を確認]

1. [注釈ツールボックス](../../src/review_app_examples/annotation_extension.ts)
この例では、AEMの現在のレビュートピックを開く注釈ツールボックスに別のボタンを追加しました。

2. [レビューコメント](../../src/review_app_examples/review_comment.ts)
この例では、ユーザー名の置き換え（コメントの氏名と名称を考慮）、一意のコメント ID、mailTo アイコンを追加し、コメントの重大度と合理性を説明するための入力フィールドを追加しました。
また、 `accept with modification` ボタンをクリックして、ダイアログを開く XMLEditor 側のコメントをクリックします。

3. [コメントの返信](../../src/review_app_examples/comment_reply.ts)
この例では、ユーザー名をユーザー情報に置き換え（コメントの完全な名前とタイトルを考慮）、コメントヘッダーに mailTo アイコンを追加しました。

4. [インラインレビューパネル](../../src/review_app_examples/inline_review_panel.ts)
このファイルでは、 `Review Comment` および `Comment Reply` 例。
   - The `setCommentId` メソッドは、コメント数に応じて、各コメントに一意のコメント ID を設定します。

   - The `setUserInfo` 各コメントのフルネームとタイトルを使用して、userInfo の値を設定します。

   - The `onNewCommentEvent` は、 `setUserInfo` メソッドは、新しいコメントまたは返信ごとに呼び出されます。

   - The `updatedProcessComments` 関数は新しいコメントイベントごとに実行され、 `setCommentId` 新しいコメントイベントが発生した場合はが呼び出されます。

5. [トピックレビューパネル](../../src/review_app_examples/topic_reviews.ts)：このファイルは、 [インラインレビューパネル](../../src/review_app_examples/inline_review_panel.ts) そのため、カスタマイズ機能が Review App 側でも機能します。

6. [変更で確定ダイアログ](../../src/review_app_examples/accept_with_modification_dialog.ts)
これは、アプリに新しいウィジェットを追加する例です。 ここでは、2 つの入力テキストフィールドを持つ新しいダイアログを作成しました。 `Revised Text` および `Adjudicator Comment Rationale`

![変更を承認ダイアログ](./imgs/accept_with_modification_dialogue.png)

カスタマイズ前とカスタマイズ後のレビューパネルは次のとおりです。

![レビューパネル；](./imgs/review_panel.png)
![変更を承認ダイアログ](./imgs/customised_review_panel.png)
