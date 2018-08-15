defmodule Staccato.Tracker do
  @enforce_keys [:id]

  defstruct id: nil, client_id: nil, adapter: Staccato.Adapter.default(), ssl: false

  def ga_collection_uri(ssl) do
    if(ssl, do: "https://", else: "http://") <> "www.google-analytics.com/collect"
  end
end
