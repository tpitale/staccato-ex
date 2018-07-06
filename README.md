# Staccato

Elixir library to track into the official Google Analytics Measurement Protocol

https://developers.google.com/analytics/devguides/collection/protocol/v1/

**NOTE:** The Measurement Protocol is part of Universal Analytics, which is currently available in public beta. Data from the measurement protocol will only be processed in Universal Analytics enabled properties.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `staccato` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:staccato, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/staccato](https://hexdocs.pm/staccato).

## TODO: ##

* [x] Basic hit types
* [ ] Session control
* [ ] Measurements
* [ ] Handle boolean fields
* [ ] Timing w/ block
* [ ] Custom Dimensions and Metrics
* [ ] Global hit defaults
* [ ] HTTP Adapters
* [ ] Image URLs

## Usage ##

```elixir
tracker = Staccato.tracker('UA-XXXX-Y') # REQUIRED, your Google Analytics Tracking ID
```

`#tracker` optionally takes a second param for the `client_id` value.
By default, the `client_id` is set to a random UUID with `SecureRandom.uuid`

### Track some data ###

```elixir
import Staccato.Hit

# Track a Pageview (all values optional)
tracker
|> pageview(path: "/page-path", hostname: "mysite.com", title: "A Page!")
|> track!

# Track an Event (all values optional)
tracker
|> event(category: "video", action: "play", label: "cars", value: 1)
|> track!

# Track social activity (all values REQUIRED)
tracker
|> social(action: 'like', network: 'facebook', target: '/something')
|> track!

# Track exceptions (all values optional)
tracker
|> exception(description: 'RuntimeException', fatal: true)
|> track!

# Track timing (all values optional, but should include time)
tracker
|> timing(category: 'runtime', variable: 'db', label: 'query', time: 50) # time in milliseconds
|> track!

# Track transaction (transaction_id REQUIRED)
tracker
|> transaction(%{
  transaction_id: 12345,
  affiliation: 'clothing',
  revenue: 17.98,
  shipping: 2.00,
  tax: 2.50,
  currency: 'EUR'
})
|> track!

# Track transaction item (matching transaction_id and item name REQUIRED)
tracker
|> transaction_item(%{
  transaction_id: 12345,
  name: 'Shirt',
  price: 8.99,
  quantity: 2,
  code: 'afhcka1230',
  variation: 'red',
  currency: 'EUR'
})
track!
```

### Setting SSL on a tracker ###

```elixir
# passing nil as the second argument lets Staccato build the client id, as the default
tracker = Staccato.tracker('UA-XXXX-Y', nil, ssl: true)
```

### "Global" Options ###

Any of the options on the parameters list (https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters) that are accepted on ALL hit types can be set as options on any of the hits.

```elixir
tracker
|> pageview(path: '/video/1235', flash_version: 'v1.2.3')
```

`flash_version` is a **global option** in the example above.

The complete list at this time:

```elixir
Staccato::Hit::GLOBAL_OPTIONS.keys # =>

[:anonymize_ip,
 :queue_time,
 :data_source,
 :cache_buster,
 :user_id,
 :user_ip,
 :user_agent,
 :referrer,
 :campaign_name,
 :campaign_source,
 :campaign_medium,
 :campaign_keyword,
 :campaign_content,
 :campaign_id,
 :adwords_id,
 :display_ads_id,
 :screen_resolution,
 :viewport_size,
 :screen_colors,
 :user_language,
 :java_enabled,
 :flash_version,
 :document_location,
 :document_encoding,
 :document_hostname,
 :document_path,
 :document_title,
 :link_id,
 :application_name,
 :application_version,
 :application_id,
 :application_installer_id,
 :experiment_id,
 :experiment_variant,
 :product_action,
 :product_action_list,
 :promotion_action,
 :geographical_id]
```

Boolean options like `anonymize_ip` will be converted from `true`/`false` into `1`/`0` as per the tracking API docs.

The `data_source` option can take any value, but note that hits sent from other Google tools will have specific values.  Hits sent from analytics.js will have `data_source` set to `web`, and hits sent from one of the mobile SDKs will have `data_source` set to `app`.

#### Non-Interactive Hit ####

```elixir
# Track a Non-Interactive Hit
tracker
|> event(category: 'video', action: 'play', non_interactive: true)
|> track!
```

Non-Interactive events are useful for tracking things like emails sent, or other
events that are not directly the result of a user's interaction.

The option `non_interactive` is global, accepted for all hit types.

#### Session Control ####

```elixir
# start a session
tracker
|> pageview(path: '/blog', start_session: true)
|> track!

# end a session
tracker
|> pageview(path: '/blog', end_session: true)
|> track!
```

Other options are acceptable to start and end a session: `session_start`, `session_end`, and `stop_session`.

#### Content Experiment ####

```elixir
# Tracking an Experiment
#   useful for tracking A/B or Multivariate testing
tracker
|> pageview(%{
  path: '/blog',
  experiment_id: 'a7a8d91df',
  experiment_variant: 'a'
})
|> track!
```

### Screenview (as in mobile) ###

```elixir
tracker
|> screenview(screen_name: 'user1')
|> track!
```

## Google Documentation ##

https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide
https://developers.google.com/analytics/devguides/collection/protocol/v1/reference
https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters

## Contributing ##

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
