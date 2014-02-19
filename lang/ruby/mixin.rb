#! /usr/bin/ruby
# coding: utf-8

module Greeter
    def good_morning
        puts 'Good morning.'
    end

    def hello
        puts 'hello'
    end

    def good_afternoon
        puts 'gf'
    end

    module_function :hello
    module_function :good_afternoon

end

class Sample
    include Greeter
end

sample = Sample.new
sample.good_morning
#sample.good_afternoon #error
