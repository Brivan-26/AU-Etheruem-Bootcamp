const Block = require("../02-what-is-in-a-hash?/Block");

class Blockchain {
  constructor() {
    this.chain = [new Block("")];
  }

  addBlock(block) {
    this.chain.push(block);
  }
}

module.exports = Blockchain;
