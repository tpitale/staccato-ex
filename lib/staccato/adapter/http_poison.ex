defmodule Staccato.Adapter.HttpPoison do
  def post(url, params, user_agent) do
    case url
         |> qualify_url(params)
         |> HTTPoison.post("", [
           {"User-Agent", user_agent},
           {"Content-Type", "x-www-form-urlencoded"}
         ]) do
      {:ok, _response} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp qualify_url(url, params) do
    params = params |> URI.encode_query()

    url
    |> URI.parse()
    |> Map.put(:query, params)
    |> URI.to_string()
  end
end
