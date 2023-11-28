---
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '397'
ht-degree: 1%

---
# レビューアプリのカスタマイズ

レビューアプリのカスタマイズを容易にするために、以下に示すいくつかのフックを提供し、説明します。

## Review-Comment

- id: `review_comment`
- フック: `this.updateExtraProps`:

説明に従って [ここ](../../aem_guides_framework/basic_customisation.md)の場合、カスタマイズ中に追加された新しい属性は、 `this.model.extraProps`. メソッド `updateExtraProps` では、レビューコメントに属性を追加し、追加した属性のサーバー上での更新と保存も処理できます。

### 使用例

例えば、フィールドを追加するとします。 `commentRationale` および `severity` をコメントに追加します。
を更新しましょう。 `commentRationale` 「これは重要な文だ」と そして `severity` を「重大」に設定します。
これは、次の構文を使用しておこなうことができます。

```typescript
 this.updateExtraProps(
        {'commentRationale': 'This is an important sentence.',
        'severity': 'CRITICAL'}
      )
```

上記のコードスニペットは、値の更新と保存を処理します。 保存された値は、ビューを定義することで、UI 上でレンダリングできます。

```JSON
{
    "component" : "label",
    "label": "@extraProps.commentRationale"
}
```

## インラインレビューパネル

- id: `inline_review_panel`

1. フック： `onNewCommentEvent`
フック `onNewCommentEvent` 新しいコメントまたは返信イベントでイベントをスローしたり、メソッドを呼び出したりできます。
受け取った引数は `onNewCommentEvent` 次を含む：
   - イベント：ディスパッチされたコメント/返信イベント。
   - newComment: boolean ディスパッチされるイベントが新しいコメントイベントの場合、つまり、 `highlight`, `insertion`, `deletion`, `sticky note comment`
   - newReply: boolean ディスパッチされたイベントが新しい返信イベントであった場合。

2. フック: `sendExtraProps`

このフックは、 `event` および送信 `extraProps` をインラインレビューパネルから削除します。 以下に、これら 2 つのフックの使い方を説明します。

### インラインレビューパネルの例

extraProp を送信するとします。 `userInfo`、新しいコメントまたは返信がディスパッチされるたびに送信されます。 これは、インラインレビューパネルを使用しておこなわれますが、新しく生成されたコメントの commentId への参照がないので、次のコードを記述できます。

```typescript
    onNewCommentEvent(args){
      const events = _.get(args, "events")
      const currTopicIndex = tcx.model.getValue(tcx.model.KEYS.REVIEW_CURR_TOPIC) || this.model.currTopicIndex || "0"
      const event = _.get(_.get(events, currTopicIndex), '0')
      const newComment = _.get(args, 'newComment')
      const newReply = _.get(args, 'newReply')
      if ((newComment || newReply) && event) {
        this.next('setUserInfo', event)
      }
    },
```

上記のコードスニペットでは、ディスパッチされたイベントが新しいコメントまたは返信であったかどうかを確認しています。 新しいコメントや返信が発生した場合は、メソッドを呼び出します。 `setUserInfo`

```typescript
    setUserInfo(event) {
      this.loader?.getUserInfo(event.user).subscribe(userData => {
        const extraProps = {
          "userFirstName": userData?.givenName || '',
          "userLastName": userData?.familyName || '',
          "userTitle": userData?.title || '',
          "userJobTitle": userData?.jobTitle || '',
          'userEmail': userData?.email || '',
        }
        const data = {... event, extraProps}
        this.sendExtraProps(
          data
        )
      })
    },
```

上記のメソッドでは、イベントを拡張して、ユーザーの名、E メール、タイトルなどを含む extraProps を送信します。 この方法でイベントを拡張すると、extraProps が正しい commentId で送信され、それらが適切なコメントに添付されていることを確認できます。

フック `updateExtraProps` 本質的にフックを呼ぶ `sendExtraProps`では、何を使うのか？

当社は、 `updateExtraProps` （内） `review_comment` コメントの `id` だから君はただ言うだけでいい `extraProps.`

The `inline_review_panel` ただし、コメントの id に対するアクセス権がないので、インラインレビューパネルからイベントをディスパッチする必要が生じた場合は、 `sendExtraProps` 便利だろう
