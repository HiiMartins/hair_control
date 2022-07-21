defmodule HairControl.Employee.Payroll.Get do
  alias HairControl.{Employee, Repo}
  alias Employee.Payroll
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_payroll(uuid)
    end
  end

  defp fetch_payroll(uuid) do
    case Repo.get(Payroll, uuid) do
      nil -> {:error, "Payroll not found!"}
      payroll -> {:ok, payroll}
    end
  end
end
