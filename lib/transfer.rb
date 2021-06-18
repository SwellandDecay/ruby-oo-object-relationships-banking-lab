require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def self.all
    @@all
  end

  def execute_transaction
    # check for duplicate transactions. reject transaction if it is duplicate
    if Transfer.all.any?{|transfer| transfer == self}
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.transfer_funds
    end
  end

  def transfer_funds
    if self.valid? && @sender.balance >= @amount 
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      @@all << self
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end