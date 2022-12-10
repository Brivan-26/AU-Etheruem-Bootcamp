const Block = require("../02-what-is-in-a-hash?/Block");

class Blockchain {
  constructor() {
    this.chain = [new Block("", 0)];
  }

  addBlock(block) {
    block.previousHash = this.chain[this.chain.length - 1].toHash();
    this.chain.push(block);
  }

  isValid() {
    for (let i = 1; i < this.chain.length; i++) {
      if (
        this.chain[i].previousHash.toString() !==
        this.chain[i - 1].toHash().toString()
      )
        return false;
    }

    return true;
  }
}

module.exports = Blockchain;
