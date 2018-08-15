defmodule Staccato.Hit.Global do
  @fields %{
    # boolean
    anonymize_ip: "aip",
    # integer
    queue_time: "qt",
    data_source: "ds",
    cache_buster: "z",
    # a known user's id
    user_id: "uid",

    # Session, works with session control
    user_ip: "uip",
    user_agent: "ua",

    # Traffic Sources
    referrer: "dr",
    campaign_name: "cn",
    campaign_source: "cs",
    campaign_medium: "cm",
    campaign_keyword: "ck",
    campaign_content: "cc",
    campaign_id: "ci",
    adwords_id: "gclid",
    display_ads_id: "dclid",

    # System Info
    screen_resolution: "sr",
    viewport_size: "vp",
    screen_colors: "sd",
    user_language: "ul",
    # boolean
    java_enabled: "je",
    flash_version: "fl",
    # boolean
    non_interactive: "ni",
    document_location: "dl",
    # duplicate of encoding
    document_encoding: "de",
    # screen name is not related to custom dimensions
    screen_name: "cd",
    link_id: "linkid",

    # App Tracking
    application_name: "an",
    application_id: "aid",
    application_installer_id: "aiid",
    application_version: "av",

    # Content Experiments
    experiment_id: "xid",
    experiment_variant: "xvar",

    # Product
    product_action: "pa",
    product_action_list: "pal",

    # Promotion
    promotion_action: "promoa",

    # Location
    geographical_id: "geoid"
  }

  @field_keys @fields |> Map.keys()

  defstruct @field_keys

  def fields, do: @fields
  def field_keys, do: @field_keys
end
