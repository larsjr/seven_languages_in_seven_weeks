class Tree
    attr_accessor :children, :node_name

    def initialize(tree_rep)
        tree_rep.each do |parent, children|
            @children = []
            @node_name = parent
            add_children(children)
        end
    end

    def visit_all(&block)
        visit &block
        children.each{|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end

    def add_children(desc)
        desc.each do |parent, children|
            @children.append(Tree.new({parent => children}))
        end
    end

end


desc = {'grandpa' => {'dad' => { 'child 1' => {}, 'child 2' => {}  }, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}

t = Tree.new(desc)

puts "Visiting entire tree"
t.visit_all {|node| puts node.node_name}