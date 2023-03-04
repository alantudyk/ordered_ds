#!/bin/ruby

require 'algorithms'

class OMap < Containers::CRBTreeMap
    def initialize(d = nil) = (@d = d)

    def [](k) = has_key?(k) ? get(k) : @d
end

class OMSet < Containers::CRBTreeMap
end

class OSet < OMSet
end

class MinQ
end

class MaxQ
end

m = OMap.new 0
p [m[1] += 1, m.size]
