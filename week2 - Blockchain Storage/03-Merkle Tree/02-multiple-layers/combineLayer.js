class MerkleTree {
  constructor(leaves, concat) {
    this.leaves = leaves;
    this.concat = concat;
  }
  getRoot() {
    let level = this.leaves.length;
    while (level >= 2) {
      let j = 0;
      let i = 0;
      while (i < level) {
        this.leaves[j] = this.concat(this.leaves[i], this.leaves[i + 1]);
        j++;
        i = i + 2;
      }
      level = level / 2;
    }
    return this.leaves[0];
  }
}

module.exports = MerkleTree;
