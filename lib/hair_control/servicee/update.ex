defmodule HairControl.Service.Update do
  alias HairControl.{Service, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> fetch_service(params)
    end
  end

  defp fetch_service(%{"id" => uuid} = params) do
    case Repo.get(Service, uuid) do
      nil -> {:error, "Service not found!"}
      service -> update_service(service, params)
    end
  end

  defp update_service(service, params) do
    service
    |> Service.changeset(params)
    |> Repo.update()
  end
end
