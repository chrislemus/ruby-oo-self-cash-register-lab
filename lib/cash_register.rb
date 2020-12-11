class CashRegister
  attr_accessor :total
  attr_reader :items, :discount, :prev_transaction
  # attr_reader :employee_discount
  def initialize(employee_discount = 0)
    @total = 0
    @items = []
    @discount = employee_discount
  end
  def add_item(title, price, quantity = 1)
    @prev_transaction = {items: @items, total: @total }
    quantity.times { @items << title }
    @total += price * quantity
  end
  def apply_discount
    return "There is no discount to apply." if @discount === 0
    @total *= 1 - @discount.to_f/100
    "After the discount, the total comes to $#{total.round(0)}."
  end
  def void_last_transaction
    @items = @prev_transaction[:items]
    @total = @prev_transaction[:total]
  end
end

