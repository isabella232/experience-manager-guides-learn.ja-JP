---
title: Web エディターを起動します。
description: AEMガイドのAEMナビゲーションページ、AEM Assets UI および DITA マップコンソールから Web エディターを起動する方法について説明します。
exl-id: f02f9612-7aaa-42ea-bad3-c44d23b5d034
source-git-commit: 3cc7a9bf91881ed09173077be7d7fc7705295e4b
workflow-type: tm+mt
source-wordcount: '588'
ht-degree: 0%

---

# Web エディターを起動します。 {#id2056B0140HS}

Web エディターは、次の場所から起動できます。

- [AEM Navigation ページ](#id2056BG00RZJ)
- [AEM Assets UI](#id2056BG0307U)
- [DITA マップコンソール](#id2056BG090BF)

以下の節では、様々な場所から Web エディターにアクセスして起動する方法の詳細について説明します。

## AEM Navigation ページ {#id2056BG00RZJ}

AEMにログインすると、ナビゲーションページが表示されます。

![](images/web-editor-from-navigation-page.png){width="800" align="left"}

クリック **ガイド** 「 」リンクをクリックすると、Web エディターに直接移動します。

![](images/web-editor-launch-page.png){width="800" align="left"}

ファイルを選択せずに Web エディタを起動した場合は、空白の Web エディタ画面が表示されます。 AEMリポジトリまたはお気に入りコレクションから、編集用にファイルを開くことができます。

- 次をクリック： **ガイド** アイコン (![](images/aem-guides-icon.png) ) をクリックし、AEMナビゲーションページに戻ります。

- The **閉じる** ボタンをクリックすると、設定に基づいて宛先に移動します。



  <details>

  <summary> Cloud Services </summary>

  Cloud Serviceを使用する場合、 **閉じる** ボタンをクリックして、AEMナビゲーションページに戻ります。
  </details>

  <details>

  <summary> オンプレミスソフトウェア</summary>

  AEM Guides On-premise Software（4.2.1 以降）を使用している場合、 **閉じる** ボタンをクリックして、Assets UI の現在のファイルパスに戻ります。

  </details>

## AEM Assets UI {#id2056BG0307U}

Web エディターを起動できる場所として、AEM Assets UI からもう 1 つあります。 1 つ以上のトピックを選択し、Web エディターで直接開くことができます。 Web エディターでトピックを開くには、次の手順に従います。

1. Assets UI で、編集するトピックに移動します。

   >[!NOTE]
   >
   > また、トピックの UUID も表示できます。

   。

   ![](images/assets_ui_with_uuid_cs.png){width="800" align="left"}

   >[!IMPORTANT]
   >
   > 編集するトピックを含むフォルダーに対する読み取りおよび書き込み権限があることを確認します。

1. トピックの排他ロックを取得するには、トピックを選択し、 **チェックアウト**.

   >[!IMPORTANT]
   >
   > 管理者が **チェックアウトなしで編集を無効にする** 」オプションを選択した場合は、編集する前にファイルをチェックアウトする必要があります。 ファイルをチェックアウトしない場合は、編集オプションを表示できません。

1. アセット選択モードを閉じ、編集するトピックをクリックします。

   トピックのプレビューが表示されます。

   Web エディターは、リスト表示、カード表示、プレビューモードから開くことができます。

   >[!IMPORTANT]
   >
   > 複数のトピックを編集用に開く場合は、Asset UI から目的のトピックを選択し、「編集」をクリックします。 ブラウザーでポップアップブロッカーが有効になっていないことを確認してください。有効になっていない場合は、選択したリストの最初のトピックのみが編集用に開かれます。

   ![](images/edit-from-preview_cs.png){width="800" align="left"}

   トピックをプレビューせず、Web エディターで直接開く場合は、カード表示のクイックアクションメニューの編集アイコンをクリックします。

   ![](images/edit-topic-from-quick-action_cs.png){width="800" align="left"}

1. クリック **編集** をクリックして、Web エディターでトピックを開きます。

   ![](images/edit-mode.png){width="800" align="left"}


## DITA マップコンソール {#id2056BG090BF}

DITA マップコンソールから Web エディターを開くには、次の手順に従います。

1. Assets UI で、編集するトピックを含む DITA マップファイルに移動してクリックします。

   DITA マップコンソールが表示されます。

1. クリック **トピック**.

   マップファイル内のトピックのリストが表示されます。 トピックの UUID は、トピックタイトルの下に表示されます。

1. 編集するトピックファイルを選択します。

1. クリック **トピックを編集**.

   ![](images/edit-topics-map-console_cs.png){width="800" align="left"}

1. トピックが Web エディターで開きます。

   >[!IMPORTANT]
   >
   > 管理者が **チェックアウトなしで編集を無効にする** 」オプションを選択した場合は、編集する前にファイルをチェックアウトする必要があります。 ファイルをチェックアウトしない場合、ドキュメントは読み取り専用モードでエディターで開きます。


**親トピック：**[ Web エディターの操作](web-editor.md)
