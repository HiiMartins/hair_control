defmodule HairControl.Employee.Create do
  alias HairControl.{Employee, Repo}

  def call(params) do
    params
    |> Employee.build()
    |> create_employee()
  end

  defp create_employee({:ok, struct}), do: Repo.insert(struct)
  defp create_employee({:error, _changeset} = error), do: error
end
