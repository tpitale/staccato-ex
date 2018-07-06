defmodule Staccato do
  @moduledoc """
  """

  @doc """
  Return a new Tracker for a given UID
  Optional client_id

  ## Examples

      iex> Staccato.tracker("X-YYYYY-1").id
      "X-YYYYY-1"

      iex> Staccato.tracker(nil)
      %Staccato.NoopTracker{}

  """
  def tracker(nil), do: %Staccato.NoopTracker{}
  def tracker(nil, nil), do: tracker(nil)
  def tracker(id), do: %Staccato.Tracker{id: id, client_id: generate_client_id()}
  def tracker(id, client_id), do: %Staccato.Tracker{id: id, client_id: (client_id || generate_client_id())}
  def tracker(id, client_id, options) when is_map(options) do
    options |> Kernel.struct(tracker(id, client_id))
  end

  def generate_client_id, do: Staccato.UUID.generate
end
