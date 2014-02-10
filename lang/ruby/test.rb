# !/usr/bin/ruby
# fileencoding utf-8

puts "a"
a = [1, 4, 6, 10]
a.each{|n|
    puts n
}
puts "b"
b = a.map {|n| n * 2 }
b.each{|n|
    puts n
}

puts "test.rb"
open( "test.rb", "r") {|f|
    puts "********************"
    f.each_line.each {|line|
        puts "* " + line
    }
    puts "********************"
}

