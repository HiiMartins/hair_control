defmodule HairControl.Client.Update do
  alias HairControl.{Client, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> fetch_client(params)
    end
  end

  defp fetch_client(%{"id" => uuid} = params) do
    case Repo.get(Client, uuid) do
      nil -> {:error, "Client not Found!"}
      client -> update_client(client, params)
    end
  end

  defp update_client(client, params) do
    client
    |> Client.changeset(params)
    |> Repo.update()
  end
end
