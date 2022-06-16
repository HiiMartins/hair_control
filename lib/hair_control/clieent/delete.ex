defmodule HairControl.Client.Delete do
  alias HairControl.{Client, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_client(uuid)
    end
  end

  defp fetch_client(uuid) do
    case Repo.get(Client, uuid) do
      nil -> {:error, "Client not Found!"}
      client -> Repo.delete(client)
    end
  end
end
