class Transaction {
  constructor(inputUTXOs, outputUTXOs) {
    this.inputUTXOs = inputUTXOs;
    this.outputUTXOs = outputUTXOs;
  }
  execute() {
    let totalInputAmount = 0;
    this.inputUTXOs.forEach((TXO) => {
      if (TXO.spent) throw "TX already spent!";
      totalInputAmount += TXO.amount;
    });
    let totalOutputAmount = 0;
    this.outputUTXOs.forEach((TXO) => {
      totalOutputAmount += TXO.amount;
    });
    if (totalInputAmount < totalOutputAmount) throw "Not sufficiant amount!";
  }
}

module.exports = Transaction;
