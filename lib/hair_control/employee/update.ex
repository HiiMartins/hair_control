defmodule HairControl.Employee.Update do
  alias HairControl.{Employee, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> fetch_employee(params)
    end
  end

  defp fetch_employee(%{"id" => uuid} = params) do
    case Repo.get(Employee, uuid) do
      nil -> {:error, "Employee not Found!"}
      employee -> update_employee(employee, params)
    end
  end

  defp update_employee(employee, params) do
    employee
    |> Employee.changeset(params)
    |> Repo.update()
  end
end
