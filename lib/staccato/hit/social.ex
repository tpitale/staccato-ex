defmodule Staccato.Hit.Social do
  @fields %{
    action: "sa",
    network: "sn",
    target: "st"
  }

  def type, do: :social

  use Staccato.Hit
end
