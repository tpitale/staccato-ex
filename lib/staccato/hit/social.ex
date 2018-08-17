defmodule Staccato.Hit.Social do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.social(action: "like", network: "facebook", target: "/something")
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "sa" => "like",
        "sn" => "facebook",
        "st" => "/something",
        "t" => :social,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

  @fields %{
    action: "sa",
    network: "sn",
    target: "st"
  }

  def type, do: :social

  use Staccato.Hit
end
