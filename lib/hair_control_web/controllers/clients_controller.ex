defmodule HairControlWeb.ClientsController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_client()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, client}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, client: client)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
