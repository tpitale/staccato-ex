defmodule Staccato.Adapter.HttpPoison do
  def post(url, params) do
    encoded_params = URI.encode_query(params)
    case url
         |> HTTPoison.post(encoded_params, [
           {"User-Agent", params["ua"]},
           {"Content-Type", "x-www-form-urlencoded"}
         ]) do
      {:ok, _response} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end
end
