defmodule HairControl.Repo.Migrations.AddEmployeeTable do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :cpf, :string
      add :password_hash, :string
      add :email, :string
      add :total_commission, :float
      add :total_received, :float

      timestamps()
    end
  end
end
