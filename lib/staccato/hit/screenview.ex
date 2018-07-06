defmodule Staccato.Hit.Screenview do
  @behaviour Staccato.Hit

  @fields %{}

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :screenview
end
