defmodule HairControl.ServicePacks do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  # @foreing_key_type Ecto.UUID PRECISO RESOLVER ISSO QUERIDINHO

  schema "service_packs" do
    field :title, :string
    field :description, :string
    field :total_seasons, :integer
    field :status, Ecto.Enum, values: [:active, :inactive], default: :active
    field :price, :integer

    field :list_service_id, {:array, Ecto.UUID}

    timestamps()
  end

  @cast_params [:title, :description, :status, :price, :total_seasons, :list_service_id]
  @req_params [:title, :price]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(service_pack, params), do: create_changeset(service_pack, params)
  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_service_pack, params) do
    module_or_service_pack
    |> cast(params, @cast_params)
    |> validate_required(@req_params)
  end
end
