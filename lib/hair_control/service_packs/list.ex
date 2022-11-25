defmodule HairControl.ServicePacks.List do
  import Ecto.Query

  alias HairControl.{ServicePacks, Repo}

  def call() do
    apply_filter()
    |> response()
  end

  defp apply_filter() do
    Enum.reduce(%{status: "active"}, ServicePacks, fn
      {:sttatus, status}, query ->
       query |> where([q], q.status == ^status)
    end)
  end

  defp response(query) do
    {:ok, Repo.all(query)}
  end
end
