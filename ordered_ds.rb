class PQ

    def initialize(array = [], heapify = true, &is_unordered)
        raise ArgumentError.new 'PQ init' unless array.class == Array &&
            (heapify == true || heapify == false) && block_given?
        @a, @z, @u = array, array.size, is_unordered
        return if @a.empty? || !heapify
        i = 1 << Math.log(@z, 2).floor
        sink i while (i -= 1) >= 0
    end

    def top = @z > 0 ? @a.first : nil

    def << x
        @a[i = @z] = x
        @z += 1
        while i > 0
            p = (i - (i[0] ^ 1)) / 2
            break unless @u.call @a[p], @a[i]
            @a[p], @a[i] = @a[i], @a[p]
            i = p
        end
    end

    def pop
        return nil unless r = top
        @a[0] = @a[@z -= 1]
        sink 0
        r
    end

    private

    def sink p
        while (c = p * 2 + 1) < @z
            c += 1 if c.n < @z && @u.(@a[c], @a[c.n])
            break unless @u.call @a[p], @a[c]
            @a[p], @a[c] = @a[c], @a[p]
            p = c
        end
    end

end

class MinQ < PQ
    def initialize(a = [], h = true) = super(a, h) { _1 > _2 }
end

class MaxQ < PQ
    def initialize(a = [], h = true) = super(a, h) { _1 < _2 }
end

