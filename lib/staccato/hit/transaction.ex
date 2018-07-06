defmodule Staccato.Hit.Transaction do
  @behaviour Staccato.Hit

  @fields %{
    transaction_id: "ti",
    affiliation: "ta",
    revenue: "tr",
    shipping: "ts",
    tax: "tt",
    currency: "cu"
  }

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :transaction
end
