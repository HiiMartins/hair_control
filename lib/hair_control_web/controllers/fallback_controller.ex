defmodule HairControlWeb.FallbackController do
  use HairControlWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(HairControlWeb.ErrorView)
    |> render("401.json", message: "unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(HairControlWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
