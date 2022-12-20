class Tree {
  constructor() {
    this.root = null;
  }
  // I'm wondering if we can do a recursion version by padding ONLY one parametre to addNode (node)!
  
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
}

module.exports = Tree;
