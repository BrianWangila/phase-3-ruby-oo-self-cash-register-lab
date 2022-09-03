

class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, optional_amount = 1)
    self.last_transaction = price * optional_amount
    self.total = self.total + self.last_transaction
    optional_amount.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      applied_discount = (100 - self.discount.to_f) / 100
      self.total = (self.total * applied_discount).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end

# cash_register = CashRegister.new(0, 20)

# puts cash_register.total