defmodule HairControl.Client.Delete do
  alias HairControl.{Client, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    id
    |> check_format_id()
    |> fetch_client()
    |> alter_status()
  end

  defp check_format_id(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_client({:error, _reason} = error), do: error

  defp fetch_client({:ok, uuid}) do
    case Repo.get(Client, uuid) do
      nil -> {:error, "Client not Found!"}
      client -> Verifications.verify_status(client)
    end
  end

  defp alter_status({:error, _reason} = error), do: error

  defp alter_status({:ok, client}) do
    client
    |> Client.changeset(%{status: "inactive"})
    |> Repo.update()
  end
end
