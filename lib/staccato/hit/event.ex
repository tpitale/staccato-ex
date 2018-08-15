defmodule Staccato.Hit.Event do
  @behaviour Staccato.Hit

  @fields %{
    category: "ec",
    action: "ea",
    label: "el",
    value: "ev"
  }

  @field_keys @fields |> Map.keys()

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :event
end
