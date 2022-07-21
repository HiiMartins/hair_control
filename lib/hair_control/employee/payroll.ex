defmodule HairControl.Employee.Payroll do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "payroll" do
    field :amount_paid, :float

    belongs_to :employee, HairControl.Employee

    timestamps()
  end

  @required_params [:amount_paid, :employee_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
