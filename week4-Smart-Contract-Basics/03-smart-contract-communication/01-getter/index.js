/**
 * Find the `value` stored in the contract
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @return {promise} a promise which resolves with the `value`
 */
async function getValue(contract) {
  return await contract.value();
}

module.exports = getValue;
