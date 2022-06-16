defmodule HairControl.Repo.Migrations.AddServiceTable do
  use Ecto.Migration

  def change do
    create table(:services, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :price, :number

      timestamps()
    end
  end
end
