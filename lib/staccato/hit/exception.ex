defmodule Staccato.Hit.Exception do
  @moduledoc """

  Examples

      iex> tracker = Staccato.tracker("X-YYYY-1", "UUID12345")
      iex> tracker
      iex> |> Staccato.Hit.exception(description: "RuntimeException", fatal: false)
      iex> |> Staccato.Hit.to_params
      %{
        "cid" => "UUID12345",
        "exd" => "RuntimeException",
        "exf" => false,
        "t" => :exception,
        "tid" => "X-YYYY-1",
        "v" => 1
      }
  """

  @fields %{
    description: "exd",
    fatal: "exf"
  }

  def type, do: :exception

  use Staccato.Hit
end
