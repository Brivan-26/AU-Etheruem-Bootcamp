const provider = require("./provider");

async function getTotalBalance(addresses) {
  let sum = 0;
  for (let i = 0; i < addresses.length; i++) {
    const response = await provider.send({
      jsonrpc: "2.0",
      id: 1,
      method: "eth_getBalance",
      params: [addresses[i], "latest"],
    });
    sum += parseInt(response.result);
  }

  return sum;
}

module.exports = getTotalBalance;
