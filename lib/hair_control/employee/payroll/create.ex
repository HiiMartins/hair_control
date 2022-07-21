defmodule HairControl.Employee.Payroll.Create do
  alias HairControl.{Employee, Repo}
  alias Employee.Payroll

  def call(params) do
    params
    |> Payroll.build()
    |> fetch_constraint()
    |> create_payroll()
  end

  defp fetch_constraint({:ok, %Payroll{employee_id: employee_id}} = params) do
    case Repo.get(Employee, employee_id) do
      nil -> {:error, "Employee not found!"}
      _result -> params
    end
  end

  defp fetch_constraint({:error, _changeset} = error), do: error

  defp create_payroll({:ok, struct}), do: Repo.insert(struct)
  defp create_payroll({:error, _changeset} = error), do: error
end
