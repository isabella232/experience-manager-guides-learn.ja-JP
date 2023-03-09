---
title: FMPS およびAEMガイド
description: AEMガイドを使用した FMPS による公開
source-git-commit: e3cef715f635746f7b426cb5de09299715cc354b
workflow-type: tm+mt
source-wordcount: '686'
ht-degree: 0%

---


# FrameMaker Publishing Server(FMPS) およびAEMガイド

**高品質の自動公開をお探しの場合は、AEM Guides と FrameMaker Publishing Server の統合がソリューションになります。\
次の記事は、AEMガイドを使用した FMPS の設定と実行に役立ちます。**

## FMPS とAEMガイドの互換性：

- 4.1 AEMガイドとの互換性： [リンク](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/release-notes/on-prem-release-notes/release-notes-4.1.html?lang=en/#compatibility-matrix)
- 4.0 AEMガイドとの互換性： [リンク](https://helpx.adobe.com/xml-documentation-for-experience-manager/release-note/release-notes-xml-documentation-solution-4-0.html/#Compatibility%20matrix)
- 今後のリリース： [リンク](https://experienceleague.adobe.com/docs/experience-manager-guides-learn/tutorials/release-info/latest-release-info.html?lang=en)

## インストール:

### AEMガイド：

インストールと設定については、次を参照してください。 [リンク](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-1-2/Adobe-Experience-Manager-Guides_Installation-Configuration-Guide_EN.pdf)

### FMPS:

FMPS のインストールについては、以下を参照してください。 [ビデオリンク](https://www.youtube.com/watch?v=2deelyM5VA8&amp;t) または [ドキュメント](https://help.adobe.com/en_US/framemaker/server/index.html#t=fmps-user-guide%2Finstall_config_fmps.html%23install_config_fmps&amp;rhtocid=_2)

## 必要な設定：

DITA コンテンツは、FrameMaker Publishing Server(FMPS) を使用して出力できます。 FMPS がサポートする様々な形式の出力を作成できます。 Web コンソールで、FMPS を使用するAEMガイドを設定するように com.adobe.fmdita.config.ConfigManager バンドルの次のプロパティを変更します。

Web コンソールを開くには、「 URL Access http://\ 」に移動します。&lt;server name=&quot;&quot;>:\&lt;port>/system/console/configMgr.

**設定のプロパティと説明：** [リンク](https://helpx.adobe.com/content/dam/help/en/xml-documentation-solution/4-1-2/Adobe-Experience-Manager-Guides_Installation-Configuration-Guide_EN.pdf#page=89)

## 実行中のテスト：

FMPS を使用して、自動的にパブリッシュできます **PDF、レスポンシブHTML5**、および **Epub** DITA および FM アセット用。

「次を使用してPDFを生成」メニューから、「FrameMaker Publishing Server」を選択します。

ユーザーは、「settings File(.sts)」と「ditaval」を指定できます。 フィルタリングは、指定した条件に基づいて、ditaval を使用しておこなわれます。

- **設定ファイル**:FrameMaker /FMPS 発行時に FMPS が受け入れるすべての設定を含む発行設定例：カスタマイズしたPDFを使用して出力を生成する、マークとブリード (PDF) を生成する、TOC を使用したテンプレートを生成する、インデックスなど
- **FMPS が存在する場合：** Ditaval と設定ファイルの事前定義済みの組み合わせ。Ditaval と設定ファイルを別々に指定する代わりに、FMPS プリセットを事前に作成して、公開ニーズに合わせて再利用できます。

**注意：** 設定または FMPS プリセットを選択しない場合、FMPS はデフォルトのシステム設定で発行されます。

FMPS プリセットを選択し、AEMから settings/ditaval ファイルも指定した場合は、競合が発生し、FMPS プリセットがカスタム設定/ditaval ファイルよりも優先されます。

### FMPS を使用したベースラインパブリッシング：

FMPS2020.0.2 以降のバージョンで、既に作成したベースラインをパブリッシュできます。

**開始する FMPS 設定ファイル（.sts ファイル）の例：** [リンク](https://acrobat.adobe.com/link/track?uri=urn:aaid:scds:US:ef750752-7a7e-4e51-923e-6b7d9861ed54) （このファイルを解凍）

## FAQ とトラブルシューティング：

- FMPS の公開が「タイムアウト例外」で失敗する。

/system/console/configMgr/com.adobe.fmdita.config.ConfigManager の「FMPS タイムアウト」（秒）の値をチェックして増やします。

- ドロップダウンで FMPS プリセットを取得できません。

事前定義済みの FMPS プリセットがサーバー上に作成され、接続設定が正しいことを確認します。

- 公開時に空白のPDFが表示されます。

UUID を使用している場合は、FrameMaker の編集環境設定で「UUID ベースの参照を使用」をオンにし、非 UUID AEMガイドでは「UUID ベースの参照を使用」をオンにしていることを確認します。

- 最終的なパブリッシュ出力で、設定/ditaval が適用されません。

設定/ディタバルファイルと FMPS プリセットの両方を同時に選択していないことを確認してください。 FrameMaker を使用して、出力を手動で確認します。

- ベースラインが FMPS から公開されていません。

ベースライン公開は、FMPS2020.0.2 以降のバージョンと互換性があります。\
ベースラインが正しく作成されていることを確認し、「マップダッシュボードトピックダウンロードマップ」に移動し、「ベースラインを使用」を選択します。

- FMPS からの公開タスクは、他のエンジンよりも時間がかかります。

理想的な固定ヘッダーは約 他のエンジンよりも FMPS からの公開時に 3 ～ 4 分のみ、それ以上と思われる場合は、FMPS 管理者またはAdobeサポートにお問い合わせください。

## その他のリソース:

[FMPS のラーニングとサポート](https://helpx.adobe.com/support/framemaker-publishing-server.html)

[AEMのラーニングとサポート](https://helpx.adobe.com/in/support/xml-documentation-for-experience-manager.html)

[FrameMaker と FMPS コミュニティ](https://community.adobe.com/t5/framemaker/ct-p/ct-framemaker?page=1&amp;sort=latest_replies&amp;lang=all&amp;tabid=all)

[AEM Guides コミュニティ](https://experienceleaguecommunities.adobe.com/t5/experience-manager-guides/ct-p/aem-xml-documentation)
