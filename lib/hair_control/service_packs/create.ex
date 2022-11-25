defmodule HairControl.ServicePacks.Create do
  alias HairControl.{ServicePacks, Repo}

  def call(params) do
    params
    |> ServicePacks.build()
    |> create_service_pack()
  end

  defp create_service_pack({:ok, struct}), do: Repo.insert(struct)
  defp create_service_pack({:error, _changeset} = error), do: error
end
