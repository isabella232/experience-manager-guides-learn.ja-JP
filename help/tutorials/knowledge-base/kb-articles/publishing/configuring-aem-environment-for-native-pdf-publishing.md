---
title: ネイティブAEM公開用のPDF環境の設定
description: ネイティブAEM公開用のPDF環境の設定
exl-id: 40266ca0-0b0b-4418-b606-f70270addbaa
source-git-commit: 45dfe6078039001327e91ae85ea2a5beeacb2d59
workflow-type: tm+mt
source-wordcount: '906'
ht-degree: 1%

---

# ネイティブAEM公開用のPDF環境の設定

AEMガイドには、ユーザーがPDF形式でコンテンツを設計、開発および公開できるネイティブなPDF発行エンジンが含まれています。

異なるページレイアウト、CSS テンプレートを作成し、ページレイアウトおよび CSS と組み合わせてPDFテンプレートをデザインできます。

AEMガイドでこのネイティブPDFを設定する手順は、オペレーティングシステムによって異なります。 AEMがインストールされているオペレーティングシステムに基づいて、次の設定手順を実行します。

## 前提条件

ネイティブPDFの設定に関する最小要件：

- Java Platform, Standard Edition 8 または 11 JDK(Java SE Development Kit) および JRE(Java SE Runtime Environment) がインストールされている
- AEM 6.5 SP13、SP12、SP11、または SP10
- ガイド 4.1 以降のバージョン（非 UUID または UUID）

ネイティブPDFの公開エンジンでは、AEM crx-quickstart フォルダーにOracleモジュールを生成するために、ノード JDK が必要です。 デフォルトでは、次のオペレーティングシステムがサポートされています。

- Windows 10、Windows 2019 Server 以降。
- Linux — （RHEL 8 以降、CentOS 7 以降、Ubuntu 18 以降のバージョン）
- Mac OS （インテルベース）

## Windows Server の構成手順 (JAVA 11/8)

1. AEMサーバーがダウンしていることを確認します。
2. Windows タスクバーで、Windows のアイコンを右クリックし、[ システム ] を選択します。
3. [ 設定 ] ウィンドウの [ 関連設定 ] で、[ システムの詳細設定 ] をクリックします。
4. 「詳細設定」タブで、「環境変数」をクリックします。
5. 「システム変数」セクションで、「_新規_」をクリックして、新しい環境変数を作成します。
6. 変数名に「JAVA_HOME」と入力します。
7. 「値」フィールドで、Java インストールパスを入力し、「OK」をクリックします。

   例：

   JAVA 11:

   C:\Program Files\JAVA\jdk-11.0.15.1

   JAVA 8:

   C:\Program Files\JAVA\ jdk1.8.0_144

8. システム変数から「パス」を追加し、「編集」をクリックします。

9. これで、Path 変数内で Server path の値を指定し、「OK」をクリックします。

   例：

   JAVA 11:

   %JAVA_HOME%\bin\server\

   JAVA 8:

   %JAVA_HOME%\jre\bin\server\

10. 環境変数ダイアログで、もう一度「OK」をクリックします。
11. [ システムプロパティ ] ダイアログで、もう一度 [OK] をクリックします。
12. 次に、AEMサーバーを起動します。
13. Web エディターで、プリセットからネイティブPDFを生成します。

## Linux サーバー (RHEL7/centOS 7) の設定手順

1. AEMサーバーがダウンしていることを確認します。
2. echo $JAVA_HOME を実行して、JAVA_HOME 変数を検証します。
3. JAVA_HOME 変数が設定されていない場合は、手順 4 に従います。 それ以外の場合は、手順 5 に直接進みます。
4. インストールされている Java バージョンに基づく次のコマンドを使用して、JAVA_HOME 変数を設定します。

   例：

   JAVA 11:

   1. export JAVA\_HOME=/usr/lib/jvm/java-11.0.15.1
   2. 書き出しパス=$PATH: $JAVA\_HOME/bin
   3. export LD\_LIBRARY\_PATH=/usr/lib/jvm/jdk-11.0.15.1/lib/server:/usr/java/jdk-11.0.15.1/lib/server

   JAVA 8:

   1. export JAVA\_HOME=/usr/lib/jvm/java-11.0.15.1
   2. 書き出しパス=$PATH: $JAVA\_HOME/bin

5. AEM Server を再起動し、Guides バージョン 4.2 以降を使用している場合は、手順 12 に進みます。
6. 「_node_modules.zip_&quot;この記事の下部で crx-quickstart/profiles/nodejs—b1aad0a7-9079-e56c-1ed8-6fcababe8166/ディレクトリに添付されています。
7. crx-quickstart/profiles/nodejs—b1aad0a7-9079-e56c-1ed8-6fcababe8166/の場所でターミナルを開きます。
8. 以下のコマンドを使用して node_modules ディレクトリを削除します。

   **rm -rf node_modules**

9. 以下のコマンドを使用して node_modules.zip を解凍します。

   **node_modules.zip を解凍します。**

10. unzip コマンドがインストール/認識されない場合は、次のコマンドを使用してインストールできます。

   **yum install unzip**

11. fontconfig パッケージをインストールします。
コマンド： yum install fontconfig
12. Web エディターで、プリセットからネイティブPDFを生成します。

**注意** : node_modules.zip パッケージをダウンロードできます。 [ここ](https://acrobat.adobe.com/link/track?uri=urn:aaid:scds:US:295d8f03-41e1-429b-8465-2761ce3c2fb3).

Linux オペレーティングシステム用にダウンロードしたノードモジュールを手動で読み込むことは、ガイド 4.1 以前のバージョン（手順 6-12）を使用しているユーザーにとっての回避策です。

## Macマシンの設定手順 (JAVA 11/8)

1. oracleJAVA 11 またはOracleJAVA 8 をインストールします。
2. JAVA_HOME 環境変数を、インストールされている JAVA ディレクトリに設定します。
3. Unix シェルを開きます。
（Bash は設定のセットアップに使用されます）。

   コマンド： nano ～/.bashrc

4. インストールされている Java バージョンに基づく次のコマンドを使用して、JAVA_HOME 変数を設定します。

   例：

   JAVA 11:

   export JAVA\_HOME= /Library/Java/JavaVirtualMachines/jdk-11.0.15.1.jdk/Contents/Home

5. 基本を再読み込み

   コマンド： source ～/.bashrc.

6. コマンド echo $JAVA_HOME を使用して JAVA_HOME が設定されていることを確認します。

7. AEMインストールパスから以下の 3 つのコマンドを実行します。

   C:/{aem-installation-folder}/crx-quickstart/profiles/nodejs—b1aad0a7-9079-e56c-1ed8-6fcababe8166

   i) 検索。 -type d -exec chmod 0755 {} \; ii) を検索します。 -type f -exec chmod 0755 {} \; iii) 。/node-darwin/bin/node node-darwin/lib/node_modules/npm/bin/npm-cli.js —prefix 。 install —unsafe-perm —scripts-prepend-node-path

8. 次のコマンドを使用して、Java がインストールされているかどうかを確認します。

   i) 実行 **./node-darwin/bin/node** /crx-quickstart/profiles/nodejs—b1aad0a7-9079-e56c-1ed8-6fcababe8166フォルダーからのコマンド

   ![mac](../assets/publishing/mac.png)

   ii) = require(&#39;java&#39;)

9. fontconfig パッケージをインストールします。
コマンド： apt install fontconfig

10. Web エディターで、プリセットからネイティブPDFを生成します。

## トラブルシューティング

環境変数が適切に設定されていない場合にPDFの生成中に発生する可能性のある一般的なエラーを次に示します。

### Windows/Mac OS でのヌルポインターの例外

![null ポインタの例外](../assets/publishing/null-pointer-exception.png)

Java 環境の設定を修正した後も問題が解決しない場合は、次の点を再検証してください。

1. 出力プリセットが正しく定義されているかどうか、またはスペースを含まない新しい出力プリセットを作成します。

2. /libs/fmdta/node_resources のノードリソースディレクトリを検証し、必要なライブラリがすべてインストール中にインストールされていることを確認します。

### RHEL 7 Linux OS でのライブラリの欠落

![ライブラリが見つかりません](../assets/publishing/missing-libraries.png)

### 公開プロセスのタイムアウト。 指定された時間 0 ミリ秒でプロセスが完了しませんでした

![公開プロセスのタイムアウト](../assets/publishing/publish-process-timeout.png)

CRX リポジトリの/var/dxml/profiles/b1aad0a7-9079-e56c-1ed8-6fcababe8166/nodejs の nodejs ノードの timeout プロパティ値を検証します。 デフォルト値は 300 です。



上記の手順の実行中に問題が発生した場合は、AEM Guides コミュニティに質問を投稿してください。 [フォーラム](https://experienceleaguecommunities.adobe.com/t5/experience-manager-guides/ct-p/aem-xml-documentation) 助けを求めて
