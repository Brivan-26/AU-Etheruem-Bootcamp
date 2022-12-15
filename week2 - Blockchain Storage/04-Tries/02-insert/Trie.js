const TrieNode = require("./TrieNode");

class Trie {
  constructor(node) {
    this.root = new TrieNode();
  }

  insert(word) {
    const inputs = word.split("");
    const nodes = [this.root];
    inputs.forEach((letter, idx) => {
      const newNode = new TrieNode(letter);
      nodes.push(newNode);
      nodes[idx].children[letter] = newNode;
    });

    nodes[nodes.length - 1].isWord = true;
  }
}

module.exports = Trie;
