defmodule Staccato.Hit.Event do
  @fields %{
    category: "ec",
    action: "ea",
    label: "el",
    value: "ev"
  }

  def type, do: :event

  use Staccato.Hit
end
