class PQ

    def initialize array = [], heapify = true, &is_unordered
        raise ArgumentError.new 'PQ init' unless
            array.class == Array &&
            (heapify == true || heapify == false) &&
            block_given?
        @a, @u = array, is_unordered
        return unless heapify
        i = @a.size / 2
        sink i while (i -= 1) >= 0
    end

    def size = @a.size
    def empty? = @a.empty?
    def top = @a.first

    def << x
        i = @a.size
        @a << x
        while i > 0
            p = (i - 1) / 2
            break unless @u.call @a[p], @a[i]
            @a[p], @a[i] = @a[i], @a[p]
            i = p
        end
    end

    def pop
        return @a.pop if @a.size < 2
        t, @a[0] = @a.first, @a.pop
        sink 0
        t
    end

    private

    def sink p
        z = @a.size
        while (c = p * 2 + 1) < z
            r = c + 1
            c = r if r < z && @u.(@a[c], @a[r])
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

