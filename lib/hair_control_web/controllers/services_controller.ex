defmodule HairControlWeb.ServicesController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_service()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> HairControl.delete_service()
    |> handle_response(conn, "delete.json", :ok)
  end

  def list(conn, _params) do
    HairControl.list_services()
    |> handle_response(conn, "list.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> HairControl.fetch_service()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> HairControl.update_service()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, service}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, service: service)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
