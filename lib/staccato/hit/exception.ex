defmodule Staccato.Hit.Exception do
  @fields %{
    description: "exd",
    fatal: "exf"
  }

  def type, do: :exception

  use Staccato.Hit
end
