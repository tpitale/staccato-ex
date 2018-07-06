defmodule Staccato.Hit.TransactionItem do
  @behaviour Staccato.Hit

  @fields %{
    transaction_id: "ti",
    name: "in",
    price: "ip",
    quantity: "iq",
    code: "ic",
    variation: "iv",
    category: "iv", # duplicates "variation"
    currency: "cu"
  }

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :item
end
