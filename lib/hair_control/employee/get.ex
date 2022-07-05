defmodule HairControl.Employee.Get do
  alias HairControl.{Employee, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get_employee(uuid)
    end
  end

  def get_employee(uuid) do
    case Repo.get(Employee, uuid) do
      nil -> {:error, "Employee not found!"}
      employee -> {:ok, employee}
    end
  end
end
