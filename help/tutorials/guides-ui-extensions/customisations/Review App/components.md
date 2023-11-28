---
sidebar_position: 5
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '123'
ht-degree: 0%

---



# Review App のコンポーネント

レビューアプリの主なコンポーネントは次のとおりです。

- インラインレビューパネル： `id: inline_review_panel`
   - レビューコメントが XML エディタ側でレンダリングされる右側のパネル。

![インラインレビューパネルのスクリーンショット](./imgs/inline_review.png)

- トピックのレビュー： `id: topic_reviews`
   - コメントが Review App に表示される右側のパネル。

![トピックレビューパネルのスクリーンショット](./imgs/topic_reviews.png)

- レビューコメント： `id: review_comment`
   - 各レビューコメントのウィジェット。

レビューアプリでのコメントを確認します。
![レビューコメントのスクリーンショット](./imgs/review_comment.png)

XML エディター側でコメントを確認します。
![レビューコメントのスクリーンショット](./imgs/review_comment_xmleditor.png)

- レビューコメントの返信： `id: comment_reply`
   - レビューコメントの返信ごとにウィジェットを使用します。
     ![レビューコメントの返信のスクリーンショット](./imgs/reply.png)

- 新しいレビューコメントの返信： `id: comment_new_reply`
   - 新しいレビューコメントの返信用のウィジェット。
     ![新しいレビューコメントの返信のスクリーンショット](./imgs/new_reply.png)

- 注釈ツールボックス： `id: annotation_toolbox`
   - レビューアプリケーションの右上のツールバー。
     ![注釈ツールボックスのスクリーンショット](./imgs/annotation_toolbox.png)
