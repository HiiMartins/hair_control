defmodule HairControl.Repo.Migrations.AlterClientServiceTables do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :status, :string
    end

    alter table(:services) do
      modify :price, :integer
      add :status, :string
    end
  end
end
