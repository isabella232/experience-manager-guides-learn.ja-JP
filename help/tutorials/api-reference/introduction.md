---
title: はじめに
description: AEMガイドの API リファレンスガイドの概要
exl-id: d8ee9cf7-1d67-4b4a-aa80-64e893a99463
source-git-commit: 112085153aaf246289bd8f91657c95e986df482e
workflow-type: tm+mt
source-wordcount: '730'
ht-degree: 0%

---

# はじめに {#id1761C0007W7}

Adobe Experience Managerガイド\( 後で *AEMガイド*\) は、Adobe Experience Manager \(AEM\) に DITA ベースのコンテンツ作成および配信用のコンポーネントコンテンツ管理ソリューション\(CCMS\) 機能を提供する、エンドツーエンドのエンタープライズソリューションです。 お客様は、AEM Guides API を使用してプログラムでAEM Guides ワークフローにアクセスし、他のエンタープライズアプリケーションと統合できます。 また、これらの API は、Adobeパートナーが機能を拡張したり、他のアプリケーションやサービスと統合したりして、AEMガイドの価値提案を強化するためにも使用できます。

## AEM Guides API

AEM Guides API は、HTTP と Java の 2 つの形式で使用できます。 これらの API は、AEMガイドの主要な機能をアプリケーション開発者に公開します。 これらの関数を使用して、開発者は独自のプラグインを作成し、標準搭載のワークフローを拡張できます。 API は、DITA コンテンツの出力の管理、DITA マップの操作、フォルダーレベルのプロファイルへの条件付き属性の追加、HTMLおよび Words 文書の DITA 形式への変換に使用できます。

## ローカルの Apache Maven リポジトリへの JAR のインストール {#install-jar-local}

AEM Guides で公開された JAR ファイルを使用できるようにするには、ローカルの Apache Maven リポジトリにそれらのファイルをインストールする必要があります。 次の手順を実行して、ロケーション Maven リポジトリに JAR をインストールします。

1. AEM Guides パッケージ\(.zip\) ファイルの内容をローカルシステムに展開します。

2. コマンドプロンプトで、抽出したコンテンツパスの次のフォルダに移動します。

   ```
   \jcr_root\libs\fmdita\osgi-bundles\install
   ```

3. 次のコマンドを実行して、API バンドルをローカルの Maven リポジトリにインストールします。

   ```
   mvn install:install-file -Dfile=api-X.x.jar -DgroupId=com.adobe.fmdita -DartifactId=api -Dversion=X.x -Dpackaging=jar**
   ```

   >[!NOTE]
   >
   > 上記のコマンドでは、X.x は Dfile および Dversion パラメーターの実際のバージョン番号に置き換える必要があります。

4. \(*オプション*\) ローカルの Maven プロジェクトのリポジトリに依存関係をインストールします。 これをおこなうには、Maven プロジェクトでフォルダーを作成し、 `mvn install` 前の手順で指定したコマンドに、次の追加のパラメーターを指定します。

   ```
   -DlocalRepositoryPath=<path_to_project_repository>
   ```

   次に、プロジェクトのローカルリポジトリフォルダーを Maven のビルドプロセスに公開するには、 `repository` 親 pom.xml ファイル内の要素を次に示します。

   ```XML
   <repositories>
      <repository>
         <id>project-repository</id>
         <url>file://${project.basedir}/repository</url>
      </repository>
   </repositories>
   ```


このプロセスは、API JAR をローカルの Maven リポジトリにインストールします。

## Maven プロジェクトでのサービス API JAR の使用

ローカルの Maven リポジトリに API JAR をインストールした後、次の手順を実行して、プロジェクトで JAR を使用します。

1. JAR をコードベースに追加し、「dependencies」などのフォルダーの下のコードベースリポジトリにコミットします。 フォルダー名は、コードベースの階層に応じて異なることに注意してください。

2. 次のように、プロジェクトの pom.xml ファイルを設定します。

   親プロジェクトの pom.xml ファイル：

   >[!IMPORTANT]
   >
   > 次のコードスニペットでは、X.x を実際のバージョン番号と API JAR のファイル名に置き換える必要があります。 この情報は、 [設置過程](#install-jar-local).

   ```XML
   <plugin>
   
       <groupId>org.apache.maven.plugins</groupId>
   
      <artifactId>maven-install-plugin</artifactId>
   
       <version>2.5.2</version>
   
       <configuration>
   
               <groupId>com.adobe.fmdita</groupId>
   
               <artifactId>api</artifactId>
   
               <version>X.x</version>
   
               <file>${basedir}/dependencies/fmdita/api-X.x.jar</file>
   
               <packaging>jar</packaging>
   
               <generatePom>true</generatePom>
   
       </configuration>
   
       <executions>
   
           <execution>
   
               <id>inst_fmdita</id>
   
                   <goals>
   
                       <goal>install-file</goal>
   
                   </goals>
   
                   <phase>clean</phase>
   
           </execution>
   
       </executions>
   </plugin>
   ```

   子モジュールの pom.xml ファイル：

   ```XML
   <plugin>
      <groupId>org.apache.maven.plugins</groupId>
   
      <artifactId>maven-install-plugin</artifactId>
   
      <configuration>
   
         <groupId>com.adobe.fmdita</groupId>
   
         <artifactId>api</artifactId>
   
         <version>3.6</version>
   
         <file>${basedir}/../dependencies/fmdita/api-3.6.jar</file>
   
         <packaging>jar</packaging>
   
         <generatePom>true</generatePom>
   
      </configuration>
   
      <executions>
   
         <execution>
   
            <id>inst_fmdita</id>
   
            <goals>
   
               <goal>install-file</goal>
   
            </goals>
   
            <phase>clean</phase>
   
         </execution>
   
      </executions>
   
   </plugin>
   ```


## パブリック Maven リポジトリからサービス API JAR を設定して使用する

次の手順を実行して、プロジェクトのパブリック Maven リポジトリーからサービス API JAR を設定して使用します。

1. プロジェクトでサービス API JAR を使用するには、pom.xml ファイルでAEM Guides パブリック Maven リポジトリを設定します。
2. Maven の settings.xml ファイルで、公開 Maven リポジトリを次のように設定します。

   ```XML
   <repository>
      <id>fmdita-public</id>
      <name>fmdita-public</name>
      <url>https://repo.aem-guides.com/repository/fmdita-public</url>
   </repository>
   ```

3. リポジトリを設定したら、サービス API JAR をプロジェクトの依存関係としてプロジェクトの pom.xml ファイルに追加します。

   >[!NOTE]
   >
   > サーバーにインストールしたAEM Guides パッケージと同じバージョンの API JAR を使用します。

4. 次に示すように、Maven 依存関係を設定します。

   ```XML
   <dependency>
      <groupId>com.adobe.fmdita</groupId>
      <artifactId>api</artifactId>
      <version>4.0</version>
   </dependency>
   ```


サービス API JAR をプロジェクトの pom.xml ファイルにプロジェクト依存関係として追加したら、プロジェクトでAEM Guides Java API を構築して使用できます。

## Maven Central リポジトリの API JAR を使用したAEM Guides のas a Cloud Service

AEMガイドas a Cloud Serviceの場合、API JAR は Maven Central にデプロイされています。 API JAR は、設定なしで使用できます。

>[!NOTE]
>
> API jar の命名規則は、クラウドアドオンの命名規則に従って更新されました。

API JAR を使用するには、次に示すように、プロジェクトの pom.xml に依存関係を追加する必要があります。

```XML
<dependency>
   <groupId>com.adobe.aem</groupId>
   <artifactId>aem-guides-sdk-api</artifactId>
   <version>2022.5</version>
</dependency>
```

>[!NOTE]
>
> API JAR 内のパッケージはまだ同じなので、既存のクラウドプロジェクトでこの API JAR を使用する際にコードを変更する必要はありません。

## その他のリソース

次に、AEMガイドのその他の役立つリソースのリストを示します。これらのリソースは、 [ラーニングとサポート](https://helpx.adobe.com/support/xml-documentation-for-experience-manager.html) ページ：

- ユーザーガイド
- インストールおよび設定ガイド
- クイックスタートガイド
- [ヘルプのアーカイブページ](https://helpx.adobe.com/xml-documentation-for-experience-manager/archive.html) \（古いリリースドキュメントへのアクセス\）
