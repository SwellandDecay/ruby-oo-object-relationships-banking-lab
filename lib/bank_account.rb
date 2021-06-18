class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name = nil)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit)
        @balance += deposit
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end

end

# BankAccount
#   #initialize
#     can initialize a Bank Account (FAILED - 1)
#     initializes with a name (FAILED - 2)
#     always initializes with balance of 1000 (FAILED - 3)
#     always initializes with a status of 'open' (FAILED - 4)
#     can't change its name (FAILED - 5)
#   #deposit
#     can deposit money into its account (FAILED - 6)
#   #display_balance
#     can display its balance (FAILED - 7)
#   #valid?
#     is valid with an open status and a balance greater than 0 (FAILED - 8)
#   #close_account
#     can close its account (FAILED - 9)