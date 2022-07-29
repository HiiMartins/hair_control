defmodule HairControlWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :hair_control

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
