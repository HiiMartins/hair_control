defmodule HairControl.Employee.RecoverPassword do
  alias HairControl.{Employee, Repo}

  def call(%{"email" => employee_email}) do
    employee_email
    |> fetch_by_email()
    |> generate_new_password()
    |> update_password()
  end

  defp fetch_by_email(employee_email) do
    case Repo.get(Employee, email: employee_email) do
      nil -> {:error, "Employeee not found!"}
      employee -> generate_new_password(employee)
    end
  end

  defp generate_new_password({:error, _reason} = error), do: error

  defp generate_new_password({:ok, employee}) do
    Enum.random(100_000..999_999)
    |> to_string()
    |> add_password(employee)
  end

  defp add_password(new_pass, employee), do: Map.put(employee, :password, new_pass)

  defp update_password(employee) do
    employee
    |> Employee.changeset()
    |> Repo.update()
  end
end
