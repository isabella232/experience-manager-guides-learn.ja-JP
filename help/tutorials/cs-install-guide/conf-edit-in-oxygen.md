---
title: Oxygen で編集するオプションを設定します。
description: Oxygen コネクタプラグインで編集するオプションを設定する方法を説明します。
source-git-commit: a209e46e41055348402292e20c229890cd0c01cf
workflow-type: tm+mt
source-wordcount: '104'
ht-degree: 1%

---


# Oxygen で編集するオプションを設定します。

また、AEMガイドを使用すると、Oxygen Connector プラグインで DITA トピックと DITA マップを編集できます。

に示す手順を使用します。 [設定の上書き](download-install-additional-config-override.md#) をクリックして、設定ファイルを作成します。 設定ファイルで、次の（プロパティ）詳細を指定して、 **酸素で編集** オプション：



| PID | プロパティキー | プロパティの値 |
|---|------------|--------------|
| `com.adobe.fmdita.xmleditor.config.XmlEditorConfig` | `xmleditor.editinoxygen` | ブール値\(true/false\)。 **デフォルト値**: false |

>[!NOTE]
>
> この設定はデフォルトで無効になっており、Web エディターではこのオプションを使用できません。

**親トピック：**[ Web エディタのカスタマイズ](conf-web-editor.md)

