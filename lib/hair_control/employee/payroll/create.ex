defmodule HairControl.Employee.Payroll.Create do
  alias HairControl.{Employee, Repo}
  alias Employee.{Payroll, Update}

  def call(params) do
    params
    |> Payroll.build()
    |> fetch_constraint()
    |> preloud_assotions()
    |> create_payroll()
  end

  defp fetch_constraint({:ok, %Payroll{employee_id: employee_id}} = params) do
    case Repo.get(Employee, employee_id) do
      nil -> {:error, "Employee not found!"}
      _result -> params
    end
  end

  defp fetch_constraint({:error, _changeset} = error), do: error

  defp preloud_assotions({:ok, struct}) do
    struct
    |> Repo.preload([:employee])
    |> Update.update_total_received()
  end

  defp preloud_assotions({:error, _reason} = error), do: error

  defp create_payroll({:ok, struct}), do: Repo.insert(struct)
  defp create_payroll({:error, _changeset} = error), do: error
end
