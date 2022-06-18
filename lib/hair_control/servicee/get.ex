defmodule HairControl.Service.Get do
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
      nil -> {:error, "Service not found!"}
      service -> {:ok, service}
    end
  end
end
