defmodule HairControl.Repo.Migrations.AddSericePacksTable do
  use Ecto.Migration

  def change do
    create table(:service_packs, primary_key: false) do
      add :id,            :uuid, primary_key: true
      add :title,         :string
      add :description,   :string
      add :total_seasons, :integer
      add :status,        :string
      add :price,         :integer

      add :list_service_id, {:array, :uuid}

      timestamps()
    end

    create index(:service_packs, [:list_service_id])

  end
end
