const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
  const cleanPublicKey = publicKey.slice(1, publicKey.length);
  const hashedPublicKey = keccak256(cleanPublicKey);

  return hashedPublicKey.slice(-20);
}

module.exports = getAddress;
