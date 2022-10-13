defmodule HairControl.Service.Update do
  alias HairControl.{Service, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    uuid
    |> check_format_id()
    |> fetch_service()
    |> update_service(params)
  end

  defp check_format_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_service({:error, _reason} = error), do: error

  defp fetch_service({:ok, uuid}) do
    case Repo.get(Service, uuid) do
      nil -> {:error, "Service not found!"}
      service -> {:ok, service}
    end
  end

  defp update_service({:error, _reason} = error, _params), do: error

  defp update_service({:ok, service}, params) do
    service
    |> Service.changeset(params)
    |> Repo.update()
  end
end
