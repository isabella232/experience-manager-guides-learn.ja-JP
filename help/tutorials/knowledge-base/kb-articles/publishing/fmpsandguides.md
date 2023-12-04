---
title: AEMガイドでのFrameMaker Publishing Server(FMPS) を使用した公開
description: AEMガイドを使用した FMPS による公開
source-git-commit: 880cd344ceb65ea339be699ebcad41c0d62e168a
workflow-type: tm+mt
source-wordcount: '623'
ht-degree: 0%

---

# AEMガイドでのFrameMaker Publishing Server(FMPS) を使用した公開

AEM Guides とFrameMaker Publishing Serverの統合は、高品質の自動公開をお探しの場合に、ソリューションになり得ます。\
この記事では、AEMガイドを使用した FMPS の設定と実行について説明します。

## FMPS とAEMガイドの互換性

- 4.1 AEMガイドとの互換性： [4.1 互換表](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/release-notes/on-prem-release-notes/release-notes-4.1.html?lang=en/#compatibility-matrix)
- 4.0 AEMガイドとの互換性： [4.0 互換表](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-4-0.html/#Compatibility%20matrix)
- 最新リリース： [最新のリリース情報](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/latest-release-info.html?lang=en)

## インストール

AEMガイドおよび FMPS のインストールと設定については、以下を参照してください。

### AEMガイド

インストールと設定については、次を参照してください。 [4.1 インストールと設定](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-1-2/Adobe-Experience-Manager-Guides_Installation-Configuration-Guide_EN.pdf)

### FMPS

FMPS のインストールについては、以下を参照してください。 [YouTube Link](https://www.youtube.com/watch?v=2deelyM5VA8&amp;t) または [FMPS のインストールと設定](https://help.adobe.com/en_US/framemaker/server/index.html#t=fmps-user-guide%2Finstall_config_fmps.html%23install_config_fmps&amp;rhtocid=_2)

## 必要な設定

FrameMaker Publishing Server(FMPS) を使用して DITA コンテンツを生成できます。 FMPS は、様々な出力形式をサポートしています。 Web コンソールで次の「com.adobe.fmdita.config.ConfigManager bundle」プロパティを変更し、AEMガイドで FMPS を使用するように設定します。

Web コンソールを開くには、「 URL Access http://\ 」に移動します。&lt;server name=&quot;&quot;>:\&lt;port>/system/console/configMgr.

**設定のプロパティと説明** [4.1 インストールと設定](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-1-2/Adobe-Experience-Manager-Guides_Installation-Configuration-Guide_EN.pdf#page=89)

## 実行中のテスト：

FMPS を使用して、自動的にパブリッシュできます。 **PDF、レスポンシブHTML5**、および **Epub** DITA および FM アセット用。

「次を使用してPDFを生成」メニューから、「FrameMaker Publishing Server」を選択します。

ユーザーは、「settings File(.sts)」と「ditaval」を指定できます。 フィルタリングは、指定した条件に基づいて、ディタバルを使用しておこなわれます。

- **ファイルを設定中**:FrameMaker/FMPS 発行設定ファイル。発行時に FMPS が考慮するすべての設定が含まれます。 例えば、カスタマイズしたテンプレートを使用して出力を作成し、マークとブリード (PDF) を作成し、目次を使用してPDFを作成します。
- **FMPS プリセット：** これは、ディタバルファイルと設定ファイルの事前定義済みの組み合わせです。 ユーザーは、個別のディタバルファイルと設定ファイルを指定する代わりに、FMPS プリセットを事前に作成して、公開のニーズに合わせて再利用できます。

**注意：** デフォルトのシステム設定は、設定または FMPS プリセットを選択しない場合に、FMPS が公開に使用します。

FMPS プリセットを選択し、AEMからカスタム設定またはディタバルファイルを指定した場合は、競合が発生します。 この場合、FMPS プリセットは、カスタム設定やディタバルファイルよりも優先されます。

### FMPS を使用したベースラインパブリッシング：

FMPS2020.0.2 以降のバージョンで、既に作成したベースラインを公開できます。

**開始する FMPS 設定ファイル（.sts ファイル）の例：** [サンプルの FMPS 設定ファイル](https://acrobat.adobe.com/link/track?uri=urn:aaid:scds:US:ef750752-7a7e-4e51-923e-6b7d9861ed54) （このファイルを解凍）

## FAQ とトラブルシューティング：

- ### FMPS の公開が「タイムアウト例外」で失敗する

>/system/console/configMgr/com.adobe.fmdita.config.ConfigManager の「FMPS タイムアウト」（秒）の値をチェックして増やします。

- ### ドロップダウンで FMPS プリセットを取得できません

>事前定義済みの FMPS プリセットがサーバー上に作成され、接続設定が正しいことを確認します。

- ### 公開時に空のPDFが表示される

>UUID を使用している場合は、FrameMakerの編集環境設定で「UUID ベースの参照を使用」をオンにしていることと、非 UUID AEMガイドに対しては逆にオンにしていることを確認してください。

- ### 最終的なパブリッシュ出力で設定/ディタバルが適用されません

>FMPS プリセットと設定/ダイアバルファイルを同時に選択していないことを確認します。 FrameMakerを使用して、出力を手動で確認します。

- ### ベースラインが FMPS から公開されていません

>FMPS2020.0.2 以降のバージョンは、ベースラインパブリッシングと互換性があります。
>ベースラインが正しく作成されたことを確認します。確認するには、マップダッシュボード — トピック — マップをダウンロードし、「ベースラインを使用」を選択します。
- ### FMPS からのパブリッシュタスクは、他のエンジンよりも時間がかかります

>FMPS から公開する場合、理想的な固定ヘッダー時間は約 3 ～ 4 分です。長いと思われる場合は、FMPS 管理者にお問い合わせいただくか、Adobeサポートにお問い合わせください。

## その他のリソース：

[FMPS のラーニングとサポート](https://helpx.adobe.com/support/framemaker-publishing-server.html)

[AEMガイドの学習とサポート](https://helpx.adobe.com/in/support/xml-documentation-for-experience-manager.html)

[FrameMakerと FMPS コミュニティ](https://community.adobe.com/t5/framemaker/ct-p/ct-framemaker?page=1&amp;sort=latest_replies&amp;lang=all&amp;tabid=all)

[AEM Guides コミュニティ](https://experienceleaguecommunities.adobe.com/t5/experience-manager-guides/ct-p/aem-xml-documentation)
