defmodule Staccato.Adapter do
  # @callback

  def default do
    Staccato.Adapter.HttpPoison
  end
end
