defmodule Staccato do
  @moduledoc """
  """

  @doc """
  Return a new Tracker for a given UID
  Optional client_id

  ## Examples

      iex> Staccato.tracker("X-YYYYY-1").id
      "X-YYYYY-1"
  """
  def tracker(id, client_id \\ UUID.uuid4, options \\ [])

  def tracker(nil, _, _), do: raise "Property ID is required"

  def tracker(id, client_id, []), do: %Staccato.Tracker{id: id, client_id: (client_id)}

  def tracker(id, client_id, options) do
    tracker(id, client_id) |> struct(options)
  end
end
