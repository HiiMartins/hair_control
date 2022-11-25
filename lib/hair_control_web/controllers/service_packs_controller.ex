defmodule HairControlWeb.ServicePacksController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_service_pack()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> HairControl.delete_service_pack()
    |> handle_response(conn, "delete.json", :ok)
  end

  def list(conn, _params) do
    HairControl.list_service_pack()
    |> handle_response(conn, "list.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> HairControl.fetch_service_pack()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> HairControl.update_service_pack()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, service_pack}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, service_pack: service_pack)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
