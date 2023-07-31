---
title: Adobe Experience Managerガイドのアップグレード
description: Adobe Experience Managerガイドのアップグレード方法を説明します。
exl-id: fdc395cf-a54f-4eca-b69f-52ef08d84a6e
source-git-commit: bb7e9ae6f02021354285aa4ca6b435bbea2e4cc0
workflow-type: tm+mt
source-wordcount: '3270'
ht-degree: 1%

---

# Adobe Experience Managerガイドのアップグレード {#id224MBE0M0XA}

>[!NOTE]
>
> ライセンス版の製品に固有のアップグレード手順に従ってください。

現在のバージョンのAEMガイドをバージョン 4.3.0 にアップグレードできます

- バージョン 4.2 または 4.2.x を使用している場合は、直接バージョン 4.3.0 にアップグレードできます。
- バージョン 4.1 または 4.1.x を使用している場合は、バージョン 4.3.0 にアップグレードする前に、バージョン 4.2 または 4.2.x にアップグレードする必要があります。
- バージョン 4.0 を使用している場合は、バージョン 4.3.0 にアップグレードする前に、バージョン 4.2 にアップグレードする必要があります。
- バージョン 3.8.5 を使用している場合は、バージョン 4.2 にアップグレードする前に、バージョン 4.0 にアップグレードする必要があります。
- 3.8.5 より前のバージョンを使用している場合は、製品固有のインストールガイドの「 AEMガイドのアップグレード」の節を参照してください。


>[!NOTE]
>
> AEM Guides バージョンをアップグレードする前に、AEM Service Pack をインストールする必要があります。

詳しくは、次の手順を参照してください。

- [3.8.5 からバージョン 4.0 へのアップグレード](#id2256DK003E1)
- [バージョン 4.2 へのアップグレード](#id22A3F500SXA)
- [バージョン 4.2.1 へのアップグレード](#upgrade-version-4-2-1)
- [バージョン 4.3.0 へのアップグレード](#upgrade-version-4-3)


>[!IMPORTANT]
>
> アップグレードを開始する前に、完全なシステムバックアップを取り、データの損失を防ぎます。

## バージョン 3.8.5 からバージョン 4.0 へのアップグレード {#id2256DK003E1}

AEM Guides バージョン 3.8.5 を使用している場合は、AEM Guides のバージョン 4.0 にアップグレードできます。 アップグレード機能を使用すると、以前のバージョンのAEM Guides をアンインストールする必要がなくなります。

プロセスを実行する前に、完了する必要があるタスクがあります。 以下のサブセクションでは、前提条件、レポートの生成、移行プロセスについて説明します。 また、AEM Guides バージョン 4.0 をインストールした後は、お客様の設定に応じて様々な設定をカスタマイズできます。

>[!NOTE]
>
> このアップグレードプロセスは、バージョン 3.8.5 からバージョン 4.0 へのみ適用されます。バージョン 3.4 以降から 3.8.5 にアップグレードするプロセスについては、 *アップグレードAEMガイド* の製品固有のインストールガイドの「 」セクションを参照してください。 [ヘルプのアーカイブページ](https://helpx.adobe.com/xml-documentation-for-experience-manager/archive.html).

****前提条件****

AEM Guide のアップグレードプロセスを開始する前に、以下が行われていることを確認します。

1. トピック内のレビューコメントを読み込んでレビュー用に開きました。
1. すべてのアクティブなレビューを閉じました。
1. すべての翻訳タスクを閉じました。
1. AEMガイドの以前のバージョン（メジャーまたはパッチリリース）の上部にインストールされているAEM Guide のホットフィックスをアンインストールします。

**バージョン 4.0 をインストールする前に**

バージョン 4.0 をインストールする前に、次の手順を実行します。

1. この時点で、AEMガイドがバージョン 3.8.5 にあることを確認します。
1. アップグレードスクリプトパッケージをダウンロードします。 そのためには、で「XML Documentation solution 4.0 Upgrade Package」を検索してください。 [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html) zip ファイルをダウンロードします。
1. パッケージマネージャーを使用してこのパッケージをAEMにアップロードし、このパッケージをインストールします。
1. アップグレードパッケージをインストールしたら、以下のスクリプトを同じ順序で実行し、指定された手順に従います。

**アップグレード互換性 API を確認する**

この API は、現在のシステムの状態を評価し、アップグレードが可能かどうかを報告するように設計されています。 このスクリプトを実行するには、次の特定のエンドポイントをトリガーします。

| 終点 | /bin/dxml/upgrade/3xto4x/report |
| --- | --- |
| リクエストタイプ | **GET** AEMインスタンスに管理者としてログインしている Web ブラウザーを使用できます。 |
| 予想される応答 |  — 必要なすべてのノードを移動できる場合は、合格のチェックが表示されます。 <br> — ターゲットの場所にノードが存在する場合は、関連するエラーが表示されます。 リポジトリ\(delete node /var/dxml\) をクリーンアップし、アップグレードパッケージを再インストールしてから、このエンドポイントを再度トリガーします。 <br>**注意：** 3.x AEMガイドでは、target の場所は以前は使用されていないので、これは一般的なエラーではありません。 <br>  — このスクリプトが成功しない場合は、続行せずに、カスタマーサクセスチームに報告してください。 |

**システムデータ移行 API**

この API は、 **移行マッピング** 」セクションに入力します。

1. アップグレード互換性 API のチェックに失敗した場合は、このスクリプトを実行しないでください\（続行しないでください\）。
1. アップグレード互換性の確認 API が正常に返されたら、アップグレードスクリプトを実行できます。

| 終点 | /bin/dxml/upgrade/3xto4x |
| --- | --- |
| リクエストタイプ | **POST** このスクリプトはPOSTリクエストなので、Postmanなどのエージェントを介して実行する必要があります。 |
| 予想される応答 |  — 移行が正常に完了したら、XML Documentationソリューションバージョン 4.0 をインストールできます。<br> — エラーが発生した場合は、最後のチェックポイントに復元し、エラーログと API 出力を顧客成功チームと共有します。 |

**移行マッピング**：上記の API は、ソースの場所にあるすべてのデータをターゲットの場所に移行します。

| ソース | ターゲット |
|------|------|
| /content/fmdita | /var/dxml |
| /content/dxml | /var/dxml |
| /etc/fmdita | /libs/fmdita |

## バージョン 4.0 のインストール {#id23598G006XA}

1. バージョン 4.0 は、アップグレード手順が正常に完了した場合にのみインストールします。
1. から 4.0 バージョンのパッケージをダウンロード [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html):

   - UUID バージョンのソフトウェアを使用している場合は、「4.0 UUID Release for AEM 6.5」を検索します。
   - 非 UUID バージョンのソフトウェアを使用している場合、「4.0 Non-UUID Release for AEM 6.5」を検索してください。
CRX パッケージマネージャーを使用して既存のAEMサーバーインスタンスにパッケージをアップロードし、インストールします。

   >[!NOTE]
   >
   > すべてのシステムコンポーネントが起動するのを待ちます。

1. パッケージをインストールした後で、ブラウザーのキャッシュをクリアします。
1. Dispatcher が AEM オーサーインスタンス上に設定されている場合は、次の手順を実行します。
   - 以下が Dispatcher のルールで処理されることを確認します。
   - URL パターン/home/users/\*/preferences がホワイトリストに登録されている。
   - URL パターン/libs/cq/security/userinfo.jsonはキャッシュされていません。
1. Dispatcher キャッシュをクリア\( すべての `clientlibs` キャッシュ\) で使用できます。

## バージョン 4.2 へのアップグレード {#id22A3F500SXA}

バージョン 4.2 へのアップグレードは、AEMガイドの現在のバージョンに依存します。

バージョン 4.0、4.1 または 4.1.x を使用している場合は、直接バージョン 4.2 にアップグレードできます。

****前提条件****

AEM Guides 4.2 のアップグレードプロセスを開始する前に、以下が行われていることを確認します。

1. AEM Guide バージョン 4.0、4.1 または 4.1.x にアップグレードしました。
1. すべての翻訳タスクを閉じました。
1. ログレベルをに変更しました。 **情報** 対象： `com.adobe.fmdita.translationservices.TranslationMapUpgradeScript` クラスを作成し、新しいログファイルにこれらのログを追加します。例： `logs/translation_upgrade.log.`

>[!NOTE]
>
> アクティブなレビューをすべて閉じる必要があります。 4.2 へのアップグレード中にレビュータスクが閉じられない場合、古い進行中のレビュータスクは古いレビューページでユーザーを引き続き取り、アップグレード後に作成されたレビュータスクは機能の最新の更新を表示します。

## バージョン 4.2 のインストール {#id2245IK0E0EV}

1. から 4.2 バージョンのパッケージをダウンロード [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
1. バージョン 4.2 パッケージをインストールします。
1. パッケージのインストールが完了したら、ログで次のメッセージが表示されるまで待ちます。

   `Completed the post deployment setup script`

   上記のメッセージは、インストールのすべての手順が完了したことを示しています。

   次の ERROR プレフィックスが表示された場合は、カスタマーサクセスチームに報告してください。

   - デプロイメント設定後のスクリプトでエラーが発生しました
   - 翻訳 MAP の移植中に例外が発生しました
   - プロパティの v1 から v2 に翻訳マップをポートできません
1. バージョン 4.2 でリリースされた Oxygen コネクタプラグインをアップグレードします（必要に応じて）。
1. パッケージをインストールした後で、ブラウザーのキャッシュをクリアします。
1. 次の節で詳しく説明するように、カスタマイズのアップグレードを続行します。

## バージョン 4.2 のインストール後 {#id2326F02004K}

>[!IMPORTANT]
>
> アップグレードされたサーバーにハイテクテンプレートが表示されません。 サーバーにハイテクテンプレートを組み込むには、コピーします。ソース： /libs/fmdita/pdf/Hi-Tech Destination: /content/dam/dita-templates/pdf

AEMガイドをインストールした後、新しくインストールされたバージョンから設定に適用される様々な設定を結合できます。

>[!NOTE]
>
> dam-update-asset モデルはカスタマイズできます。 したがって、カスタマイズが行われている場合は、カスタマイズとAEMガイドをモデルの作業用コピーに同期する必要があります。

1. **DAM アセットの更新ワークフロー（後処理の変更）:**

1. URL を開く：

   ```http
   http://localhost:4502/libs/cq/workflow/admin/console/content/models.html
   ```

1. 選択 **DAM アセットの更新ワークフロー**.
1. **編集**&#x200B;をクリックします。
1. 次の場合、 **DXML Post Process Initiator** コンポーネントが存在する場合は、カスタマイズが同期されていることを確認してください。
1. 次の場合、 **DXML Post Process Initiator** コンポーネントが存在しない場合は、次の手順を実行して挿入します。

1. クリック **コンポーネントを挿入** \( プロセスの最後のステップとしてのAEMガイドの後処理を担当します。)
1. を設定します。 **処理ステップ** 次の詳細を含む：

   **「共通」タブ**

   **タイトル：** DXML Post Process Initiator

   **説明**：変更または作成されたアセットの DXML 後処理のための Sling ジョブをトリガーする、DXML 後処理開始者ステップ。

   **「プロセス」タブ**

   - 選択 **DXML Post Process Initiator**&#x200B;から **プロセス** ドロップダウン

   - 選択 **ハンドラー処理の設定**

   - 選択 **完了**

1. クリック **同期** をクリックします。 成功通知が届きます。

   >[!NOTE]
   >
   > 更新して、カスタマイズされた変更とAEMガイドの後処理手順が最終的なワークフローモデルに存在することを確認します。

1. 1 回 **DAM アセットの更新ワークフロー**&#x200B;が検証された場合は、対応するランチャー設定を確認します。 これをおこなうには、AEM Workflow インターフェイスに移動してランチャーを開きます。

   ```http
   http://localhost:4502/libs/cq/workflow/content/console.html
   ```

   次に対応する\（必要に応じて\）次の 2 つのランチャー\（アクティブにする必要がある\）を検索し、変更します。 **DAM アセットの更新ワークフロー**:

1. 「 」のランチャー&#x200B;*作成されたノード*」が **DAM アセットの更新ワークフロー** — 条件の場合 `"jcr:content/jcr:mimeType!=video"`に設定する場合、「グロビング」の値は次のようにする必要があります。

   ```json
   /content/dam(/((?!/subassets|/translation_output).)*/)renditions/original
   ```

   - &#39;excludeList&#39;には `"event-user-data:changedByWorkflowProcess"`.
   - 「 」のランチャー&#x200B;*変更されたノード*」が **DAM アセットの更新ワークフロー —** 条件&quot;`jcr:content/jcr:mimeType!=video`&quot;,
   - 「グロビング」の値は次のようにする必要があります。

   ```json
   /content/dam(/((?!/subassets|/translation_output).)*/)renditions/original
   ```

   - &#39;excludeList&#39;には `"event-user-data:changedByWorkflowProcess"`.
1. アップグレードが完了したら、カスタマイズ/オーバーレイが検証され、新しいアプリケーションコードに合わせて更新されることを確認します。 以下に例を示します。
   - /libs/fmditaor/libs からオーバーレイされたコンポーネントは、新しい製品コードと比較する必要があります。また、/apps の下のオーバーレイされたファイルで更新を行う必要があります。
   - 製品から使用される clientlib カテゴリは、変更の確認が必要です。 最新の機能を取得するには、上書きされた設定（以下の例を参照）を最新の設定と比較する必要があります。
   - elementmapping.xml
   - ui\_config.json\（フォルダープロファイルに設定されている可能性があります）
   - 修正済み `com.adobe.fmdita.config.ConfigManager`
   - 任意の古いパスを使用していたカスタムコードがあるかどうかを確認します。 [移行マッピング](#id2244LE040XA) section\) — カスタマイズも期待どおりに機能するように、新しいパスに更新する必要があります。
1. 現在のリリースで導入された新しい設定についてお読みください\( [リリースノート](../release-info/release-notes-4.3.md)\) をクリックし、影響を受ける機能があるかどうかを確認して、適切なアクションを実行します。 例えば、バージョン 4.0 で導入された「ファイルとバージョンの処理の改善」を利用し、その場合、設定を有効にする必要があります。

## 新しい検索と置換を使用する既存のコンテンツのインデックスを作成する手順は次のとおりです。

既存のコンテンツのインデックスを作成し、マップレベルで新しい検索と置換テキストを使用するには、次の手順を実行します。

- POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. \( オプション：インデックスを作成するマップの特定のパスを渡すことができます。デフォルトでは、すべてのマップにインデックスが作成されます\|\|例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`\)

- API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。

`http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)

- ジョブが完了すると、上記のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。

アップグレードジョブが失敗し、エラーログに次のエラーが表示される場合：

「 *クエリ* より多くを読む、または横断する *100000ノード*. 他のタスクへの影響を回避するため、処理は停止しました。」

これは、アップグレードで使用されるクエリに対してインデックスが適切に設定されていないために発生する可能性があります。 次の回避策を試すことができます。

1. damAssetLucene oak インデックスに、ブールプロパティを追加します。 `indexNodeName` as `true` ノード内に配置されます。
   `/oak:index/damAssetLucene/indexRules/dam:Asset`
1. ノードの下に、名前抜粋を含む新しいノードを追加します。

   `/oak:index/damAssetLucene/indexRules/dam:Asset/properties`
ノードで次のプロパティを設定します。

   ```
   name - rep:excerpt
   propertyIndex - {Boolean}true
   notNullCheckEnabled - {Boolean}true
   ```

   の構造 `damAssetLucene` は次のようになります。

   ```
   <damAssetLucene compatVersion="{Long}2" async="async, nrt" jcr:primaryType="oak:QueryIndexDefinition" evaluatePathRestrictions="{Boolean}true" type="lucene">
   <indexRules jcr:primaryType="nt:unstructured">
     <dam:Asset indexNodeName="{Boolean}true" jcr:primaryType="nt:unstructured">
       <properties jcr:primaryType="nt:unstructured">
         <excerpt name="rep:excerpt" propertyIndex="{Boolean}true" jcr:primaryType="nt:unstructured" notNullCheckEnabled="{Boolean}true"/>
       </properties>
       </dam:Asset>
     </indexRules>
   </damAssetLucene>    
   ```


   （他の既存のノードおよびプロパティと共に）

1. インデックスの再作成 `damAssetLucene` index （reindex フラグを次のように設定） `true` その下に `false` 再び（これは、インデックス再作成が完了したことを示します）。 インデックスのサイズによっては、数時間かかる場合があります。
1. 前の手順を実行して、インデックス作成スクリプトを再実行します。


## バージョン 4.2.1 へのアップグレード {#upgrade-version-4-2-1}

バージョン 4.2.1 へのアップグレードは、AEMガイドの現在のバージョンに依存します。

バージョン 4.1、4.1.x、4.2 を使用している場合は、直接バージョン 4.2.1 にアップグレードできます。

>[!NOTE]
>
>後処理とインデックス作成には、数時間かかる場合があります。 オフピーク時にアップグレードプロセスを開始することをお勧めします。

****前提条件****

AEM Guides 4.2.1 のアップグレードプロセスを開始する前に、以下が行われていることを確認します。

1. AEMガイドバージョン 4.1、4.1.x、または 4.2 にアップグレードしました。
1. すべての翻訳タスクを閉じました。
1. ログレベルをに変更しました。 **情報** 対象： `com.adobe.fmdita.translationservices.TranslationMapUpgradeScript` クラスを作成し、新しいログファイルにこれらのログを追加します。例： `logs/translation_upgrade.log.`

>[!NOTE]
>
> アクティブなレビューをすべて閉じる必要があります。 4.2 へのアップグレード中にレビュータスクが閉じられない場合、古い進行中のレビュータスクは古いレビューページでユーザーを引き続き取り、アップグレード後に作成されたレビュータスクは機能の最新の更新を表示します。

## バージョン 4.2.1 のインストール

1. 4.2.1 バージョンパッケージをからダウンロードします。 [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
1. バージョン 4.2.1 パッケージをインストールします。
1. 「トリガーをヒット」を選択して、翻訳マップのアップグレードジョブを開始できます。 詳しくは、 [サーブレットを介したスクリプトのトリガーの有効化](#enable-trigger-serverlet).


1. パッケージのインストールが完了したら、ログで次のメッセージが表示されるまで待ちます。

   `Completed the post deployment setup script`

   上記のメッセージは、インストールのすべての手順が完了したことを示しています。

   次の ERROR プレフィックスが表示された場合は、カスタマーサクセスチームに報告してください。

   - デプロイメント設定後のスクリプトでエラーが発生しました
   - 翻訳 MAP の移植中に例外が発生しました
   - プロパティの v1 から v2 に翻訳マップをポートできません
1. バージョン 4.2 でリリースされた Oxygen コネクタプラグインをアップグレードします（必要に応じて）。
1. パッケージをインストールした後で、ブラウザーのキャッシュをクリアします。
1. 次の節で詳しく説明するように、カスタマイズのアップグレードを続行します。

### サーブレットを介したスクリプトのトリガーの有効化{#enable-trigger-serverlet}

POST:

```
http://localhost:4503/bin/guides/script/start?jobType=translation-map-upgrade
```

応答:

```
{
"msg": "Job is successfully submitted and lock node is created for future reference",
"lockNodePath": "/var/dxml/executor-locks/translation-map-upgrade/1683190032886",
"status": "SCHEDULED"
}
```

上記の応答 JSON で、キー `lockNodePath` は、送信されたジョブを指す、リポジトリで作成されたノードへのパスを保持します。 ジョブが完了すると自動的に削除され、それまでは、このノードを参照してジョブの現在のステータスを確認できます。

サンプルログ：次に、スクリプトのトリガー後にログファイルに表示されるログの例を示します。

```
04.05.2023 14:17:12.876 *INFO* [[0:0:0:0:0:0:0:1] [1683190032736] POST /bin/guides/script/start HTTP/1.1] com.adobe.dxml.common.executor.RunnableSynchronizedOTS Acquiring lock for job : translation-map-upgrade
04.05.2023 14:17:12.897 *INFO* [pool-59-thread-1] com.adobe.fmdita.xmltranslation.ots.TranslationMapUpgradeOTS Starting the thread to upgrade translation map from V1 to V2
04.05.2023 14:17:12.899 *INFO* [pool-59-thread-1] com.adobe.dxml.common.executor.RunnableSynchronizedOTS Initiating lock for node : /var/dxml/executor-locks/translation-map-upgrade/1683190032886
04.05.2023 14:17:12.901 *INFO* [pool-59-thread-1] com.adobe.fmdita.translationservices.TranslationMapUpgradeScript Starting porting of translation map from V1 to V2
04.05.2023 14:17:12.904 *INFO* [pool-59-thread-1] com.adobe.fmdita.translationservices.TranslationMapUpgradeScript Memory increase is of : 764 kB
04.05.2023 14:17:12.906 *INFO* [pool-59-thread-1] com.adobe.fmdita.translationservices.TranslationMapUpgradeScript Completed porting of translation map from V1 to V2
04.05.2023 14:17:12.907 *INFO* [pool-59-thread-1] com.adobe.dxml.common.executor.RunnableSynchronizedOTS Releasing lock for node : /var/dxml/executor-locks/translation-map-upgrade/1683190032886
04.05.2023 14:17:12.909 *INFO* [pool-59-thread-1] com.adobe.fmdita.xmltranslation.ots.TranslationMapUpgradeOTS Completed the thread to upgrade translation map from V1 to V2
```

を探す `com.adobe.fmdita.translationservices.TranslationMapUpgradeScript Completed porting of translation map from V1 to V2` および `com.adobe.fmdita.xmltranslation.ots.TranslationMapUpgradeOTS Completed the thread to upgrade translation map from V1 to V2` 次の手順に進む前に、を参照してください。



## バージョン 4.2.1 のインストール後

>[!IMPORTANT]
>
> アップグレードされたサーバーにハイテクテンプレートが表示されません。 サーバーにハイテクテンプレートを組み込むには、コピーします。ソース： /libs/fmdita/pdf/Hi-Tech Destination: /content/dam/dita-templates/pdf

AEMガイドをインストールした後、新しくインストールされたバージョンから設定に適用される様々な設定を結合できます。

>[!NOTE]
>
> dam-update-asset モデルはカスタマイズできます。 したがって、カスタマイズが行われている場合は、カスタマイズとAEMガイドをモデルの作業用コピーに同期する必要があります。

1. **DAM アセットの更新ワークフロー（後処理の変更）:**

1. URL を開く：

   ```http
   http://localhost:4502/libs/cq/workflow/admin/console/content/models.html
   ```

1. 選択 **DAM アセットの更新ワークフロー**.
1. **編集**&#x200B;をクリックします。
1. 次の場合、 **DXML Post Process Initiator** コンポーネントが存在する場合は、カスタマイズが同期されていることを確認してください。
1. 次の場合、 **DXML Post Process Initiator** コンポーネントが存在しない場合は、次の手順を実行して挿入します。

1. クリック **コンポーネントを挿入** \( プロセスの最後のステップとしてのAEMガイドの後処理を担当します。)
1. を設定します。 **処理ステップ** 次の詳細を含む：

   **「共通」タブ**

   **タイトル：** DXML Post Process Initiator

   **説明**：変更または作成されたアセットの DXML 後処理のための Sling ジョブをトリガーする、DXML 後処理開始者ステップ。

   **「プロセス」タブ**

   - 選択 **DXML Post Process Initiator**&#x200B;から **プロセス** ドロップダウン

   - 選択 **ハンドラー処理の設定**

   - 選択 **完了**

1. クリック **同期** をクリックします。 成功通知が届きます。

   >[!NOTE]
   >
   > 更新して、カスタマイズされた変更とAEMガイドの後処理手順が最終的なワークフローモデルに存在することを確認します。

1. 1 回 **DAM アセットの更新ワークフロー**&#x200B;が検証された場合は、対応するランチャー設定を確認します。 これをおこなうには、AEM Workflow インターフェイスに移動してランチャーを開きます。

   ```http
   http://localhost:4502/libs/cq/workflow/content/console.html
   ```

   次に対応する\（必要に応じて\）次の 2 つのランチャー\（アクティブにする必要がある\）を検索し、変更します。 **DAM アセットの更新ワークフロー**:

1. 「 」のランチャー&#x200B;*作成されたノード*」が **DAM アセットの更新ワークフロー** — 条件の場合 `"jcr:content/jcr:mimeType!=video"`に設定する場合、「グロビング」の値は次のようにする必要があります。

   ```json
   /content/dam(/((?!/subassets|/translation_output).)*/)renditions/original
   ```

   - &#39;excludeList&#39;には `"event-user-data:changedByWorkflowProcess"`.
   - 「 」のランチャー&#x200B;*変更されたノード*」が **DAM アセットの更新ワークフロー —** 条件&quot;`jcr:content/jcr:mimeType!=video`&quot;、「グロビング」の値は次のようにする必要があります。

   ```json
   /content/dam(/((?!/subassets|/translation_output).)*/)renditions/original
   ```

   - `excludeList` は、 `"event-user-data:changedByWorkflowProcess"`.

1. アップグレードが完了したら、カスタマイズ/オーバーレイが検証され、新しいアプリケーションコードに合わせて更新されることを確認します。 以下に例を示します。
   - /libs/fmditaor/libs からオーバーレイされたコンポーネントは、新しい製品コードと比較する必要があります。また、/apps の下のオーバーレイされたファイルで更新を行う必要があります。
   - 製品から使用される clientlib カテゴリは、変更の確認が必要です。 最新の機能を取得するには、上書きされた設定（以下の例を参照）を最新の設定と比較する必要があります。
   - elementmapping.xml
   - ui\_config.json\（フォルダープロファイルに設定されている可能性があります）
   - 修正済み `com.adobe.fmdita.config.ConfigManager`
   - 任意の古いパスを使用していたカスタムコードがあるかどうかを確認します。 [移行マッピング](#id2244LE040XA) section\) — カスタマイズも期待どおりに機能するように、新しいパスに更新する必要があります。
1. 現在のリリースで導入された新しい設定についてお読みください\( [リリースノート](../release-info/release-notes-4.2.1.md)\) をクリックし、影響を受ける機能があるかどうかを確認して、適切なアクションを実行します。 例えば、バージョン 4.0 で導入された「ファイルとバージョンの処理の改善」を利用し、その場合、設定を有効にする必要があります。

## 新しい検索と置換を使用する既存のコンテンツのインデックスを作成する手順は次のとおりです。

既存のコンテンツのインデックスを作成し、マップレベルで新しい検索と置換テキストを使用するには、次の手順を実行します。

- 次の点を確認します。 `damAssetLucene` インデックス作成が完了しました。 サーバー上に存在するデータの量に応じて、最大で数時間かかる場合があります。 インデックス再作成の完了を確認するには、で、再インデックスフィールドが false に設定されていることを確認します。
  `http://<server:port>/oak:index/damAssetLucene`.  また、 `damAssetLucene`の場合は、再度適用する必要が生じる場合があります。

- POSTリクエストをサーバーに対して実行します\（正しい認証で） - `http://<server:port\>/bin/guides/map-find/indexing`. （オプション）マップの特定のパスを渡してインデックスを作成できます。デフォルトでは、すべてのマップにインデックスが作成されます。例： `https://<Server:port\>/bin/guides/map-find/indexing?paths=<map\_path\_in\_repository\>`)

- また、ルートフォルダーを渡して、特定のフォルダー（およびそのサブフォルダー）の DITA マップのインデックスを作成することもできます。 （例：`http://<server:port\>/bin/guides/map-find/indexing?root=/content/dam/test`）。paths パラメーターと root パラメーターの両方が渡される場合は、paths パラメーターのみが考慮されます。

- API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。 `http://<server:port\>/bin/guides/map-find/indexing?jobId=\{jobId\}`\( 例： `http://localhost:8080/bin/guides/map-find/indexing?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42`\)


- ジョブが完了すると、上記のGETリクエストは成功と共に応答し、マップが失敗した場合はメンションします。 正常にインデックス付けされたマップは、サーバーログから確認できます。


## バージョン 4.3.0 へのアップグレード {#upgrade-version-4-3}

バージョン 4.3.0 へのアップグレードは、AEMガイドの現在のバージョンに依存します。 バージョン 4.2 または 4.2.x を使用している場合は、直接バージョン 4.3.0 にアップグレードできます。

>[!NOTE]
>
>後処理とインデックス作成には、数時間かかる場合があります。 オフピーク時にアップグレードプロセスを開始することをお勧めします。

****前提条件****

AEM Guides 4.3.0 のアップグレードプロセスを開始する前に、以下が行われていることを確認します。

1. AEM Guide バージョン 4.2 または 4.2.x にアップグレードし、それぞれのインストール手順を完了しました。
1. すべての翻訳タスクを閉じました。



## バージョン 4.3.0 のインストール

1. 4.3.0 バージョンパッケージをからダウンロードします。 [Adobeソフトウェア配布ポータル](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
1. バージョン 4.3.0 パッケージをインストールします。
1. パッケージをインストールした後で、ブラウザーのキャッシュをクリアします。
1. のアップグレード `ui_config.json` ファイルを **XML エディターの設定** 」タブをクリックします。


## バージョン 4.3.0 のインストール後

AEMガイドをインストールした後、新しくインストールされたバージョンから設定に適用される様々な設定を結合できます。

## リンク切れレポートを使用するために既存のコンテンツを後で処理する手順


既存のコンテンツを後処理し、新しい壊れたリンクレポートを使用するには、次の手順を実行します。

1. （オプション）システム内に 100,000 個を超える DITA ファイルがある場合、 `queryLimitReads` under `org.apache.jackrabbit.oak.query.QueryEngineSettingsService` を大きい値 ( 存在するアセットの数（例：200,000）を超える値 ) に設定し、再デプロイします。

   | PID | プロパティキー | プロパティの値 |
   |---|---|---|
   | org.apache.jackrabbit.oak.query.QueryEngineSettingsService | queryLimitReads | 値：200000 <br> デフォルト値：100000 |

1. 次の API を実行して、すべてのファイルの後処理を実行します。

   | 終点 | /bin/guides/reports/upgrade |
   |---|---|
   | リクエストタイプ | **POST**  このスクリプトはPOSTリクエストなので、Postmanなどのエージェントを介して実行する必要があります。 |
   | 予想される応答 | API は jobId を返します。 ジョブのステータスを確認するには、ジョブ ID を持つGETリクエストを同じエンドポイントに送信します。<br> サンプル URL: `http://<server:port>/bin/guides/reports/upgrade` |

   | 終点 | /bin/guides/reports/upgrade |
   |---|---|
   | リクエストタイプ | **GET** |
   | パラメーター | jobId：前の post リクエストから受け取った jobId を渡します。 |
   | 予想される応答 |  — ジョブが完了すると、GETリクエストへの応答が成功します。 <br>  — エラーが発生した場合は、エラーログと API 出力を顧客成功チームと共有します。  <br>サンプル URL: `http://<server:port>/bin/guides/reports/upgrade?jobId=2022/9/15/7/27/7dfa1271-981e-4617-b5a4-c18379f11c42_678` |


1. のデフォルト値または以前の既存の値に戻す `queryLimitReads` 手順 1 で変更した場合。

**親トピック：**[&#x200B;ダウンロードとインストール](download-install.md)

