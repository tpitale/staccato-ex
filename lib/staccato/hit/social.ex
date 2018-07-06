defmodule Staccato.Hit.Social do
  @behaviour Staccato.Hit

  @fields %{
    action: "sa",
    network: "sn",
    target: "st"
  }

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :social
end
