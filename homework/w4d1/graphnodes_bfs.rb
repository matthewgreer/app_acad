# Not really focusing very well on this homework with the assessment tomorrow
# Plus, I don't really understand Sets, nor how to structure the bfs
require "byebug"
require "set"

class GraphNode

    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(new_neighbor)
        self.add_neighbor << new_neighbor
    end

end

def bfs(starting_node, target_value)
    searched = Set.new()
    queue = [starting_node]

    # need loop. while? helper method ? _bfs?
    while !queue.empty?
        # debugger
        test_node = queue.shift
        if !searched.include?(test_node)
            return test_node if test_node.value == target_value
            # debugger
            queue += test_node.neighbors
            searched.add(test_node)
        end
    end
    nil
end

# def _bfs(node, target_value)

# end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")

p bfs(a, "f")
