defmodule HairControlWeb.PayrollController do
  use HairControlWeb, :controller

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    params
    |> HairControl.create_payroll()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> HairControl.delete_payroll()
    |> handle_response(conn, "delete.json", :ok)
  end

  def list(conn, _filters) do
    HairControl.list_payroll()
    |> handle_response(conn, "list.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> HairControl.fetch_payroll()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, payroll}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, payroll: payroll)
  end

  defp handle_response({:error, _changeset} = error, _conm, _view, _status), do: error
end
