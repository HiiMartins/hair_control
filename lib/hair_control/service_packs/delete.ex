defmodule HairControl.ServicePacks.Delete do
  alias HairControl.{ServicePacks, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    id
    |> check_format_id()
    |> fetch_service_pack()
    |> alter_status()
  end

  defp check_format_id(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_service_pack({:error, _reason} = error), do: error

  defp fetch_service_pack({:ok, uuid}) do
    case Repo.get(ServicePacks, uuid) do
      nil -> {:error, "Service Pack not Found!"}
      service_pack -> Verifications.verify_status(service_pack)
    end
  end

  defp alter_status({:error, _reason} = error), do: error

  defp alter_status({:ok, service_pack}) do
    service_pack
    |> ServicePacks.changeset(%{status: "inactive"})
    |> Repo.update()
  end
end
