defmodule Staccato.Hit.TransactionItem do
  @fields %{
    transaction_id: "ti",
    name: "in",
    price: "ip",
    quantity: "iq",
    code: "ic",
    variation: "iv",
    # duplicates "variation"
    category: "iv",
    currency: "cu"
  }

  def type, do: :item

  use Staccato.Hit
end
