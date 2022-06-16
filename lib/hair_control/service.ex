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

  @required_params [:title, :price]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  defp changeset(params), do: create_changeset(params)

  defp create_changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
