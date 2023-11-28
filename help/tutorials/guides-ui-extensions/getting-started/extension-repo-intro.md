---
sidebar_position: 3
source-git-commit: 42052b37724f97e34ab007db4cc3d9f9524ad3a2
workflow-type: tm+mt
source-wordcount: '101'
ht-degree: 0%

---


# AEM Guides 拡張機能パッケージディレクトリの構造

```text
├── src
│   ├── **/*{js,ts}
│   ├── index.ts
├── dist
│   ├── guides-extension.js
│   ├── guides-extension.umd.cjs
│   ├── build.css
├── node_modules
├── package.json
├── package-lock.json 
└── .gitignore
└── buildCSS.mjs // for creating tailwind classes
└── vite.config.js // config for specifying TS and javascript build options
└── taliwind.config.js // config for tailwind we can add custom config for a design system here
├── jsons // jsons for the aem app
│   ├── context_menus // jsons for the context menus
│   ├── review_app // jsons for the review app
│   ├── xmleditor // jsons for xmleditor
```

## /src

```text
├── src
│   ├── **/*{js,ts}
│   ├── index.ts
```

ソースディレクトリには、拡張機能の typescript ファイルまたは javascript ファイルが含まれます。 index.ts ファイルは、拡張機能のエントリポイントです。 ここですべてのコンポーネントをインポートし、単一のオブジェクトとしてエクスポートできます。 このオブジェクトは、拡張機能でコンポーネントのレンダリングに使用されます。

### /dist

これは最終的なビルドディレクトリです。 これには、AEMにコピーする必要がある最終的な JS と CSS が含まれます。

```test
├── dist
│   ├── gudies-extension.js // you can either choose es module (this one) or .cjs(other one) file
│   ├── gudies-extension.umd.cjs
│   ├── build.css // this is your tailwind css output
```

## /jsons

このディレクトリには、様々な表示の JSON が含まれています。 これらの JSON を使用して、ターゲットを識別し、表示をカスタマイズできます。

```text
├── jsons // jsons for the aem app
│   ├── context_menus // jsons for the context menus
│   ├── review_app // jsons for the review app
│   ├── xmleditor // jsons for xmleditor
```
