---
title: 一括アクティベーション完了イベントハンドラー
description: 一括アクティベーション完了イベントハンドラーの詳細を説明します
source-git-commit: 4b0e3f7cf777d2b98eb394fd89235acddef4769a
workflow-type: tm+mt
source-wordcount: '185'
ht-degree: 2%

---

# 一括アクティベーション完了イベントハンドラー

Experience Managerガイドの公開 `com/adobe/fmdita/replication/complete` イベント。一括アクティベーションプロセスの完了後に操作を実行するために使用されます。 このイベントは、一括アクティベーションプロセスが完了するたびにトリガーされます。 例えば、マップのAEMサイトプリセットの一括アクティベーションを実行した場合、このイベントはアクティベーションプロセスが終了した後に呼び出されます。


このイベントで使用可能なプロパティを読み取り、さらに処理をおこなうには、AEMイベントハンドラーを作成する必要があります。

イベントの詳細については、以下で説明します。

**イベント名**:

```
com/adobe/fmdita/replication/complete 
```

**パラメーター**: |名前|型|説明| |—|—|—| |`path`|String|このイベントを発生させたファイルのパス。 <br>例：`/content/output/sites/ditamap1-ditamap`。<br> JSON 配列としてシリアル化されたパスのリストです。| |`messageType`|String|メッセージの種類。 <br>選択可能なオプション： `REPLICATION`| |`action`|String|実行されたアクションです。 <br>選択可能なオプション： `BulkReplicate`| |`user`|String|操作を開始したユーザー。| |`result`|文字列|一括アクティベーションの結果。 これは、シリアル化された JSON オブジェクトです。 <br>`{"success":boolean,"code":integer,"message":"" }`| |`agentId`|String|レプリケーションで使用される agentId。 例：`"publish"`。| |`importMode`|String|Activation で使用される読み込みモード。 次のオプションを選択できます。 <br>`REPLACE, MERGE, UPDATE`.|


**サンプルイベントリスナー**:

```XML
@Component(service = EventHandler.class,
        immediate = true,
        property = {
                EventConstants.EVENT_TOPIC + "=" + "com/adobe/fmdita/replication/complete",
        })
 
public class SampleEventHandler implements EventHandler {
 
    protected final Logger log = LoggerFactory.getLogger(this.getClass());
 
    @Override
    public void handleEvent(final Event event) {
        Map<String, String> properties = new HashMap<>();
        properties.put("paths", (String) event.getProperty("paths"));
        properties.put("messageType", (String) event.getProperty("messageType"));
        properties.put("action", (String) event.getProperty("action"));
        properties.put("result", (String) event.getProperty("result"));
        properties.put("user", (String) event.getProperty("user"));
        properties.put("agentId", (String) event.getProperty("agentId"));
        properties.put("importMode", (String) event.getProperty("importMode"));
 
        String eventTopic = event.getTopic();
        log.debug("eventTopic {}", eventTopic);
        for(Map.Entry entry:properties.entrySet()) {
            log.debug(entry.getKey() + " : " + entry.getValue());
        }
 
    }
}
```
