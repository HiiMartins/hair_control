defmodule HairControl.Service.Delete do
  alias HairControl.{Service, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_service(uuid)
    end
  end

  defp fetch_service(uuid) do
    case Repo.get(Service, uuid) do
      nil -> {:error, "Client not Found!"}
      service -> Repo.delete(service)
    end
  end
end
