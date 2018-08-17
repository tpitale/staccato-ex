defmodule Staccato.Hit.Transaction do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.transaction(%{
      iex>   transaction_id: 12345,
      iex>   affiliation: "clothing",
      iex>   revenue: 17.98,
      iex>   shipping: 2.00,
      iex>   tax: 2.50,
      iex>   currency: "EUR"
      iex> })
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "ti" => 12345,
        "ta" => "clothing",
        "tr" => 17.98,
        "ts" => 2.0,
        "tt" => 2.5,
        "cu" => "EUR",
        "t" => :transaction,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

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
