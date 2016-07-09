What's ?
===============
chef で使用する capistrano の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://github.com/bageljp/"

cookbook "capistrano", git: "https://github.com/bageljp/cookbook-capistrano.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "capistrano" => {
    "user" => "user_name",
    "group" => "group_name",
    "aws" => {
      "accesskey" => "AKIXXXXXXXXXXXXXXXXX",
      "secretkey" => "XXXXXXXXXXXXXXXXXXXX"
    }
  }
)
```

Recipes
----------

#### capistrano::default
capistrano のインストールとセットアップ。

#### capistrano::deploy
deploy タスク周りのファイルのセットアップ。

Attributes
----------

主要なやつのみ。

#### capistrano::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['capistrano']['root_dir']</tt></td>
    <td>string</td>
    <td>capistrano をセットアップする先のディレクトリ。</td>
  </tr>
  <tr>
    <td><tt>['capistrano']['plugins']</tt></td>
    <td>array string</td>
    <td>インストールするcapistranoのプラグインを配列で定義。</td>
  </tr>
  <tr>
    <td><tt>['capistrano']['aws']['accesskey']</tt></td>
    <td>string</td>
    <td>ELBを操作するタスクを実行する場合のAPIキー。使わない場合は不要。</td>
  </tr>
</table>

TODO
----------

* ``['capistrano']['path']`` は使ってないかも。
