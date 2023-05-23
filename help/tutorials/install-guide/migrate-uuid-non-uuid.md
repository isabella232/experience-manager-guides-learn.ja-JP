---
title: 非 UUID から UUID へのコンテンツの移行
description: 非 UUID から UUID コンテンツへの移行方法を説明します。
source-git-commit: 5ac066bb8db32944abd046f64da11eeb1bdbe467
workflow-type: tm+mt
source-wordcount: '373'
ht-degree: 2%

---


# 非 UUID から UUID へのコンテンツの移行 {#id226TI0U20XA}

>[!IMPORTANT]
>
> UUID 以外のコンテンツは、UUID サーバーに移行できます。 UUID サーバーに移行するには、AEMガイドバージョン 4.0 がインストールされた非 UUID サーバーが必要です。

UUID 以外のコンテンツを移行するには、次の手順を実行します。

>[!NOTE]
>
> 各手順が重要で、手順が欠落すると、サーバーデータの障害や破損が発生する可能性があります。 すべての手順を完了していることを確認します。

1. 以下を確認します。 **後処理ワークフローランチャーの有効化** in *com.adobe.fmdita.config.ConfigManager* および **バージョンの後処理を有効にする** in *com.adobe.fmdita.postprocess.version.PostProcessVersionObservation* が有効になっている。

   ```http
   http://<server name>:<port>/system/console/configMgr/com.adobe.fmdita.config.ConfigManager
   ```

1. 非 UUID バージョンよりも次のメジャーリリースの UUID バージョンをインストールします。 例えば、4.0 以外の UUID ビルドを使用している場合は、UUID バージョン 4.1 をインストールする必要があります。

1. 「ランチャー」タブで、 `http://localhost:4502/libs/cq/workflow/content/console.html`:

   - **DAM アセットの更新** ワークフロー
   - **DAM メタデータの書き戻し** ワークフロー

1. 無効にする **後処理ワークフローランチャーの有効化** in *com.adobe.fmdita.config.ConfigManager* および無効化 **バージョンの後処理を有効にする** in *com.adobe.fmdita.postprocess.version.PostProcessVersionObservation*.

   ```http
   http://<server name>:<port>/system/console/configMgr/com.adobe.fmdita.config.ConfigManager
   ```

1. 別のロガーを `com.adobe.fmdita.uuid.upgrade.UuidUpgrade.`

   ブラウザーの応答は、 /content/uuid-upgrade/logs でも利用できます。

1. より小さいデータを含むフォルダーで指定されたクエリを実行します。 `doReviews=false` /content/dam で実行する前に、次の手順を実行します。 `http://localhost:4502/bin/dxml/uuid_upgrade?root=/content/dam/test&doReviews=false`

   >[!TIP]
   >
   >  フォルダー内のすべてのファイルが正しくアップグレードされ、すべての機能がそのフォルダーに対してのみ機能しているかどうかを確認できます。

**クエリのパラメーター：**

    - &#39;root&#39;:アップグレードが必要なルートフォルダー\( すべてのリポジトリに対して/content/dam を使用します。\)
    - &#39;doReviews&#39;:true/false \( レビューをアップグレードする必要があるかどうか。 デフォルト値は false です。\)
    - &#39;doBaselines&#39;:true/false \( ベースラインをアップグレードする必要があるかどうか。 デフォルト値は true です。\)
    - &#39;processLevel&#39;:-1\（復元なしで失敗しました\）、0\（復元で失敗しました\）、1\（エラーで失敗しました\）、2\（正常にアップグレードされました\）\( 失敗後にスクリプトを再試行すると、「fmUpgradeStatus」 &lt;= processLevel を持つファイルのみが再処理され、それ以外は無視されます。 デフォルト値は 1 です。\)
    - &#39;ignoreImageVersions&#39;:true/false \( 画像のバージョンの処理を無視します。 デフォルト値は false です。\)
    >[！注意 ]
    >
    > フォルダーレベルまたは完全なコンテンツ/dam 上で、または同じフォルダー上で、コンテンツの移行を実行できます（移行を再実行）。

1. サーバーが正常に移行されたら、次のワークフローと後処理を有効にして、サーバー上で作業を続行します。

   - **DAM アセットの更新** ワークフロー
   - **DAM メタデータ** ワークフロー

>[!NOTE]
>
> 移行前に処理されないファイルや破損したファイルがある場合、移行後も破損したままになります。

