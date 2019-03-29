require "./adjacencyMatrixDiGraph"


module CrystalGraph
    class AdjacencyMatrixGraph
        def initialize(size : Int32, weighted : Bool = false)
            @diGraph = CrystalGraph::AdjacencyMatrixDiGraph.new(size, weighted)
        end
        
        def add_node(): Int
            @diGraph.add_node()
        end
        
        def add_edge(source : Int, target : Int, weight : Int? = nil)
            @diGraph[{source, target}] = weight
            @diGraph[{target, source}] = weight
        end
        
        def []=(index : Tuple(Int, Int), weight : Int?)
            @diGraph[index] = weight
            @diGraph[{index[1], index[0]}] = weight
        end
    end

end
