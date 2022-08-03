defmodule HairControlWeb.EmployeesController do
  use HairControlWeb, :controller

  alias HairControlWeb.Auth.Guardian

  action_fallback HairControlWeb.FallbackController

  def create(conn, params) do
    with {:ok, employee} <- HairControl.create_employee(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(employee) do
      conn
      |> put_status(:created)
      |> render("create.json", %{employee: employee, token: token})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def delete(conn, %{"id" => id}) do
    id
    |> HairControl.delete_employee()
    |> handle_response(conn, "delete.json", :ok)
  end

  def list(conn, _params) do
    HairControl.list_employees()
    |> handle_response(conn, "list.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> HairControl.fetch_employee()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> HairControl.update_employee()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, employee}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, employee: employee)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
