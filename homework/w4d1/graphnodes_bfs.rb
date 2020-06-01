# Not really focusing very well on this homework with the assessment tomorrow
# Plus, I don't really understand Sets, nor how to structure the bfs

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

def bfs(starting_node, target_value)
    visited = Set.new()
    queue = [starting_node]
    return queue.first if queue.first.value == target value
    queue.push(queue.first.neighbors)
    visited.add(starting_node.value)



end

def _bfs(node, target_value)

end