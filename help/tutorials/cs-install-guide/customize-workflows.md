---
title: ワークフローの設定とカスタマイズ
description: ワークフローの設定とカスタマイズの方法について説明します
source-git-commit: 4f15166b1b250578f07e223b0260aacf402224be
workflow-type: tm+mt
source-wordcount: '1387'
ht-degree: 3%

---


# ワークフローの設定とカスタマイズ {#id181AI0OJ0RO}

ワークフローを使用すると、Adobe Experience Manager(AEM) アクティビティを自動化できます。 ワークフローは、特定の順序で実行される一連のステップで構成されます。 各ステップで実行する個別のアクティビティを定義できます。 例えば、トピックレビューが作成されたときに、グループ内のすべてのレビュー担当者に電子メール通知を送信できます。 または、出力生成タスクが完了したら、パブリッシャーに通知を送信します。

AEMのワークフローについて詳しくは、次を参照してください。

- [ワークフローインスタンスの管理](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/workflows-administering.html?lang=ja)

- ワークフローの適用と参加： [プロジェクトワークフローの操作](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/authoring/projects/workflows.html).


このトピックの各節では、AEMガイドに記載されているデフォルトのワークフローで行う様々なカスタマイズについて説明します。

## レビューワークフローをカスタマイズ {#id176NE0C00HS}

すべての組織のコンテンツオーサリングチームは、ビジネス要件を満たす特定の方法で作業します。 組織によっては、専用の編集者がいる場合と、自動編集レビューシステムを導入している場合があります。 例えば、組織では、コンテンツのオーサリングが完了するたびに、作成者が自動的にレビュー担当者に送信され、レビューが完了すると最終的な出力を生成するために、投稿者に送信されるなどのタスクが、一般的なオーサリングおよび公開ワークフローに含まれます。 AEMでは、コンテンツとアセットで実行したアクティビティをプロセスの形式で組み合わせ、AEMワークフローにマッピングできます。 AEMのワークフローについて詳しくは、 [ワークフローの管理](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/workflows-administering.html?lang=ja) (AEMドキュメント )

AEMガイドでは、デフォルトのレビューワークフローをカスタマイズできます。 他のオーサリングワークフローまたは公開ワークフローでは、次の 4 つのカスタムレビュー関連プロセスを使用できます。

- **レビューを作成**:このプロセスでは、レビュータスクの作成に必要なメタデータを準備します。 例えば、レビュー担当者にレビュー権限を割り当てたり、レビュー中のトピックのステータスをに設定したり、レビュータイムラインを設定したりします。 4 つのプロセスのうち、これが唯一の必須プロセスで、カスタムワークフローに含める必要があります。 ワークフローで、他の 3 つのプロセスを含めるか除外するかを選択できます。

- **レビュータスクを割り当て**:このプロセスは、レビュータスクを作成し、タスクの通知を開始者およびレビュー担当者に送信します。

- **レビューメールの送信**:このプロセスでは、レビュー担当者とレビュー担当者にレビュー用の E メールが送信されます。

- **レビューを閉じるジョブをスケジュール**:このプロセスにより、期限に達した後で確実にレビュープロセスが完了します。


カスタムレビューワークフローを作成する場合、最初のタスクは、レビューの作成プロセスで必要なメタデータを設定することです。 これをおこなうには、ECMA スクリプトを作成します。 メタデータを割り当てる ECMA スクリプトの例を以下に示します。

```javascript
var workflowdata=workItem.getWorkflowData();
workflowdata.getMetaDataMap().put("initiator","admin");
workflowdata.getMetaDataMap().put("operation","AEM_REVIEW");
workflowdata.getMetaDataMap().put("orgTopics","/content/dam/xml-solution/review.xml");
workflowdata.getMetaDataMap().put("payloadJson","{\"base\":\"/content/dam/xml-solution\",\"asset\":[\"/content/dam/xml-solution/review.xml\"],\"referrer\":\""}");
workflowdata.getMetaDataMap().put("deadline","2017-06-27T13:19:00.000+05:30");
workflowdata.getMetaDataMap().put("title","Review through custom workflow");
workflowdata.getMetaDataMap().put("description","Initiate this review process using the AEM workflow");
workflowdata.getMetaDataMap().put("assignee","user-one", "user-two");
workflowdata.getMetaDataMap().put("status","1");
workflowdata.getMetaDataMap().put("projectPath","/content/projects/review");
workflowdata.getMetaDataMap().put("startTime", System.currentTimeMillis());
```

このスクリプトは、 `/etc/workflows/scripts` ノード。 次の表に、この ECMA スクリプトによって割り当てられるプロパティを示します。

| プロパティ | 型 | 説明 |
|--------|----|-----------|
| `initiator` | String | レビュータスクを開始するユーザーのユーザー ID です。 |
| `operation` | 文字列 | として設定された静的な値 `AEM_REVIEW`. |
| `orgTopics` | 文字列 | レビュー用に共有されるトピックのパス。 複数のトピックをコンマで区切って指定します。 |
| `payloadJson` | JSON オブジェクト | 次の値を指定します。-   `base`:レビュー用に送信されたトピックを含む親フォルダーのパス。 <br> -   `asset`:レビュー用に送信されたトピックのパス。 <br> -   `referrer`:空白のままにしておきます。 |
| `deadline` | 文字列 | 時刻を `yyyy-MM-dd'T'HH:mm:ss.SSSXXX` 形式 |
| `title` | 文字列 | レビュータスクのタイトルを入力します。 |
| `description` | 文字列 | レビュータスクの説明を入力します。 |
| `assignee` | 文字列 | レビュー用にトピックを送信するユーザーのユーザー ID。 |
| `status` | 整数 | 1 に設定された静的な値。 |
| `startTime` | Long | 以下を使用： `System.currentTimeMillis()` 関数を使用して現在のシステム時刻を取得します。 |

スクリプトを作成したら、ワークフローでレビューを作成プロセスを呼び出す前に、を呼び出します。 その後、要件に応じて、他のレビューワークフロープロセスを呼び出すことができます。

### 設定のパージからレビューワークフローを削除

ワークフローエンジンのパフォーマンスを向上させるために、完了したワークフローインスタンスをAEMリポジトリから定期的にパージできます。 デフォルトのAEM設定を使用している場合、特定の期間が経過すると、完了したすべてのワークフローインスタンスがクリーンアップされます。 また、これにより、すべてのレビューワークフローがAEMリポジトリからパージされます。

レビューワークフローモデル「（情報）」を自動パージ設定から削除することで、レビューワークフローが自動パージされるのを防ぐことができます。 次を使用する必要があります。 **AdobeGranite のワークフローのパージ設定** をクリックして、自動パージリストからレビューワークフローモデルを削除します。

内 **AdobeGranite のワークフローのパージ設定**&#x200B;を使用する場合は、安全にパージできるワークフローが少なくとも 1 つリストされていることを確認します。 例えば、AEMガイドで作成された次のワークフローのいずれかを使用できます。

- /etc/workflow/models/publishditamap/jcr:content/model
- /etc/workflow/models/post-dita-project-creation-tasks/ jcr:content/model

ワークフローを **AdobeGranite のワークフローのパージ設定** は、設定にリストされているワークフローのみをAEMがパージするようにします。 これにより、AEMはレビューワークフロー情報をパージできなくなります。

詳しくは、 **AdobeGranite のワークフローのパージ設定**&#x200B;を参照してください。 *ワークフローインスタンスの管理* (AEMドキュメント )

### 電子メールテンプレートのカスタマイズ

多くのAEM Guides ワークフローで電子メール通知を使用します。 例えば、レビュータスクを開始すると、レビュー担当者に電子メール通知が送信されます。 ただし、電子メール通知を確実に送信するには、AEMでこの機能を有効にする必要があります。 AEMで電子メール通知を有効にするには、 [メールの送信](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/developing/development-guidelines.html?lang=ja#sending-email) (AEMドキュメント )

AEMガイドには、カスタマイズ可能な一連の電子メールテンプレートが含まれています。 次の手順を実行して、これらのテンプレートをカスタマイズします。

1. パッケージマネージャーを使用したダウンロード `/libs/fmdita/mail` ファイル。

   >[!NOTE]
   >
   > デフォルトの設定ファイルを ``libs`` ノード。 オーバーレイを作成するには、 ``libs`` ノードを ``apps`` ノードに追加し、 ``apps`` ノードのみ。

1. メールフォルダーには、カスタマイズ可能な次のテンプレートが含まれています。

   | テンプレートファイル名 | 説明 |
   |-----------------|-----------|
   | closereview.html | この電子メールテンプレートは、レビュータスクが閉じられたときに使用されます。 |
   | createreview.html | この電子メールテンプレートは、新しいレビュータスクが作成される際に使用されます。 |
   | reviewapproval.css | この CSS ファイルには、電子メールテンプレートのスタイルが含まれています。 |


## 出力後の生成ワークフローのカスタマイズ {#id17A6GI004Y4}

AEMガイドでは、出力後の生成ワークフローを柔軟に指定できます。 AEMガイドを使用して生成された出力で、一部の後処理タスクを実行できます。 例えば、生成されたAEM Site 出力に CQ タグを適用したり、PDF出力に特定のプロパティを設定したり、出力が生成された後に一連のユーザーに電子メールを送信したりできます。

新しいワークフローモデルを作成して、出力後の生成ワークフローとして使用できます。 出力後の生成ワークフローがトリガーされると、出力生成ワークフローは、ワークフローメタデータマップを介してコンテキスト情報を共有し、生成された出力に対する処理を実行できます。 次の表に、メタデータとして共有されるコンテキスト情報を示します。

| プロパティ | 型 | 説明 |
|--------|----|-----------|
| ``outputName`` | String | 出力の生成に使用する出力プリセットの名前。 |
| `generatedPath` | 文字列 | 生成された出力が保存される DAM 内のパス。 |
| `outputType` | com.adobe.fmdita.output.OutputType | 出力プリセットのタイプ。 |
| `outputTitle` | 文字列 | 出力プリセットのタイトル。 |
| `outputHistoryPath` | 文字列 | 履歴ノードのリポジトリパス。 |
| `isSuccess` | ブーリアン | 出力生成プロセスの最終ステータスを示すフラグ（成功または失敗）。 |
| `logPath` | 文字列 | 出力生成ログが保存される DAM 内のパス。 |
| `generatedTime` | Long | 出力生成プロセスがトリガーされた時間。 |
| `initiator` | 文字列 | 出力生成ワークフローをトリガーしたユーザーのユーザー ID。 |

出力生成メタデータを利用するには、ECMA スクリプトまたは OSGi バンドルを作成します。 メタデータを使用する ECMA スクリプトの例を以下に示します。

>[!NOTE]
>
> このスクリプトは、 ``/etc/workflows/scripts`` ノード。

```javascript
var session = workflowSession.getSession(); // Obtain session object to read/write the repository.
var payload = workItem.getWorkflowData().getPayload().toString(); // Get the workflow payload (the ditamap file on which the generation was triggered)
var metadata = workItem.getWorkflowData().getMetaDataMap(); // Get the workflow metadata object
var generatedPath = metadata.get("generatedPath"); // supplied by AEM Guides
var username = metadata.get("initiator"); // supplied by AEM Guides
var successful = metadata.get("isSuccess"); // supplied by AEM Guides
var title = metadata.get("outputTitle"); // supplied by AEM Guides
var subject = "Output Generation Finished";
var message = "Generation of output " + title + " just finished " + 
(successful ? "successfully. " : "unsuccessfully. ");
    message += "It was triggered by " + username;    
if (successful) {
    message += "<br/><br/>The path to the generated output is " + 
generatedPath;
}
/*
    MailerAPI.sendMail("dl-docs-authors", subject, message);
*/
```

スクリプトを作成したら、ワークフローでカスタムスクリプトを呼び出します。 その後、要件に応じて、他のワークフロープロセスを呼び出すことができます。 カスタムワークフローを設計したら、 *投稿生成を最終決定* をワークフロープロセスの最後のステップとして使用します。 この *投稿生成を最終決定* ステップにより、出力生成タスクのステータスが次の値に更新されます。 *完了* 出力生成プロセスの完了時。 出力後のカスタム生成ワークフローを作成した後、任意の出力生成プリセットを使用して設定できます。 必要なワークフローを *投稿生成ワークフローを実行* 必要なプリセットのプロパティ。 設定した出力プリセットを使用して出力生成タスクを実行すると、タスクのステータス（「出力」タブ内）は「 *後処理*.

