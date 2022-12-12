class Tree {
  constructor() {
    this.root = null;
  }

  addNode(node) {
    if (!this.root) {
      this.root = node;
    } else {
      if (node.data < this.root.data) {
        this.root.left = node;
      } else {
        this.root.right = node;
      }
    }
  }
}

module.exports = Tree;
