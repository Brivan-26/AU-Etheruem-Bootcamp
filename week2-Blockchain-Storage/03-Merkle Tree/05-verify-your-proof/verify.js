function verifyProof(proof, node, root, concat) {
  proof.forEach(({ data, left }) => {
    if (left) {
      node = concat(data, node);
    } else {
      node = concat(node, data);
    }
  });

  return node === root;
}

module.exports = verifyProof;
    