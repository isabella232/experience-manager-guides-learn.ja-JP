---
sidebar_position: 2
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '149'
ht-degree: 0%

---


# コンテキストメニューのカスタマイズ

次のコンテキストメニューをカスタマイズできます。

- `file_options`
コントローラ：
   - マップビュー： `ditamap_viewer_controller`
   - リポジトリパネル： `repository_panel_controller`
   - お気に入りパネル： `collection_tree_controller`
   - ファイルプロパティリファレンスリンク： `file_references_links_controller`
   - リポジトリ検索パネル： `repository_search_controller`
   - 件名スキームパネル： `subject_scheme_tree_controller`

- `folder_options`
コントローラ：
   - リポジトリパネル： `repository_panel_controller`
   - お気に入りパネル： `collection_tree_controller`

- `collection_options`
コントローラ：
   - お気に入りパネル： `collection_tree_controller`

- `map_view_options`
コントローラ：
   - マップビュー： `ditamap_viewer_controller`

- `baseline_panel_menu`
コントローラ：
   - ベースラインパネル： `baseline_panel`

- `preset_item_menu`
コントローラ：
   - プリセットパネル： `preset_panel`

また、新しい一意の ID を定義して、独自のコンテキストメニューを作成することもできます。

現在は、各コンテキストメニューに `controller id` 関連付けられています。 このコントローラは、 `on-event` 様々なコンテキストメニューオプションの機能

例を見て理解しましょう

```js title=customise_context_menu.js"
const fileOptions = {
    id: "file_options",
    contextMenuWidget: "repository_panel",
    view: {
            items: [
                {
                    component: "div",
                    target: {
                        key:"displayName",value: "Delete",                    
                        viewState: VIEW_STATE.REPLACE
                    }
                },
                {
                    component: "div",
                    target: {
                        key:"displayName",value: "Edit",                    
                        viewState: VIEW_STATE.REPLACE
                    }
                },
                {
                    "displayName": "Download",
                    "data": {
                      "eventid": "downloadFile"
                    },
                    "icon": "downloadFromCloud",
                    "class": "menu-separator",         
                    target: {
                        key:"displayName",value: "Duplicate",                    
                        viewState: VIEW_STATE.REPLACE
                    }
                },
            ]

    },

    controller: {
        downloadFile(){
            const path  = this.model.selectedItem.path
            this.loader.loadDitaFile(path).then((file) => {
              function download_file(name, contents) {
                const mime_type = "text/plain";
        
                const blob = new Blob([contents], {type: mime_type});
        
                const dlink = document.createElement('a');
                dlink.download = name;
                dlink.href = window.URL.createObjectURL(blob);
                dlink.onclick = function() {
                    // revokeObjectURL needs a delay to work properly
                    const that = this;
                    setTimeout(function() {
                        window.URL.revokeObjectURL(that.href);
                    }, 1500);
                };
        
                dlink.click();
                dlink.remove();
            }
            download_file(path,file.xml)
            });
          }
    }
}
```

次に、このコードが何をしているかを説明します。

1. `id` を使用して、カスタマイズするコンテキストメニューを識別します。
2. `contextMenuWidget` を使用して `widget id` または `component` コンテキストメニューを呼び出し、 `events`.

残りの部分は同じです。 `view` は、項目の定義に使用されます。 `target` は、置き換える場所、追加する場所、またはオプションの前に追加する場所を指定し、 `contextMenuWidget` コントローラが `on-click` イベント。
