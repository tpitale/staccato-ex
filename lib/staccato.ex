defmodule Staccato do
  @moduledoc """
  """

  @doc """
  Return a new Tracker for a given UID
  Optional client_id

  ## Examples

      iex> Staccato.tracker("X-YYYYY-1").id
      "X-YYYYY-1"

      iex> Staccato.tracker(nil, nil, nil)
      %Staccato.NoopTracker{}

      iex> Staccato.tracker("X-YYYYY-2", %{ssl: true}).ssl
      true

      iex> Staccato.tracker("X-YYYYY-2", [ssl: true]).ssl
      true

      iex> Staccato.tracker("X-YYYYY-2", [{:ssl, true}]).ssl
      true

      iex> Staccato.tracker("X-YYYYY-2", [{:ssl, true}]).client_id != nil
      true

  """
  def tracker(id, client_id \\ UUID.uuid4(), options \\ [])

  def tracker(nil, _, _), do: %Staccato.NoopTracker{}

  def tracker(id, options, _) when is_map(options), do: tracker(id, UUID.uuid4(), options)
  def tracker(id, options, _) when is_list(options), do: tracker(id, UUID.uuid4(), options)
  def tracker(id, client_id, []), do: %Staccato.Tracker{id: id, client_id: client_id}

  def tracker(id, client_id, options) do
    tracker(id, client_id) |> struct(options)
  end
end
