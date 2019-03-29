require "../adjacencyMatrixGraph"

size = 9
graph = CrystalGraph::AdjacencyMatrixGraph.new(size, true, true)

graph[{0,1}] = 4
graph[{0,7}] = 8
graph[{1,2}] = 8
graph[{1,7}] = 11
graph[{2,3}] = 7
graph[{2,5}] = 4
graph[{2,8}] = 2
graph[{3,4}] = 9
graph[{3,5}] = 14
graph[{4,5}] = 10
graph[{5,6}] = 2
graph[{6,7}] = 1
graph[{6,8}] = 6
graph[{7,8}] = 7

def djikstra(graph : CrystalGraph::AdjacencyMatrixGraph, src : Int32, nodes : Enumerable(Int32)): Array(Int64)
    nodeCount = nodes.size
    
    # Set distances to all nodes as infinity
    dist = Array(Int64).new(nodeCount, Int64::MAX)
    # Set distance to source as 0
    dist[src] = 0
    
    # Set all nodes as univisted
    visited = Array(Bool).new(nodeCount, false)
    
    nodeCount.times {
        unvisited = nodes.select { |node|
            !visited[node]
        }
        cur = unvisited.min_by { |node|
            dist[node]
        }
    
        
        nodes.each { |node|
            stepDist = graph[{cur, node}] || Int64::MAX
            if stepDist != Int64::MAX && dist[cur] != Int64::MAX
                dist[node] = [dist[node], dist[cur] + stepDist].min
            end
        }
        
        visited[cur] = true
    }
    
    return dist
end

distances = djikstra(graph, 0, (0..8))
puts distances.inspect