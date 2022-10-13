defmodule HairControl.Service.List do
  import Ecto.Query

  alias HairControl.{Service, Repo}

  def call() do
    apply_filter()
    |> response()
  end

  defp apply_filter() do
    Enum.reduce(%{status: "active"}, Service, fn
      {:status, status}, query ->
        query |> where([q], q.status == ^status)
    end)
  end

  defp response(query) do
    {:ok, Repo.all(query)}
  end
end
