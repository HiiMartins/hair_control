defmodule HairControl.Client.Create do
  alias HairControl.{Client, Repo}

  def call(params) do
    params
    |> Client.build()
    |> create_client()
  end

  defp create_client({:ok, struct}), do: Repo.insert(struct)
  defp create_client({:error, _changeset} = error), do: error
end
