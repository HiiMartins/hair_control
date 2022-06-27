defmodule HairControl.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "sales" do
    field :payment_method, Ecto.Enum, values: [:dinheiro, :cartão, :fiado]

    belongs_to :employee, HairControl.Employee
    belongs_to :client, HairControl.Client
    belongs_to :service, HairControl.Service

    timestamps()
  end

  @required_params [:payment_method, :employee_id, :client_id, :service_id]

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
    |> foreign_key_constraint(:employee_id, name: :sales_employee_id_fkey)
  end
end
