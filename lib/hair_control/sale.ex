defmodule HairControl.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "sales" do
    field :payment_method, Ecto.Enum, values: [:dinheiro, :cartão, :fiado, :pix]
    field :status, Ecto.Enum, values: [:active, :inactive], default: :active

    belongs_to :employee, HairControl.Employee
    belongs_to :client, HairControl.Client
    belongs_to :service, HairControl.Service

    timestamps()
  end

  @required_params [:payment_method, :status, :employee_id, :client_id, :service_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(params)

  defp create_changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
