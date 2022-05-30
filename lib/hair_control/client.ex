defmodule HairControl.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "clients" do
    field :name, :string
    field :phone, :string
    field :cpf, :string
    field :rg, :string
    field :address, :string
    field :district, :string

    timestamps()
  end

  @params [:name, :phone, :cpf, :rg, :address, :district]
  @required_params [:name, :phone, :cpf]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module, params) do
    module
    |> cast(params, @params)
    |> validate_required(@required_params)
  end
end
