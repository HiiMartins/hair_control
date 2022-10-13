defmodule HairControl.Service.Delete do
  alias HairControl.{Service, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    id
    |> check_format_id()
    |> fetch_service()
    |> alter_status()
  end

  defp check_format_id(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_service({:error, _reason} = error), do: error

  defp fetch_service({:ok, uuid}) do
    case Repo.get(Service, uuid) do
      nil -> {:error, "Client not Found!"}
      service -> Verifications.verify_status(service)
    end
  end

  defp alter_status({:error, _reason} = error), do: error

  defp alter_status({:ok, service}) do
    service
    |> Service.changeset(%{status: "inactive"})
    |> Repo.update()
  end
end
