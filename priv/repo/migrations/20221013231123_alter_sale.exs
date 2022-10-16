defmodule HairControl.Repo.Migrations.AlterSale do
  use Ecto.Migration

  def change do
    alter table(:sales) do
      add :status, :string
    end
  end
end
