defmodule HairControl.Service.Create do
  alias HairControl.{Service, Repo}

  def call(params) do
    params
    |> Service.build()
    |> create_service()
  end

  defp create_service({:ok, struct}), do: Repo.insert(struct)
  defp create_service({:error, _changeset} = error), do: error
end
