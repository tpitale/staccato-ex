defmodule Staccato.Hit do
  @callback fields :: map

  defmacro __using__(_opts) do
    quote do
      def build(tracker, options) do
        %__MODULE__{tracker: tracker}
        |> __MODULE__.extract_fields(options)
        |> __MODULE__.extract_global_options(options)
      end

      def extract_fields(hit, options) do
        @field_keys
        |> extract_options(options)
        |> merge_into(hit)
      end

      def extract_global_options(hit, options) do
        Staccato.Hit.Global.field_keys
        |> extract_options(options)
        |> merge_into(%Staccato.Hit.Global{})
        |> set_global(hit)
      end

      defp extract_options(keys, options) do
        keys
        |> Enum.map(fn(field) -> {field, options[field]} end)
        |> Enum.reject(fn({_, v}) -> is_nil(v) end)
      end

      defp merge_into(extracted, hit), do: Kernel.struct(hit, extracted)
      defp set_global(global, hit), do: %{hit | global: global}
    end
  end

  def pageview(tracker, options), do: Staccato.Hit.Pageview.build(tracker, options)
  def screenview(tracker, options), do: Staccato.Hit.Screenview.build(tracker, options)
  def event(tracker, options), do: Staccato.Hit.Event.build(tracker, options)
  def social(tracker, options), do: Staccato.Hit.Social.build(tracker, options)
  def exception(tracker, options), do: Staccato.Hit.Exception.build(tracker, options)
  def timing(tracker, options), do: Staccato.Hit.Timing.build(tracker, options)
  def transaction(tracker, options), do: Staccato.Hit.Transaction.build(tracker, options)
  def transaction_item(tracker, options), do: Staccato.Hit.TransactionItem.build(tracker, options)

  def track!(hit) do
    hit
    |> to_params
    |> post(hit.tracker)
  end

  @doc """
  Collect all params for a hit

  ## Examples

      iex> tracker = Staccato.tracker("X-YYYYY-1")
      iex> hit = Staccato.Hit.pageview(tracker, %{
      iex>   path: "/page-path",
      iex>   hostname: "mysite.com",
      iex>   title: "A Page!",
      iex>   user_ip: "127.0.0.1"
      iex> })
      iex> Staccato.Hit.to_params(hit)
      %{
        "v" => 1,
        "t" => :pageview,
        "tid" => "X-YYYYY-1",
        "dh" => "mysite.com",
        "dp" => "/page-path",
        "dt" => "A Page!",
        "uip" => "127.0.0.1"
      }

  """
  def to_params(hit) do
    %{}
    |> base_params(hit)
    |> global_params(hit)
    |> hit_params(hit)
  end

  defp base_params(params, hit) do
    Map.merge(params, %{
      "v" => 1,
      "t" => hit.__struct__.type,
      "tid" => hit.tracker.id,
      # "cid" => hit.tracker.client_id,
      # "sc" => session_control
    })
  end

  defp global_params(params, hit), do: get_into(hit.global, Staccato.Hit.Global.fields, params)
  defp hit_params(params, hit), do: get_into(hit, hit.__struct__.fields, params)

  defp get_into(from, fields, to) do
    fields
    |> Enum.map(fn({field, ga_key}) -> {ga_key, Map.get(from, field)} end)
    |> Enum.reject(fn({_, v}) -> is_nil(v) end)
    |> Enum.into(to)
  end

  defp post(params, tracker) do
    tracker.adapter.post(Staccato.Tracker.ga_collection_uri(tracker.ssl), params)
  end
end
