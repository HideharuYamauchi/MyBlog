---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "HugoのAcademicテーマを最小レベルで使う"
subtitle: ""
summary: ""
authors: ["max"]
tags: ["Hugo", "Academic" ]
categories: ["Hugo"]
date: 2019-11-06T12:14:17+09:00
lastmod: 2019-11-06T12:14:17+09:00
slug: "2019-11-06T12:14:17+09:00"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Smart"
  preview_only: false
---

# Hugo + Academic テーマでブログを書く

このブログはHugoで書いてます。

最初にやったのは、テーマ選びです。  
おしゃれでSEOに優れててレスポンシブなテーマで人気なやつを探していろいろ見たけど、最終的にGithubのStarが一番多いやつでいいやってなりました。


参考にしたランキングサイト  
https://hugo-theme-ranking.oika.me/

# Academicテーマについて

[Academic 公式サイト](https://sourcethemes.com/academic/)

GitHubで一番⭐Starが多いHugoテーマ

このHugoテーマのターゲットは、大学や研究機関に属する研究者のポートフォリオサイトらしい。  
RとかLatexなど、研究用のソフトウェアに互換する設定項目が多数見受けられる。  
でも、個人ブログやポートフォリオなどの一般的なWebサイトビルダーとしても使えるというスタンスらしい。

デモを見る限りでも、スタイリッシュかつ多機能でいろいろな人に使われているのは分かった。  
でも、日本語情報が少ないので使い方を調べるのに困りました。

僕は楽をしてそこそこなデザインのブログが書きたいだけなのに😂


でもなんとか、ブログとしての運用までこぎつけたので、  
備忘録を残しておきます。


# Academic テーマの使い方

## Academicを使う前に

Hugoがはじめての人は、公式サイトのDocumentを読んで、  
基本的な概念を頭に入れておきましょう。

といっても、全部読んでるときりがないので、読むべきとこだけ抜粋します。  
最低でもQuick Start、さらにContent Managementのセクション全体を読めば良いでしょう。

- [Quick Start](https://gohugo.io/getting-started/quick-start/)
- [Content Management](https://gohugo.io/content-management/)




## install

academic-kickstartのリポジトリをクローンするのが簡単

{{< highlight bash>}}
git clone https://github.com/sourcethemes/academic-kickstart.git My_Website
{{< /highlight >}}
Academic themeはgit submoduleになってるので更新する。

```bash
cd My_Website
git submodule update --init --recursive
```

デフォルト状態のページを確認したければ、以下のコマンドを実行して `localhost:1313` にアクセスしてみてください。

```bash
hugo server
```

注意 : 真っ白な画面が出たら、`git submodule update`を忘れていてthemesをロードできてない可能性が高いです

## 最小限の設定

プロジェクトルートにあるconfig.tomlではなく、  
`/config/_default/`フォルダにある4つの.tomlファイルを編集します。

- config.toml
- language.toml
- menus.toml
- params.toml

最小限必要だと思う設定を書いたので、参考にしてみて。


```toml
# /config/_default/config.toml

# サイトの基本設定
title = "Maxのブログ"
baseurl = "https://max-blog.ga/"
copyright = "greatsword8821@gmail.com"

# 言語設定
defaultContentLanguage = "ja"  # 出力後の <html lang=""> の部分
hasCJKLanguage = true          # trueにすると、日中韓の言語で文字カウントとかが正しく動作する
```

```toml
# /config/_default/language.toml

# 最初は英語がonになっているので、コメントアウトしておく
# [en]
#   languageCode = "en-us"

[ja]
  languageCode = "ja"
```

```toml
# /config/_default/menus.toml

# themeのpartial部品を編集しなくても、ここで設定した項目で自動的にメニューバーを生成される。

# [[main]] 辞書のリスト型
[[main]]
  name = "Home"
  url = "#about"  # / をつけないで #anchor を書くと、ホーム画面内のアンカーリンクになる
  weight = 10     # weightが軽いほどメニューの左側に表示される 


[[main]]
  name = "Skills"
  url = "#skills"
  weight = 15

[[main]]
  name = "Post"
  url = "/post"   # urlは、/content/ フォルダーを基準にした相対パスを指定する
  weight = 20
```

```toml
# /config/_default/params.toml

# 見た目に大きく関わる設定ファイル

theme = "Ocean"   # AcademicのTheme。気軽にカラーリングなどを変えられる
font_size = "M"   # フォントサイズ。(初期設定だとL)

# コードブロックのsyntax hilightのスタイル。
# Academic Theme との組み合わせによってはコードが見づらくなるので、必ず検討する。
# https://highlightjs.org/static/demo/ からスタイル名を探して入れる
highlight_style = "vs2015"

#   Examples: "Mon, Jan 2, 2006" or "2006-01-02"
date_format = "2006/01/02"
#   Examples: "3:04 pm" or "15:04"
time_format = "3:04 PM"

# カスタムCSSを使いたいなら書く
plugins_css = ["custom"]

# Google analytics
[marketing]
  google_analytics = ""
  google_tag_manager = ""

```

これらの設定は、.tomlに元々のデフォルト値が書いてある。

気分によっていろいろ試したい人は、  
**元の部分をコメントアウト**して、**よく使う設定をファイルのトップにまとめて書く**  
とアクセスしやすくなっていいと思う。


## 最小限の`/content/`フォルダ構成

Hugoは、プロジェクトルートにある `content` フォルダ以下にある  
ページバンドルに対して、自動的にルーティングを作成します。  
(ページバンドルが何かは、[Page Bundle](https://gohugo.io/content-management/page-bundles/)を見てください。)

で、academic-kickstartを`git clone`した直後の`/content/`フォルダはこんな感じです。

```bash
content
├── authors
│   └── admin
├── home
│   ├── about.md
│   ├── accomplishments.md
│   ├── contact.md
│   ├── demo.md
│   ├── experience.md
│   ├── featured.md
│   ├── hero.md
│   ├── index.md
│   ├── people.md
│   ├── posts.md
│   ├── projects.md
│   ├── publications.md
│   ├── skills.md
│   ├── slider.md
│   ├── tags.md
│   └── talks.md
├── post
│   └── _index.md
├── publication
│   └── _index.md
└── talk
    └── _index.md
```

`content/home/`フォルダはズバリ、ルーティングで言うところの"/"ルートに該当します。

何やらたくさんのmdファイルが入っていますね。  
これらはwidgetと呼ばれ、`home`フォルダにファイルを追加するだけでhomeページにパーツを追加できるというものです。

index.md ファイル以外は必須ではないので、必要ないウィジェットは削除します。  
すべてのウィジェットは`/themes/academic/exampleSite/content/home` に入ってるので、必要になったらそこからコピーすれば問題ありません。

あと、個人的なブログでは publication(出版物) や talk(講演) といったセクションは必要ないので、  
それらのセクションフォルダも削除します。

僕のブログの`/content/`フォルダの構成はこんな感じになりました。

```bash
content
├── authors
│   └── admin
├── home
│   ├── about.md
│   ├── index.md
│   ├── posts.md
│   └── skills.md
└── post
    └── _index.md
```

## 自己紹介を書こう

Academicテーマで作成されたサイトは、複数人のauthorで運用できるように工夫されています。

`content/author` フォルダに存在するページバンドル1単位がauthor1人分に対応しているようです。

デフォルトだと、`admin` というauthorが存在します。  
英語のドキュメントを解読するのがめんどかったので、僕は `hugo server` コマンドで  
ホットリロードしながらデフォルトの `admin/_index.md` を改変して自分のプロフィールを作成しました。

こんな感じ

```bash
content/authors
└── max  # リネームした
    ├── _index.md
    └── avatar.jpg
```

ここで設定した情報は、 `content/home/about.md` ウィジェットに表示されます。


```yaml
# content/authors/max/_index.md
---
# Display name
name: Max

# Username (this should match the folder name)
authors:
- max

superuser: true

# Role/position
role: 野良プログラマ

# bio = biographyの略。自己紹介、経歴、趣味など
bio: 転職活動中。

# 関心事のリスト
interests:
- Flutter & Dart
- Go
- Rust

# ソーシャルアイコン。font awesomeを使ってるっぽい
social:
- icon: envelope
  icon_pack: fas
  link: 'mailto:test@harumaxy@gmail.com'
- icon: twitter
  icon_pack: fab
  link: https://twitter.com/maxy8653
- icon: github
  icon_pack: fab
  link: https://github.com/harumaxy

# ユーザーグループ。個人ブログならいらないかも？
user_groups:
-  Programmers
---

このサイトはしがないプログラマの独り言を書くブログ。  
Hugo + Academicテーマ を使って作成してます。
```

```toml
# content/home/about.md
+++
# About widget.
widget = "about"  
headless = true  
active = true  
weight = 20  

# タイトルを日本語にしとく
title = "自己紹介"

# 表示するauthorを指定する
author = "max"
+++
```

### avatar.jpgを変更

デフォルトで、`avatar.jpg`という画像ファイルが入ってますが、  
これを差し替えることでアバター画像を変えられます。

1. 元の `avatar.jpg` を削除
2. 好きな画像を同じ場所に入れる
3. `avatar.jpg`にリネーム

.pngでも行けるかは知らん

### .mdに入っている +++ とか -\-- について

これは、**Front Matter**という、**markdown**に **TOML** や **YAML** で**メタデータ**を付けるための  
markdownの仕様です。

Front Matterの情報を使って、バックエンドではGoがhtml/templateパッケージでレンダリングします。  
どっちかというとAcademicテーマではなくHugo本体の仕様です。

`+++` もしくは `---` で囲まれた範囲にメタデータを記述できます。

- `+++` : toml
- `---` : yaml

Hugo的にはどっちを使ってもいいんですが、  
Academic Themeはところどころ `+++` と `---` が混ざってるので混乱しないように。


## 記事を書いてみる

ここまでで設定は完了です。  
次はmarkdownで記事を書いてみましょう。

`hugo new [path]` コマンドで、`/content/` フォルダ以下にmarkdownコンテンツが作成されます。

```bash
hugo new post/first-post.md
# もしくは
hugo new post/first-post
```

上のコマンドは、拡張子の `.md` まで書いてあるので markdown ファイルが作成されます。

下のコマンドは、拡張子まで書かないことで、ページバンドルフォルダが作成されます。

```bash
first-post
└── index.md
```

- markdown記事単体が書きたいなら `.md` あり
- 記事内で使う画像ファイルなどを記事と一緒にフォルダにまとめたいなら `.md` なし

と覚えましょう


# まとめ

いかがだったでしょうか。

ぶっちゃけ、wordpressとかと比べてグラフィカルな設定ができないので、合わない人は合わないかも？  
僕はこういうTOMLとかYAMLとかの設定書いてると、ハックしてる感じがして好きなんだけど。

でもまあ、Hugoの爆速ビルド+Firebaseの爆速ホスティングは  
WordPress + PHP + MySQL みたいなスタックよりUX, DXが優れてると思うので、  
エンジニアの方はぜひ試して見てはいかがでしょうか。


そのうちCircleCIでGitHubへのpushからFirebaseへのデプロイまで自動化したい
