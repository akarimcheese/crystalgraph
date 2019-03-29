require "./adjacencyMatrixDiGraph"


module CrystalGraph
    class AdjacencyMatrixGraph
        def initialize(size : Int32, weighted : Bool = false, nilAsMax : Bool = false)
            @diGraph = CrystalGraph::AdjacencyMatrixDiGraph.new(size, weighted, nilAsMax)
        end
        
        def add_node(): Int32
            @diGraph.add_node()
        end
        
        def add_edge(source : Int32, target : Int32, weight : Int? = nil)
            @diGraph[{source, target}] = weight
            @diGraph[{target, source}] = weight
        end
        
        @[AlwaysInline]
        def []=(index : Tuple(Int32, Int32), weight : Int?)
            @diGraph[index] = weight
            @diGraph[{index[1], index[0]}] = weight
        end
        
        def [](index : Tuple(Int32, Int32)): Int64?
            @diGraph[index]
        end
    end

end
