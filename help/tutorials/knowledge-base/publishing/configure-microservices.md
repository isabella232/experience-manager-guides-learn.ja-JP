---
title: AEMガイド用の新しいマイクロサービスベースの公開の設定をas a Cloud Service
description: AEMガイド用の新しいマイクロサービスベースの公開を設定する方法について説明します。
exl-id: 92e3091d-6337-4dc6-9609-12b1503684cd
source-git-commit: aa71a2b8ff5f83365ff2f3562bb2b77061a3da8e
workflow-type: tm+mt
source-wordcount: '691'
ht-degree: 0%

---

# AEMガイド用の新しいマイクロサービスベースの公開の設定をas a Cloud Service

新しい公開マイクロサービスを使用すると、as a Cloud ServiceのAEMガイドで大規模な公開ワークロードを同時に実行し、業界をリードするAdobe I/O Runtimeのサーバレスプラットフォームを活用できます。

発行リクエストごとに、AEMガイドはas a Cloud Service的に個別のコンテナを実行し、ユーザーのリクエストに従って水平方向に拡大/縮小します。 これにより、ユーザーは、複数の公開リクエストを実行し、大規模なオンプレミスのAEMサーバーよりも高いパフォーマンスを得ることができます。

>[!NOTE]
>
> AEMガイドの Microservice ベースの公開では、PDF（ネイティブと DITA-OT ベースの両方）、HTML5、JSON およびカスタムタイプの出力プリセットがサポートされます。

新しいクラウド公開サービスはAdobe IMSJWT ベースの認証で保護されるので、お客様は以下の手順に従って、Adobeのセキュアなトークンベースの認証ワークフローと環境を統合し、新しいクラウドベースのスケーラブル公開ソリューションの使用を開始する必要があります。


## Adobe Developer Console での IMS 設定の作成

**統合の作成に必要なロール**：システム管理者

Adobe Developer Console で IMS 設定を作成するには、次の手順を実行します。

1. 開発者コンソールを開きます。 `https://developer.adobe.com/console`.

1. 切り替え先 **プロジェクト** タブを上から開きます。

   <img src="assets/projects-tab.png" alt="「プロジェクト」タブ" width="500">

1. 新しい空のプロジェクトを作成するには、「 **空のプロジェクト** から **新規プロジェクトを作成** ドロップダウン。

   <img src="assets/create-new-project.png" alt="新規プロジェクトを作成" width="500">

1. 選択 **API** から **プロジェクトに追加** ドロップダウンを使用して、IO 管理 API をプロジェクトに追加します。

   <img src="assets/add-project.png" alt="プロジェクトを追加" width="300">

   <img src="assets/io-management-api.png" alt="io 管理" width="500">

1. API を追加する際に、新しい秘密鍵と公開鍵のペアを作成します。 これにより、システム上の秘密鍵が自動的にダウンロードされます。

   <img src="assets/generate-key-pair.png" alt="キーペアを生成" width="500">

1. 設定済みの API を保存します。

   <img src="assets/save-api.png" alt="api を保存" width="600">

1. に戻る **プロジェクト** タブをクリックし、 **プロジェクトの概要** 左側に

   <img src="assets/project-overview.png" alt="プロジェクトの概要" width="500">

1. クリック **ダウンロード** ボタンを上部に配置して、サービス JSON をダウンロードします。

   <img src="assets/download-json.png" alt="json をダウンロード" width="500">

これで、JWT 認証の詳細を設定し、秘密鍵とサービスの詳細 JSON もダウンロードしました。 これらの 2 つのファイルは、次の節で必要となるので、手元に置いておいてください。

### 環境に IMS 設定を追加する

IMS 設定を環境に追加するには、次の手順を実行します。

1. Experience Manager を開き、設定する環境を含むプログラムを選択します。
1. 切り替え先 **環境** タブをクリックします。
1. 設定する環境名をクリックします。 これにより、環境情報ページに移動します。
1. 切り替え先 **設定** タブをクリックします。
1. 秘密鍵とプロジェクト JSON をアップロードします（下のスクリーンショットを参照）。 次に示すように、同じ名前と設定を使用していることを確認します。

   <img src="assets/ims-config-environment.png" alt="ims 設定" width="500">

>[!NOTE]
>
> 上のスクリーンショットに示すように、秘密鍵とサービスの詳細 JSON ファイルの内容を開き、コピーし、設定パネルの value 列に貼り付ける必要があります。

IMS 設定を環境に追加したら、次の手順を実行して、OSGi を使用してこれらのプロパティをAEMガイドにリンクします。

1. Cloud Manager の Git プロジェクトコードで、以下の 2 つのファイルを追加します ( ファイルの内容については、 [付録](#appendix)) をクリックします。

   * `com.adobe.aem.guides.eventing.ImsConfiguratorService.cfg.json`
   * `com.adobe.fmdita.publishworkflow.PublishWorkflowConfigurationService.xml`
1. 新しく追加されたファイルが、 `filter.xml`.
1. Git の変更をコミットしてプッシュします。
1. パイプラインを実行して、環境に変更を適用します。

その後、新しいマイクロサービスベースのクラウドパブリッシングを使用できるようになります。

## FAQ

1. 1 つのキーを複数のクラウド環境で使用できますか。
   * はい。1 つの秘密鍵を生成し、すべての環境で使用できますが、すべての環境に対して環境変数を設定し、同じ鍵を使用する必要があります。
1. マイクロサービスを使用する OSGi 設定が有効になっている場合、公開プロセスは同じコードベースを持つローカルAEMサーバー上で動作しますか？
   * いいえ、フラグが `dxml.use.publish.microservice` が `true` その後、常にマイクロサービス設定を探します。 設定 `dxml.use.publish.microservice` から `false` パブリッシュがローカルで動作するようにするために使用します。
1. マイクロサービスベースの公開を使用する場合、DITA プロセスに割り当てられるメモリ量はどれくらいですか？ これは DITA プロファイル ANT パラメーターを介して駆動されますか？
   * マイクロサービスベースの公開では、DITA プロファイルの ant パラメーターを使用してメモリ割り当てを実行しません。 サービスコンテナで使用可能な合計メモリは 8 GB で、そのうち 6 GB が DITA-OT プロセスに割り当てられます。


## 付録 {#appendix}

**ファイル**:
`com.adobe.aem.guides.eventing.ImsConfiguratorService.cfg.json`

**コンテンツ**:

```
{
  "service.account.details": "$[secret:SERVICE_ACCOUNT_DETAILS]",
  "private.key": "$[secret:PRIVATE_KEY]"
}
```

**ファイル**: `com.adobe.fmdita.publishworkflow.PublishWorkflowConfigurationService.xml`

**コンテンツ**:
* `dxml.use.publish.microservice`:DITA-OT を使用したマイクロサービスベースの公開の有効化に切り替えます
* `dxml.use.publish.microservice.native.pdf`：マイクロサービスベースのネイティブPDF公開を有効に切り替えます

```
<?xml version="1.0" encoding="UTF-8"?>
<jcr:root xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
          jcr:primaryType="sling:OsgiConfig"
          dxml.publish.microservice.url="https://adobeioruntime.net/api/v1/web/543112-guidespublisher/default/publishercaller.json"
          dxml.use.publish.microservice="{Boolean}true"
          dxml.use.publish.microservice.native.pdf="{Boolean}true"
/>
```
