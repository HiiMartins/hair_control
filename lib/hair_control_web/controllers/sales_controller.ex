defmodule HairControlWeb.SalesController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_sale()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> HairControl.delete_sale()
    |> handle_response(conn, "delete.json", :ok)
  end

  def list(conn, _params) do
    HairControl.list_sales()
    |> handle_response(conn, "list.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> HairControl.fetch_sale()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, sale}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, sale: sale)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
