const Block = require("../02-what-is-in-a-hash?/Block");

class Blockchain {
  constructor() {
    this.chain = [new Block("")];
  }
}

module.exports = Blockchain;
