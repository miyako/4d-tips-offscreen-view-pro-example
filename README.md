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

**ACI0101754**: 日本語のフォントが文字化けしますね。「メイリオ」なら読めますが，メイリオフォントが出力されるわけでもなさそうです。[これ](https://devlog.grapecity.co.jp/spreadjs-pdfexport/)と同じ問題でしょうか。ちなみに4DのSpreadJSバージョンは下記のとおり：

|4D|SpreadJS|
|---|---|
|19|14|
|18 R6|14|
|18 R5|13|
|18 R4|13|
|18|12|

参考: https://discuss.4d.com/t/4d-view-pro-spreadjs-update/17604

[Font file](https://doc.4d.com/4Dv18R5/4D/18-R5/Font-file.301-5127874.ja.html)とJavaScriptのインジェクションで回避できるのでしょうか。SpreadJSは内部的に[pdfkit]を使用しているため，Unicodeを有するOpenTypeフォントだけが対応しています。`VP EXPORT DOCUMENT`は，ドキュメント内で使用されているシステムフォント(`.OTF` または `.TTF` ファイル)を自動的に探し，埋め込む（SpreadJSが管理しているフォントはスキップする）ようになっており，[Font file](https://doc.4d.com/4Dv18R5/4D/18-R5/Font-file.301-5127874.ja.html)でフォントがみつからない場合はSpreadJSのデフォルトフォントを使用することになっています。

その他: https://4d-jp.github.io/2020/01/24/embed-font-in-pdf/
