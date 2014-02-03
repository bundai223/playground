Gitに関するメモ
=================

branch・tagはlocal・remoteにそれぞれ別々に存在する。
=================

branch

    local
        develop
        master
        feature/bugfix_hoge

    remote
        develop
        master

の様な感じ（tagも同様）#TODO: 例がわかりにくい

branch・tag関連の操作
=================

local

    タグ一覧
        $ git tag

    タグ追加
        $ git tag -a [tagname] -m 'add message'

    タグ削除
        $ git tag -d [tagname]


・remote

    タグ一覧
        $ git ls-remote --tags

    タグ追加(localの共有)
        $ git push origin [tagname]

    タグ削除(localの共有)
        $ git push origin :[tagname]

