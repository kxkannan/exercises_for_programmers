defmodule SelfCheckout  do

  def prompt_for_items do
    items = Enum.map(1..3, fn(n)-> prompt_item_qty(n) end)
    %{subtotal: subtotal, tax: tax, total: total} = Enum.reduce(items, %{subtotal: 0, tax: 0, total: 0}, &add_totals/2)
    IO.puts "Subtotal: $#{subtotal}"
    IO.puts "Tax: $#{tax}"
    IO.puts "Total: $#{total}"
  end

  def prompt_item_qty(num) do
    price_str = IO.gets("Enter the price of item #{num}: ")
    price = String.to_integer(String.trim(price_str))
    qty_str = IO.gets("Enter the quantity of #{num}: ")
    qty = String.to_integer(String.trim(qty_str))
    %{price: price, qty: qty}
  end

  defp add_totals(item, acc) do
    IO.write("item: "); IO.inspect(item);
    IO.write("acc: "); IO.inspect(acc);
    acc = Map.put(acc, :subtotal, acc[:subtotal] + (item[:price] * item[:qty]))
    acc = Map.put(acc, :tax, acc[:tax] + ((item[:price] * item[:qty]) * 0.055))
    acc = Map.put(acc, :total, acc[:total] + (item[:price] * item[:qty]) + ((item[:price] * item[:qty]) * 0.055))
    IO.write("populated acc: "); IO.inspect(acc);
    acc
  end

end

SelfCheckout.prompt_for_items()
