require_relative 'bank_account.rb'
require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if valid? && self.status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      @status
      "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status == "complete" && valid? && sender.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end

#binding.pry 
