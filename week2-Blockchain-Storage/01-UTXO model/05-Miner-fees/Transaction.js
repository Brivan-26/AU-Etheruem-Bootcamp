class Transaction {
  constructor(inputUTXOs, outputUTXOs) {
    this.inputUTXOs = inputUTXOs;
    this.outputUTXOs = outputUTXOs;
    this.fee = null;
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
    const fee = totalInputAmount - totalOutputAmount;
    if (fee < 0) throw "Not sufficiant amount!";
    this.inputUTXOs.forEach((TXO) => TXO.spend());
    this.fee = fee;
  }
}

module.exports = Transaction;
