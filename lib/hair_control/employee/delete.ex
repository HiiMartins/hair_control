defmodule HairControl.Employee.Delete do
  alias HairControl.{Employee, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    id
    |> check_format_id()
    |> fetch_employee()
    |> alter_status()
  end

  defp check_format_id(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_employee({:error, _reason} = error), do: error

  defp fetch_employee({:ok, uuid}) do
    case Repo.get(Employee, uuid) do
      nil -> {:error, "Employee not Found!"}
      employee -> Verifications.verify_status(employee)
    end
  end

  defp alter_status({:error, _reason} = error), do: error

  defp alter_status({:ok, employee}) do
    employee
    |> Employee.changeset(%{status: "inactive"})
    |> Repo.update()
  end
end
