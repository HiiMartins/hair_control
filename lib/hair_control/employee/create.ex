defmodule HairControl.Employee.Create do
  alias HairControl.{Employee, Repo}

  def call(params) do
    params
    |> Employee.build()
    |> check_email_unique()
    |> create_employee()
  end

  defp check_email_unique({:ok, %Employee{email: email}} = params) do
    case Repo.get_by(Employee, email: email) do
      nil -> params
      Ecto.MultipleResultsError -> {:error, "E-mail already registered!"}
      _result -> {:error, "E-mail already registered!"}
    end
  end

  defp create_employee({:ok, struct}), do: Repo.insert(struct)
  defp create_employee({:error, _reason} = error), do: error
end
