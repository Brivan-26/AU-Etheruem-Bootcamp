const SHA256 = require("crypto-js/sha256");
const TARGET_DIFFICULTY =
  BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
  mempool.push(transaction);
}

function mine() {
  const block = {
    id: blocks.length,
    transactions: [],
    nonce: -1,
  };
  let i = 1;
  while (mempool[0] && i <= MAX_TRANSACTIONS) {
    block.transactions.push(mempool.shift());
    i++;
  }
  let blockHash;
  do {
    blockHash = SHA256(JSON.stringify(block));
  } while (BigInt(`0x${blockHash}`) < TARGET_DIFFICULTY);
  block.hash = blockHash;
  blocks.push(block);
}

module.exports = {
  TARGET_DIFFICULTY,
  MAX_TRANSACTIONS,
  addTransaction,
  mine,
  blocks,
  mempool,
};
