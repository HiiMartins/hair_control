defmodule HairControl.Sale.Create do
  alias HairControl.{Sale, Repo}

  def call(params) do
    params
    |> Sale.build()
    |> create_sale()
  end

  defp create_sale({:ok, struct}), do: Repo.insert(struct)
  defp create_sale({:error, _changeset} = error), do: error
end
