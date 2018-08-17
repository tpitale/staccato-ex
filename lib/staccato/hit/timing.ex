defmodule Staccato.Hit.Timing do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.timing(category: "runtime", variable: "db", label: "query", time: 50)
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "utc" => "runtime",
        "utv" => "db",
        "utl" => "query",
        "utt" => 50,
        "t" => :timing,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

  @fields %{
    category: "utc",
    variable: "utv",
    label: "utl",
    time: "utt",

    # more specific timings
    page_load_time: "plt",
    dns_time: "dns",
    page_download_time: "pdt",
    redirect_response_time: "rrt",
    tcp_connect_time: "tcp",
    server_response_time: "srt"
  }

  def type, do: :timing

  use Staccato.Hit
end
