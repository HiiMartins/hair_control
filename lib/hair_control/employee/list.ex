defmodule HairControl.Employee.List do
  import Ecto.Query

  alias HairControl.{Employee, Repo}

  #def call(), do: {:ok, Repo.all(Employee)}

  def call() do
    apply_filter()
    |> response()
  end

  defp apply_filter() do
    Enum.reduce(%{status: "active"}, Employee, fn
      {:status, status}, query ->
        query |> where([q], q.status == ^status)
      end)
  end

  defp response(query) do
    {:ok, Repo.all(query)}
  end
end
