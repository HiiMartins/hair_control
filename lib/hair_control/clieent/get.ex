defmodule HairControl.Client.Get do
  alias HairControl.{Client, Helper, Repo}
  alias Helper.Verifications
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get_client(uuid)
    end
  end

  def get_client(uuid) do
    case Repo.get(Client, uuid) do
      nil -> {:error, "Client not found!"}
      client -> Verifications.verify_status(client)
    end
  end
end
