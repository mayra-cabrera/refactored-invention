class Tipper
  TAX = 0.05

  def initialize(amount:, discount_percentage: 0, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

  def total
    amount + total_tax - discounted_amount + tip_given
  end

  attr_reader :amount, :discount_percentage, :tip_percentage
  
  private

  def total_tax
    amount * TAX
  end

  def discounted_amount
    amount * (discount_percentage / 100.0)
  end

  def tip_given
    amount * (tip_percentage / 100.0)
  end

end
