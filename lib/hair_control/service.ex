defmodule HairControl.Service do
  use Ecto.Schema
  import Ecto.Changeset

  alias HairControl.Sale

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "services" do
    field :title, :string
    field :price, :integer
    field :commission_percentage, :integer, default: 50
    field :status, Ecto.Enum, values: [:active, :inactive], default: :active

    has_many(:sale, Sale)

    timestamps()
  end

  @cast_params [:title, :price, :status]
  @required_params [:title, :price]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(service, params), do: create_changeset(service, params)
  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_service, params) do
    module_or_service
    |> cast(params, @cast_params)
    |> validate_required(@required_params)
  end
end
