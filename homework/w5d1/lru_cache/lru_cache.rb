  class LRUCache

    def initialize(size)
        @cache = Array.new(size)
    end

    def count
        cache.count {|el| !el.nil?}
    end

    def add(el)
        cache.include?(el) ? cache.delete(el) : cache.shift
        cache.push(el)
        true
    end

    def show
        p cache
    end

    private
    attr_accessor :cache

  end