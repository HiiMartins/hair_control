defmodule HairControl.Client.Create do
  alias HairControl.{Client, Helper, Repo}
  alias Helper.Cpf

  def call(params) do
    params
    |> Client.build()
    |> Cpf.cpf_validator()
    |> create_client()
  end

  defp create_client({:ok, struct}), do: Repo.insert(struct)
  defp create_client({:error, _changeset} = error), do: error
end
