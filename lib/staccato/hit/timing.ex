defmodule Staccato.Hit.Timing do
  @behaviour Staccato.Hit

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

  @field_keys @fields |> Map.keys()

  defstruct [:tracker, :global] ++ @field_keys

  use Staccato.Hit

  def fields, do: @fields
  def type, do: :timing
end
