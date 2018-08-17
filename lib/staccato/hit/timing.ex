defmodule Staccato.Hit.Timing do
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
