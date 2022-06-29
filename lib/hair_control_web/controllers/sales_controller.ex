defmodule HairControlWeb.SalesController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_sale()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, sale}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, sale: sale)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
