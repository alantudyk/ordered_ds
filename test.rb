#!/bin/ruby

require './lib/ordered_ds.rb'

srand 0
B = 1e9.to_i
a = 1e6.to_i.times.map { rand B }

puts
puts '    MinQ, 1M pseudorandom integers:'
puts

b = a.clone
t = Time.now
q = MinQ.new(b)
b = q.size.times.map { q.pop }
t = Time.now - t

puts b == a.sort ? "        OK, #{t} s" : raise('🤔')

puts
puts '    MaxQ, 1M pseudorandom integers:'
puts

b = a.clone
t = Time.now
q = MaxQ.new(b)
b = q.size.times.map { q.pop }
t = Time.now - t

puts b == a.sort!.reverse! ? "        OK, #{t} s" : raise('🤔')
puts

