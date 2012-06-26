# Write a program to determine the lowest common ancestor of two nodes in a
# binary search tree. You may hardcode the following binary search tree in your
# program:
#
#     30
#     |
#   ____
#   |   |
#   8   52
#   |
# ____
# |   |
# 3  20
#     |
#    ____
#   |   |
#   10 29
#
# Input sample:
#
# The first argument will be a text file containing 2 values that represent two
# nodes within the tree, one per line. e.g.
#
# 8 52
# 3 29
#
# Output sample:
#
# Print to stdout, the least common ancestor, one per line.
# e.g.
#
# 30
# 8

class Node
  attr_accessor :value, :left, :right
end

def insert value, tree
  if tree.nil?
    node = Node.new
    node.value = value
    return node
  end

  if value <= tree.value
    tree.left = insert(value, tree.left)
  else
    tree.right = insert(value, tree.right)
  end
  tree
end

def lca min, max, tree
  if min <= tree.value and max <= tree.value
    return tree if min == tree.value or max == tree.value
    lca min, max, tree.left
  elsif min > tree.value and max > tree.value
    lca min, max, tree.right
  else
    tree
  end
end

tree = nil
[30, 8, 52, 3, 20, 10, 29].each do |v|
  tree = insert v, tree
end

File.open(ARGV[0]).map { |line| line.split.map(&:to_i).sort }.each do |nodes|
  min, max = nodes
  puts lca(min, max, tree).value
end
