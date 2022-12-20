class Transaction {
  constructor(inputUTXOs, outputUTXOs) {
    this.inputUTXOs = inputUTXOs;
    this.outputUTXOs = outputUTXOs;
  }
  execute() {
    this.inputUTXOs.forEach((TXO) => {
      if (TXO.spent) throw "TX already spent!";
    });
  }
}

module.exports = Transaction;
