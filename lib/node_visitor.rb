class NodeVisitor
  def visit(node)
    method_name = ('visit_' + node.type.to_s).to_sym
    #method_name = node.class.name

    #if method_name.eql? 'BinOp'
    #  return visit_BinOp(node)
    #elsif method_name.eql? 'Num'
    #  return visit_Num(node)
    #end
    #visitor = AST.method(method_name)
    return send(method_name, node)
    #return method_name
  end
end
