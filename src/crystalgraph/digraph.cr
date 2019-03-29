module CrystalGraph
    alias Attributes = Hash(String, Object)
    
    class DiGraph(T)
        def initialize
            @nodes = {} of T => Attributes
            
            @succ = {} of T => Hash(T, Attributes)
            @pred = {} of T => Hash(T, Attributes)
        end
        
        def add_node(n : T, attr : Attributes? = nil)
            node_attr = attr | empty_attribute
            
            if node = @nodes[n]?
                if attr
                    node.merge!(node_attr)
                end
            else
                @nodes[n] = node_attr
                @succ[n] = {} of T => Attributes
                @pred[n] = {} of T => Attributes
            end
        end
        
        def add_edge(source : T, target : T, attr : Attributes? = nil)
            edge_attr = attr | empty_attribute
            
            if !@nodes[source]?
                @nodes[source] = empty_attribute
                @succ[source] = {} of T => Attributes
                @pred[source] = {} of T => Attributes
            end
            if !@nodes[target]?
                @nodes[target] = empty_attribute
                @succ[target] = {} of T => Attributes
                @pred[target] = {} of T => Attributes
            end
            
            if edge = @succ[source][target]
                edge.merge!(edge_attr)
            else
                @succ[source][target] = edge_attr
                @pred[target][source] = edge_attr
            end
        end
        
        def empty_attribute
            {} of String => Object
        end
    end

end
