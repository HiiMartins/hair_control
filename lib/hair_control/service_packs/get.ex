defmodule HairControl.ServicePacks.Get do
  alias HairControl.{ServicePacks, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_service_pack(uuid)
    end
  end

  defp fetch_service_pack(uuid) do
    case Repo.get(ServicePacks, uuid) do
      nil -> {:error, "Service Pack not found!"}
      service_pack -> Verifications.verify_status(service_pack)
    end
  end
end
