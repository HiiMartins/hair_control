defmodule HairControl.Repo do
  use Ecto.Repo,
    otp_app: :hair_control,
    adapter: Ecto.Adapters.Postgres
end
