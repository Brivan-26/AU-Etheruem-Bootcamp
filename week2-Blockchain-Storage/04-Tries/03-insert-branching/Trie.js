const TrieNode = require("./TrieNode");

class Trie {
  constructor() {
    this.root = new TrieNode();
  }

  insert(word, root = this.root) {
    const inputs = word.split("");

    inputs.forEach((letter) => {
      if (root.children.hasOwnProperty(letter)) {
        root = root.children[letter];
      } else {
        let node = new TrieNode(letter);
        root.children[letter] = node;
        root = node;
      }
    });
    root.isWord = true;
  }
}

module.exports = Trie;
