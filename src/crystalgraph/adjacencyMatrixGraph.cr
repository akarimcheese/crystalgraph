module CrystalGraph
    class AdjacencyMatrixDiGraph
        def initialize(size : Int32, weighted : Bool = false)
            @matrix = Array(Array(Int32|Nil)).new(size) { |i|
                a = Array.new(size, nil)
                a[i] = 0
                a
            }
            @size = size
            @weighted = weighted
        end
        
        def add_node(): Int
            node = @size
            @size = @size + 1
            @matrix[node] = Array.new(@size, nil)
            @matrix[node][node] = 0
            
            return node
        end
        
        def add_edge(source : Int, target : Int, weight : Int? = nil)
            if weight && !@weighted
                raise "Weight provided for unweighted graph"
            end
            
            if !weight && @weighted
                raise "Weight not provided for weighted graph"
            end
            
            if source >= @size
                raise "Source #{source} is not in Adjacency Matrix of width #{@size}"
            end
            
            if target >= @size
                raise "Target #{target} is not in Adjacency Matrix of width #{@size}"
            end
            
            weight = weight || 1
            @matrix[source][target] = weight
        end
        
        def []=(index : Tuple(Int, Int), weight : Int?)
            add_edge(index[0], index[1], weight)
        end
    end

end
