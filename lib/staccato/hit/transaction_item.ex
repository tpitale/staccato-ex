defmodule Staccato.Hit.TransactionItem do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.transaction_item(%{
      iex>   transaction_id: 12345,
      iex>   name: "Shirt",
      iex>   price: 8.99,
      iex>   quantity: 2,
      iex>   code: "afhcka1230",
      iex>   variation: "red",
      iex>   currency: "EUR"
      iex> })
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "ti" => 12345,
        "in" => "Shirt",
        "ip" => 8.99,
        "iq" => 2,
        "ic" => "afhcka1230",
        "iv" => "red",
        "cu" => "EUR",
        "t" => :item,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

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
