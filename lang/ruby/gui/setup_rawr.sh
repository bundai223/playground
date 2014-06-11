#! /bin/bash
# setup Rawr Project setting.

#ref) http://blog.supermomonga.com/articles/jruby/javafx-rawr.html

function mkcddir() {
    mkdir -p $1

    if [ -d $1 ]; then
        cd $1
    fi
}

function setup_rawr() {
    jruby -S rawr install
}

function resolvDependGems() {
    dirpath=./lib/ruby
    mkdir -p $dirpath

    if [ -d $1 ]; then
        jruby -S gem install -i $dirpath jrubyfx jrubyfx-fxmlloader --no-rdoc --no-ri
    fi
}

mkcddir $@ && setup_rawr && resolvDependGems

