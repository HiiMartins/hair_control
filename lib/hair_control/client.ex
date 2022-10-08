defmodule HairControl.Client do
  use Ecto.Schema
  import Ecto.Changeset

  alias HairControl.Sale

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "clients" do
    field :name, :string
    field :phone, :string
    field :cpf, :string
    field :rg, :string
    field :address, :string
    field :district, :string
    field :status, Ecto.Enum, values: [:active, :inactive], default: :active

    has_many(:sale, Sale)

    timestamps()
  end

  @params [:name, :phone, :cpf, :rg, :address, :district, :status]
  @required_params [:name, :phone, :cpf, :rg]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(client, params), do: create_changeset(client, params)
  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_client, params) do
    module_or_client
    |> cast(params, @params)
    |> validate_required(@required_params)
  end
end
