defmodule Staccato.Hit.Exception do
  @behaviour Staccato.Hit

  @fields %{
    description: "exd",
    fatal: "exf"
  }

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :exception
end
