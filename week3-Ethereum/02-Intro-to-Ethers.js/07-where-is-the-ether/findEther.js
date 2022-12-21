const { providers } = require("ethers");
const { ganacheProvider } = require("./config");

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Given an ethereum address find all the addresses
 * that were sent ether from that address
 * @param {string} address - The hexidecimal address for the sender
 * @async
 * @returns {Array} all the addresses that receieved ether
 */
async function findEther(address) {
  const receivedAddresses = [];
  for (let i = 1; i <= 3; i++) {
    const blockTransactions = (await provider.getBlockWithTransactions(i))
      .transactions;
    const fromTransactions = blockTransactions.filter(
      (tx) => tx.from === address
    );
    fromTransactions.forEach((tx) => receivedAddresses.push(tx.to));
  }

  return receivedAddresses;
}

module.exports = findEther;
