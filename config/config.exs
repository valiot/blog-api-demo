# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blog_api, ecto_repos: [BlogApi.Repo]

# Configures the endpoint
config :blog_api, BlogApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zaGA6lftWqfB88rISY0wIoGwVeQhUKEU9NfXNGt9lp+uEM+NV0cbNjQXi5Hp973h",
  render_errors: [view: BlogApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BlogApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :blog_api, BlogApiWeb.Guardian,
  issuer: "blog_api",
  secret_key: "iKXvV22XLt1IKLli9/XkisHc2fMPeU0/PfNCk3R8vtROJcyQHaH6WdM4IxV7TsfR"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
