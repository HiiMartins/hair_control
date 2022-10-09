defmodule HairControl.Client.Update do
  alias HairControl.{Client, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    uuid
    |> check_format_id()
    |> fetch_client()
    |> update_client(params)
  end

  defp check_format_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      uuid_valid -> uuid_valid
    end
  end

  defp fetch_client({:error, _reason} = error), do: error

  defp fetch_client({:ok, uuid}) do
    case Repo.get(Client, uuid) do
      nil -> {:error, "Client not Found!"}
      client -> {:ok, client}
    end
  end

  defp update_client({:error, _reason} = error, _params), do: error

  defp update_client({:ok, client}, params) do
    client
    |> Client.changeset(params)
    |> Repo.update()
  end
end
