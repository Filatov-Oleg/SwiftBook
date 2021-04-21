class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}


protocol Command {
    func execute()
    var isComplete: Bool {get set}
}


class Deposit: Command {
    
    private var _account: Account
    private var _amount: Int
    
    var isComplete = false
    
    func execute() {
        self._account.balance += self._amount
        isComplete = true
    }
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
}

class WithDraw: Command {
    
    private var _account: Account
    private var _amount: Int
    
    var isComplete = false
    
    func execute() {
        if self._account.balance >= self._amount {
            self._account.balance -= self._amount
            isComplete = true
        } else {
            print("Not enough money")
        }
    }
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
}

class TransactionManager {
    static let shared = TransactionManager ()
    private init() {}
    private var _transaction: [Command] = []
    
    var pendingTransactions: [Command] {
        get {
            return self._transaction.filter{$0.isComplete == false}
        }
    }
    
    func addTransaction(command: Command) {
        self._transaction.append(command)
    }
    
    func processingTransaction() {
        self._transaction.filter{$0.isComplete == false}.forEach{$0.execute()}
    }
}


let account = Account(accountName: "Ivan Invanov", balance: 1000)
let transactionManager = TransactionManager.shared
transactionManager.addTransaction(command: Deposit(account: account, amount: 500))
transactionManager.addTransaction(command: WithDraw(account: account, amount: 100))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransaction()
account.balance

