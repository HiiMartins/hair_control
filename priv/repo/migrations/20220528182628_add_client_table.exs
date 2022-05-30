defmodule HairControl.Repo.Migrations.AddClientTable do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :phone, :string
      add :cpf, :string
      add :rg, :string
      add :address, :string
      add :district, :string

      timestamps()
    end
  end
end
