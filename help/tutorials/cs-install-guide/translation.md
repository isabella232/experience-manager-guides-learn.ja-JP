---
title: コンテンツの翻訳
description: コンテンツの翻訳方法を学ぶ
source-git-commit: 4d54c52b8771b0c5a40018cfec3a6586029af2fb
workflow-type: tm+mt
source-wordcount: '711'
ht-degree: 10%

---


# コンテンツの翻訳 {#id181GB0400UI}

ページコンテンツ、アセット、ユーザー生成コンテンツの翻訳を自動化して、多言語の Web サイトを作成および管理します。 翻訳ワークフローを自動化するには、翻訳サービスプロバイダーをAEMと統合し、コンテンツを複数の言語に翻訳するためのプロジェクトを作成します。 AEMは、人間による翻訳ワークフローと機械翻訳ワークフローをサポートしています。

- 人間による翻訳：コンテンツは翻訳プロバイダーに送信され、専門の翻訳者によって翻訳されます。完了すると、翻訳されたコンテンツが返され、AEMに読み込まれます。 翻訳プロバイダーがAEMと統合されると、AEMと翻訳プロバイダーの間でコンテンツが自動的に交換されます

- 機械翻訳：機械翻訳サービスは、コンテンツを直ちに翻訳します


コンテンツの翻訳には次の手順が含まれます。

1. AEMを [翻訳サービスプロバイダー](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/integration-framework.html?lang=en) 翻訳統合フレームワーク設定を作成します。

1. 翻訳サービスとフレームワークの設定に言語マスターのページを関連付けます。

1. 次のタイプを特定： [翻訳するコンテンツ](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/rules.html?lang=en).

1. [翻訳するコンテンツを準備](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/preparation.html?lang=en)します。そのためには、言語マスターをオーサリングして、言語コピーのルートページを作成します。

1. 作成 [翻訳プロジェクト](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/managing-projects.html?lang=ja) 翻訳するコンテンツを収集し、翻訳プロセスを準備する場合。

1. 翻訳プロジェクトを使用して、 [コンテンツ翻訳を管理](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/managing-projects.html?lang=ja) プロセス。


翻訳サービスプロバイダーがAEMとの統合にコネクタを提供しない場合、AEMは XML 形式での翻訳コンテンツの手動での書き出しと読み込みをサポートします。

>[!TIP]
>
> 詳しくは、 *翻訳* コンテンツの翻訳に関するベストプラクティスについては、ベストプラクティスガイドの節を参照してください。

## DITA マップダッシュボードの「翻訳」タブを設定します。

DITA マップダッシュボードで「翻訳」タブを非表示にするには、次の手順を実行します。

1. に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。
1. 設定ファイルで、マップダッシュボードの翻訳タブを設定する次の\（プロパティ\）詳細を指定します。

   | PID | プロパティキー | プロパティの値 |
   |---|------------|--------------|
   | `com.adobe.fmdita.config.ConfigManager` | `tabs.translation` | ブール値\( true/ false\)。<br> **デフォルト値**: `true` |

   >[!NOTE]
   >
   > この設定はデフォルトで有効になっており、マップダッシュボードでは「翻訳」タブを使用できません。


## コンポーネントベースの翻訳ワークフローの設定

翻訳ベンダーのコネクタが DITA コンテンツをサポートしていない場合は、コンポーネントベースの翻訳ワークフローを有効にする必要があります。 有効にすると、翻訳可能なコンテンツがアセットメタデータとして送信されます。 ただし、このワークフローを機能させるには、コネクタがアセットメタデータの翻訳をサポートする必要があります。

設定で使用した翻訳ワークフローに基づいて、コンポーネントベースの翻訳ワークフローオプションを設定する必要があります。 に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。 設定ファイルで、次の\（プロパティ\）詳細を指定して、コンポーネントベースの翻訳ワークフローを設定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `component.translation` | ブール値： <br>  — 人間による翻訳を使用している場合、 *無効にする* \( `false`\) **コンポーネントベースの翻訳ワークフロー** オプション。 <br>  — 機械翻訳を使用している場合は、 *\( `true`\)* の **コンポーネントベースの翻訳ワークフロー** オプション。 |

>[!NOTE]
>
> 翻訳コネクタを使用している場合は、「 *[翻訳統合フレームワークの設定](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/sites/administering/reusing-content/translation/integration-framework.html?lang=en)* トピック (AEMドキュメント ) を参照してください。

>[!IMPORTANT]
>
> 翻訳設定をセットアップしたら、必ず言語フォルダーで適切なクラウド設定をおこなってください。

## 一時的な言語コピーの後処理の設定

翻訳ワークフローを開始すると、ソースコンテンツの一時的な言語コピーが作成されます。 これらの一時ファイルに対する後処理操作の有効/無効を切り替えることができます。 後処理操作では、ファイルからの受信および送信参照が解決され、ドキュメントの状態が他の操作と共に設定されます。 これらの一時ファイルの後処理を有効にすると、翻訳プロセスの完了に時間がかかる場合があります。 したがって、後処理オプションを無効にしておくことをお勧めします。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。 設定ファイルで、一時的な言語コピーの後処理を設定する次の\（プロパティ\）の詳細を指定します。

| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.config.ConfigManager` | `postprocess.temporary.langcopies` | ブール値： <br>  — 一時ファイルに対して後処理操作を実行しない場合は、 *無効にする* \( false\) **後処理の言語コピー** オプション。<br>  — 一時ファイルに対して後処理操作を実行する場合は、 *有効にする* \(true\) **後処理の言語コピー** オプション。<br> **デフォルト値**: false |

