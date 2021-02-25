![version](https://img.shields.io/badge/version-18%20R4-EB8E5F)
![platform](https://img.shields.io/static/v1?label=platform&message=osx-64%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-tips-offscreen-view-pro-example)](LICENSE)

# 4d-tips-offscreen-view-pro-example
View Proオフスクリーンエリアの例題

#### 対応バージョン: v18 R4

* [18 R3のクラスストア](https://blog.4d.com/an-intro-to-object-oriented-programming-in-4d-classes/)は使用していません。

* [18 R4のオフスクリーンエリア](https://blog.4d.com/4d-view-pro-offscreen-areas/)を使用しています。
 
* [18 R6の`On VP Range Changed`, `On Timer`](https://blog.4d.com/4d-view-pro-end-of-document-loading/)は使用していません。

# 例題について

`.xlsx`を読み込んで`.pdf`に変換します。それだけ。

# 既知の😷😷

**ACI0101754**: 日本語のフォントが文字化けしますね。「メイリオ」なら読めますが，メイリオフォントが出力されるわけでもなさそうです。[これ](https://devlog.grapecity.co.jp/spreadjs-pdfexport/)と同じ問題でしょうか。
