defmodule HairControl.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  alias HairControl.{Employee, Sale}
  alias Employee.Payroll

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "employees" do
    field :name, :string
    field :cpf, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :email, :string
    field :total_commission, :integer, default: 0
    field :total_received, :integer, default: 0
    field :role, Ecto.Enum, values: [:admin, :commom], default: :commom
    field :status, Ecto.Enum, values: [:active, :inactive], default: :active

    has_many :sale, Sale
    has_one :payroll, Payroll

    timestamps()
  end

  @required_params [:name, :cpf, :password, :email, :role, :status]
  @req_update_params_no_pass [:name, :cpf, :email, :role, :status]
  @req_total_commission [:total_commission]
  @req_total_received [:total_received]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(employee, params), do: create_changeset(employee, params)
  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_employee, %{"password" => _password} = params) do
    module_or_employee
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 4)
    |> put_pass_hash()
  end

  defp create_changeset(
         %{total_commission: total_commission} = employee,
         %{update_commission: update_commission} = params
       ) do
    employee
    |> cast(params, @req_total_commission)
    |> validate_required(@req_total_commission)
    |> change(total_commission: total_commission + update_commission)
  end

  defp create_changeset(
         %{total_received: total_received} = employee,
         %{amount_paid: amount_paid} = params
       ) do
    employee
    |> cast(params, @req_total_received)
    |> validate_required(@req_total_received)
    |> change(total_received: total_received + amount_paid)
  end

  defp create_changeset(module_or_employee, params) do
    module_or_employee
    |> cast(params, @req_update_params_no_pass)
    |> validate_required(@req_update_params_no_pass)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
