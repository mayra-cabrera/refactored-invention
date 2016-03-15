class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1,
  }

  TAX = 0.05

  def initialize(output: $stdout, items:)
    @output = output
    @items = items
    @subtotal = 0.0
  end

  def print
    @subtotal = calculate_subtotal
    display_divider
    display_subtotal
    display_tax
    display_divider
    display_total
  end

  attr_reader :output, :items

  private
    
  def calculate_subtotal
    items.reduce(0) do |sum, item|
      item_cost = COST[item]
      print_output(item, item_cost)
      sum + item_cost.to_i
    end
  end

  def print_output item, item_cost
    output.puts "#{item}: #{sprintf('$%.2f', item_cost)}"
  end

  def display_divider
    output.puts '-' * 13
  end

  def display_subtotal 
    output.puts "subtotal: #{sprintf('$%.2f', @subtotal)}"
  end

  def display_tax 
    output.puts "tax: #{sprintf('$%.2f', subtotal_tax)}"
  end

  def display_total 
     output.puts "total: #{sprintf('$%.2f', total)}"
  end

  def subtotal_tax
    @subtotal * TAX
  end

  def total
    @subtotal + (@subtotal * TAX)
  end
end
