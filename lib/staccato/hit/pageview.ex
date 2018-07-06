defmodule Staccato.Hit.Pageview do
  @behaviour Staccato.Hit

  @fields %{
    hostname: "dh", # also in GLOBAL_OPTIONS
    path: "dp", # also in GLOBAL_OPTIONS
    title: "dt" # also in GLOBAL_OPTIONS
  }

  @field_keys (@fields |> Map.keys)

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :pageview
end
