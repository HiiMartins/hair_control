defmodule HairControl.Employee.Delete do
  alias HairControl.{Employee, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_employee(uuid)
    end
  end

  defp fetch_employee(uuid) do
    case Repo.get(Employee, uuid) do
      nil -> {:error, "Employee not Found!"}
      employee -> Repo.delete(employee)
    end
  end
end
