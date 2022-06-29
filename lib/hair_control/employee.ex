defmodule HairControl.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  alias HairControl.Sale

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "employees" do
    field :name, :string
    field :cpf, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :email, :string

    has_many :sale, Sale

    timestamps()
  end

  @required_params [:name, :cpf, :password, :email]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(employee, params), do: create_changeset(employee, params)
  defp changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_employee, params) do
    module_or_employee
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 4)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
