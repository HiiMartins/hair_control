defmodule HairControl.Employee.Payroll.Delete do
  alias HairControl.{Employee, Repo}
  alias Employee.Payroll
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_payroll(uuid)
    end
  end

  def fetch_payroll(uuid) do
    case Repo.get(Payroll, uuid) do
      nil -> {:error, "Payroll not found!"}
      payroll -> Repo.delete(payroll)
    end
  end
end
