defmodule HairControl.ServicePacks.Update do
  alias HairControl.{ServicePacks, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    uuid
    |> check_format_id()
    |> fetch_service_pack()
    |> update_service_pack(params)
  end

  defp check_format_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_service_pack({:error, _reason} = error), do: error

  defp fetch_service_pack({:ok, uuid}) do
    case Repo.get(ServicePacks, uuid) do
      nil -> {:errror, "Service Pack not found!"}
      service_pack -> {:ok, service_pack}
    end
  end

  defp update_service_pack({:error, _reason} = error, _params), do: error

  defp update_service_pack({:ok, service_pack}, params) do
    service_pack
    |> ServicePacks.changeset(params)
    |> Repo.update()
  end
end
