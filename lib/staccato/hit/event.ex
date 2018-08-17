defmodule Staccato.Hit.Event do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.event(category: "video", action: "play", non_interactive: true)
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "ea" => "play",
        "ec" => "video",
        "ni" => true,
        "t" => :event,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

  @fields %{
    category: "ec",
    action: "ea",
    label: "el",
    value: "ev"
  }

  def type, do: :event

  use Staccato.Hit
end
