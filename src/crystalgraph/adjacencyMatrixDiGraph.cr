module CrystalGraph
    class AdjacencyMatrixDiGraph
        def initialize(size : Int32, weighted : Bool = false, nilAsMax : Bool = true)
            @matrix = Array(Array(Int32|Nil)).new(size) { |i|
                a = Array(Int32|Nil).new(size, nil)
                a[i] = 0
                a
            }
            @size = size
            @weighted = weighted
            @nilAsMax = nilAsMax
        end
        
        def add_node(): Int32
            node = @size
            @size = @size + 1
            newColumn = Array.new(@size, nil)
            newColumn[node] = 0
            @matrix << newColumn
            
            return node
        end
        
        def add_edge(source : Int32, target : Int32, weight : Int? = nil)
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
        
        @[AlwaysInline]
        def []=(index : Tuple(Int32, Int32), weight : Int?)
            add_edge(index[0], index[1], weight)
        end
        
        def [](index : Tuple(Int32, Int32)): Int64?
            if (weight = @matrix[index[0]][index[1]]) || @nilAsMax
                return (weight || Int64::MAX).to_i64
            end
            
            return nil
        end
    end

end
