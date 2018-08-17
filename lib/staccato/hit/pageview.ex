defmodule Staccato.Hit.Pageview do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.pageview(path: "/page-path", hostname: "mysite.com", title: "A Page!")
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "dh" => "mysite.com",
        "dp" => "/page-path",
        "dt" => "A Page!",
        "t" => :pageview,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

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
