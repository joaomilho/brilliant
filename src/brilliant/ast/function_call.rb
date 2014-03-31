require "brilliant/ast/node"
require "llvm/core"


class Brilliant::AST::FunctionCall < Brilliant::AST::Node
  def initialize(child_nodes)
    @function_name = child_nodes.first
    @arg_list = child_nodes.last
  end

  def generate_code(mod, builder)
    args = @arg_list.map{|arg| arg.generate_code(mod, builder)}
    builder.call(mod.functions[@function_name], *args)
  end
end
