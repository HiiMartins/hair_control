defmodule HairControl.Sale.Delete do
  alias HairControl.{Sale, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> fetch_sale(uuid)
    end
  end

  def fetch_sale(uuid) do
    case Repo.get(Sale, uuid) do
      nil -> {:error, "Sale not found!"}
      sale -> Repo.delete(sale)
    end
  end
end
