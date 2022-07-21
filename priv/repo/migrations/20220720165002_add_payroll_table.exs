defmodule HairControl.Repo.Migrations.AddPayrollTable do
  use Ecto.Migration

  def change do
    create table(:payroll, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :amount_paid, :float

      add :employee_id, references(:employees, type: :uuid, on_delete: :delete_all)

      timestamps()
    end
  end
end
