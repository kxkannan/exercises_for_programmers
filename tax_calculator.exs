
defmodule TaxCalculator do

  def  prompt do
    amount_str = IO.gets("What is the order amount? ")
    amount = String.to_integer(String.trim(amount_str))
    state = IO.gets("What is the state? ")
    write_total(amount, String.trim(state))
  end

  defp write_total(amount, state) do

    cond do
      String.match?(state, ~r/wisconsin|wi/i) ->
        tax = amount * 0.055
        IO.puts "The subtotal is $#{amount}"
        IO.puts "The tax is $#{tax}"
        IO.puts "The total is $#{amount + tax}"
      true ->
        tax = amount * 0.055
        IO.puts "The total is $#{amount}"
    end


  end


end

TaxCalculator.prompt
