defmodule Staccato.Hit.Transaction do
  @fields %{
    transaction_id: "ti",
    affiliation: "ta",
    revenue: "tr",
    shipping: "ts",
    tax: "tt",
    currency: "cu"
  }

  def type, do: :transaction

  use Staccato.Hit
end
