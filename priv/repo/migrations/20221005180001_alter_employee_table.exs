defmodule HairControl.Repo.Migrations.AlterEmployeeTable do
  use Ecto.Migration

  def change do
    alter table(:employees) do
      add :role, :string
      add :status, :string
    end
  end
end
