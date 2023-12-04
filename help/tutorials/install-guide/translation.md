---
title: AEMガイドでのコンテンツの翻訳
description: コンテンツの翻訳方法を学ぶ
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '707'
ht-degree: 8%

---

# コンテンツの翻訳 {#id181GB0400UI}

ページコンテンツ、アセット、ユーザー生成コンテンツの翻訳を自動化して、多言語の Web サイトを作成および管理します。 翻訳ワークフローを自動化するには、翻訳サービスプロバイダーと AEM とを統合して、コンテンツを複数の言語に翻訳するためのプロジェクトを作成します。AEM では人間による翻訳と機械翻訳のワークフローがサポートされます。

- 人間による翻訳：コンテンツは翻訳プロバイダーに送信され、専門の翻訳者によって翻訳されます。完了すると、翻訳されたコンテンツが返され、AEMに読み込まれます。 翻訳プロバイダーがAEMと統合されると、AEMと翻訳プロバイダーの間でコンテンツが自動的に交換されます

- 機械翻訳：機械翻訳サービスは、コンテンツを直ちに翻訳します


コンテンツの翻訳には次の手順が含まれます。

1. AEMを [翻訳サービスプロバイダー](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/tc-tic.html#ConnectingtoaTranslationServiceProvider) を作成します。 [翻訳統合フレームワークの設定](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/tc-tic.html#CreatingaTranslationIntegrationConfiguration).

1. 言語マスターのページを [翻訳サービスとフレームワークの設定](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/tc-tic.html#ConfiguringPagesforTranslation).

1. 次のタイプを特定： [翻訳するコンテンツ](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/tc-rules.html?lang=ja-JP).

1. [翻訳するコンテンツを準備](https://helpx.adobe.com/jp/experience-manager/6-5/sites/administering/using/tc-prep.html)します。そのためには、言語マスターをオーサリングして、言語コピーのルートページを作成します。

1. 作成 [翻訳プロジェクト](https://experienceleague.adobe.com/docs/experience-manager-65/administering/introduction/tc-manage.html?lang=ja) 翻訳するコンテンツを収集し、翻訳プロセスを準備する場合。

1. 翻訳プロジェクトを使用して、 [コンテンツ翻訳を管理](https://experienceleague.adobe.com/docs/experience-manager-65/administering/introduction/tc-manage.html?lang=ja) プロセス。


翻訳サービスプロバイダーがAEMとの統合にコネクタを提供しない場合、AEMは XML 形式での翻訳コンテンツの手動での書き出しと読み込みをサポートします。

>[!TIP]
>
> 詳しくは、 *翻訳*&#x200B;コンテンツの翻訳に関するベストプラクティスについては、ベストプラクティスガイドの「 」を参照してください。

## DITA マップダッシュボードの「翻訳」タブを設定します。

「翻訳タブを非表示にする」オプションはデフォルトでは有効になっていないので、configMgr から有効にする必要があります。 DITA マップダッシュボードで「翻訳」タブを非表示にするには、次の手順を実行します。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. を選択します。 **「翻訳」タブを非表示にする** 「 」オプションを使用して、マップダッシュボードの「翻訳」タブを非表示にします。

   >[!NOTE]
   >
   > このプロパティはデフォルトで無効になっており、「翻訳」タブはマップダッシュボードで使用できます。

1. 「**保存**」をクリックします。

## コンポーネントベースの翻訳ワークフローの設定

翻訳ベンダーのコネクタが DITA コンテンツをサポートしていない場合は、コンポーネントベースの翻訳ワークフローを有効にする必要があります。 有効にすると、翻訳可能なコンテンツがアセットメタデータとして送信されます。 ただし、このワークフローを機能させるには、コネクタがアセットメタデータの翻訳をサポートする必要があります。

設定で使用した翻訳ワークフローに基づいて、コンポーネントベースの翻訳ワークフローオプションを次のように設定する必要があります。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. を設定します。 **コンポーネントベースの DITA 翻訳ワークフロー** 設定に従って：

   - 人間による翻訳を使用している場合は、 *無効にする* の **コンポーネントベースの翻訳ワークフロー** オプション。

   - 機械翻訳を使用している場合は、 *有効にする* の **コンポーネントベースの翻訳ワークフロー** オプション。

   >[!NOTE]
   >
   > 翻訳コネクタを使用している場合は、「 *[翻訳統合フレームワークの設定](https://helpx.adobe.com/experience-manager/6-5/sites/administering/using/tc-tic.html)* トピック (AEMドキュメント ) を参照してください。

1. 「**保存**」をクリックします。


>[!IMPORTANT]
>
> 翻訳設定をセットアップしたら、必ず言語フォルダーで適切なクラウド設定をおこなってください。

## 一時的な言語コピーの後処理の設定

翻訳ワークフローを開始すると、ソースコンテンツの一時的な言語コピーが作成されます。 これらの一時ファイルに対する後処理操作の有効/無効を切り替えることができます。 後処理操作では、ファイルからの受信および送信参照が解決され、ドキュメントの状態が他の操作と共に設定されます。 これらの一時ファイルの後処理を有効にすると、翻訳プロセスの完了に時間がかかる場合があります。 したがって、後処理オプションを無効にしておくことをお勧めします。

デフォルトでは、「一時ファイルの後処理」オプションは無効になっています。 このオプションは、次の手順で設定できます。

1. Adobe Experience Manager Web コンソール設定ページを開きます。

   設定ページにアクセスするデフォルトの URL は次のとおりです。

   ```http
   http://<server name>:<port>/system/console/configMgr
   ```

1. を検索して、 **com.adobe.fmdita.config.ConfigManager** バンドル。

1. を設定します。 **後処理の言語コピー** 設定に従って：

   - \(*デフォルト*\) 一時ファイルに対して後処理操作を実行しない場合は、 *無効にする* の **後処理の言語コピー** オプション。

   - 一時ファイルに対して後処理操作を実行する場合は、 *有効にする* の **後処理の言語コピー** オプション。

1. 「**保存**」をクリックします。
