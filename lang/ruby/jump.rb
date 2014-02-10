#! /usr/bin/ruby
# coding: utf-8

langages = %w(Japanese English Chinese)

langages.each do |lang|
    puts lang

    if lang == 'Japanese'
        puts 'Are you japanese?'

        break
    end
    puts 'test_not_jump'
end

puts 'test'
