defmodule Staccato.Hit.Pageview do
  @fields %{
    # also in GLOBAL_OPTIONS
    hostname: "dh",
    # also in GLOBAL_OPTIONS
    path: "dp",
    # also in GLOBAL_OPTIONS
    title: "dt"
  }

  def type, do: :pageview

  use Staccato.Hit
end
