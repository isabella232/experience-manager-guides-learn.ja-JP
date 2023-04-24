---
title: ファイルのアップロード
description: ファイルのアップロード方法を説明します
source-git-commit: cc0fbca257d82cc82db5b5da8d263309fd71de55
workflow-type: tm+mt
source-wordcount: '407'
ht-degree: 4%

---


# ファイルのアップロード {#id176FF000JUI}

ほとんどの場合、AEMガイドで使用する既存の DITA コンテンツのリポジトリが存在する可能性があります。 このような既存のコンテンツを使用する場合は、次のいずれかの方法を使用して、コンテンツをAEMリポジトリに一括アップロードできます。

>[!IMPORTANT]
>
> 詳しくは、 [Adobe Experience Manager as a Cloud Service Assets へのデジタルアセットの追加](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/manage/add-assets.html) 詳しくは、AEMでサポートされるコンテンツアップロード方法を参照してください。

## Assets コンソールユーザーインターフェイス

デスクトップ上のコンテンツを選択し、AEMユーザーインターフェイス（Web ブラウザー）上で目的のフォルダーにドラッグできます。 詳しくは、 [アセットのアップロード](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/manage/add-assets.html#upload-assets) (AEMドキュメント )

## AEM デスクトップアプリケーション

クリエイティブプロフェッショナルで、ローカルデスクトップでアセットを管理する場合は、AEMデスクトップアプリケーションを使用します。 これらのアセットを開いて、デスクトップアプリケーションで編集することができます。 また、バージョンを管理し、他のユーザーとファイルを共有することもできます。 詳しくは、 [AEMデスクトップアプリ](https://experienceleague.adobe.com/docs/experience-manager-desktop-app/using/using.html?lang=ja).

## アセット一括取得ツール

大規模な移行や一時的な一括取り込みがある場合は、Asset Bulk Ingestor を使用してコンテンツをアップロードします。 このツールを使用すると、Azure や S3 などのサポートされるデータストアから一括コンテンツをアップロードできます。 詳しくは、 [アセット一括取り込み元](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/manage/add-assets.html?lang=en#asset-bulk-ingestor).

## FrameMaker を使用したバルクアップロード

Adobe FrameMakerには、既存の DITA およびその他の FrameMaker ドキュメントを簡単にアップロードできる強力なAEMコネクタが付属しています\(`.book` および `.fm`\) をAEMに変換します。 1 つのファイルのアップロード、依存関係の有無に関わらず\（コンテンツ参照、相互参照、グラフィックなど）完全なフォルダーのアップロードなど、様々なファイルアップロード機能を使用できます。

FrameMaker でのバルクアップロード機能の使用について詳しくは、 *CRX フォルダーの作成とファイルのアップロード* （FrameMaker ユーザガイド）

## コンテンツのアップロード中にエラー処理が発生しました {#id201MI0I04Y4}

1 つ以上のファイルのアップロードに失敗した場合は、アップロードプロセスの最後にプロンプトが表示され、アップロードに失敗したファイルのリストが表示されます。

![](images/uuid-files-failed-to-upload_cs.png){width="650" align="center"}

様々なファイルアップロードシナリオについて詳しくは、 [DITA コンテンツのアップロード](authoring-file-management.md#).

AEMデスクトップアプリケーションや Asset Bulk Ingestor などのツールを使用する場合、重複ファイルに対して実行するアクションは、AEMサーバーの設定で制御されます。 この設定については、システム管理者にお問い合わせください。

**親トピック：**[&#x200B;コンテンツを管理](authoring.md)

