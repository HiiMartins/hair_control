defmodule HairControl.Employee.Get do
  alias HairControl.{Employee, Helper, Repo}
  alias Helper.Verifications
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
      employee -> Verifications.verify_status(employee)
    end
  end
end
