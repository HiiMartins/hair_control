defmodule HairControl.Service do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "services" do
    field :id, :uuid, primary_key: true
    field :title, :string
    field :price, :number

    timestamps()
  end
end
