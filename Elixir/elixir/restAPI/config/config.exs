# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :restAPI,
  ecto_repos: [RestAPI.Repo]

# Configures the endpoint
config :restAPI, RestAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fgn5ahu9rxT91vVigMebSbhcNR2nSVqkRyHFVSpGHEk+JBHOwMhI5RSxN9Nl0bev",
  render_errors: [view: RestAPIWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RestAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
