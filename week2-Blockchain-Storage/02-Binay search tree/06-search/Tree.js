class Tree {
  constructor() {
    this.root = null;
  }

  addNode(node) {
    let currentNode = this.root;
    if (currentNode == null) {
      this.root = node;
      return;
    }
    while (currentNode !== null) {
      if (node.data < currentNode.data) {
        if (currentNode.left == null) {
          currentNode.left = node;
          return;
        }
        currentNode = currentNode.left;
      } else {
        if (currentNode.right == null) {
          currentNode.right = node;
          return;
        }
        currentNode = currentNode.right;
      }
    }
  }
  hasNode(number) {
    let currentNode = this.root;
    if (currentNode == null) return false;
    while (currentNode !== null) {
      if (number == currentNode.data) return true;
      if (number < currentNode.data) {
        if (currentNode.left == null) return false;
        currentNode = currentNode.left;
      } else {
        if (currentNode.right == null) return false;
        currentNode = currentNode.right;
      }
    }
  }
}

module.exports = Tree;
