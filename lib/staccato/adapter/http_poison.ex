defmodule Staccato.Adapter.HttpPoison do
  # @behaviour Staccato.Adapter

  def post(url, params) do
    case HTTPoison.post url, URI.encode_www_form(params) do
      {:ok, _response} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end
end
