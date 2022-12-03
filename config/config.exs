# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :hair_control,
  ecto_repos: [HairControl.Repo]

# Configures the endpoint
config :hair_control, HairControlWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HairControlWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HairControl.PubSub,
  live_view: [signing_salt: "VK0cCNlk"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :hair_control, HairControl.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_API_KEY")

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, Swoosh.ApiClient.Hackney

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :hair_control, HairControlWeb.Auth.Guardian,
  issuer: "hair_control",
  secret_key: "2hxAfbe9NYSFFyu1wnbfjiuxdH6crkaEhibQ4jQwWsW4FofENqWJeO48FBQmLiZX"

config :hair_control, HairControlWeb.Auth.Pipeline,
  module: HairControlWeb.Auth.Guardian,
  error_handler: HairControlWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
