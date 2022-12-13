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
      while (i < level - 1) {
        this.leaves[j] = this.concat(this.leaves[i], this.leaves[i + 1]);
        j++;
        i = i + 2;
        if (i == level - 1) {
          this.leaves[j] = this.leaves[i];
        }
      }
      level = Math.round(level / 2);
    }
    return this.leaves[0];
  }

  getProof(index, layer = this.leaves, proof = []) {
    if (layer.length === 1) return proof;
    const newLayer = [];
    for (let i = 0; i < layer.length; i += 2) {
      let left = layer[i];
      let right = layer[i + 1];
      if (!right) {
        newLayer.push(left);
      } else {
        newLayer.push(this.concat(left, right));

        if (i === index || i === index - 1) {
          let isLeft = !(index % 2);
          proof.push({
            data: isLeft ? right : left,
            left: !isLeft,
          });
        }
      }
    }
    return this.getProof(Math.floor(index / 2), newLayer, proof);
  }
}

module.exports = MerkleTree;
