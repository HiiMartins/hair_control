defmodule HairControl.Repo.Migrations.CreateSaleTable do
  use Ecto.Migration

  def change do
    create table(:sales, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :payment_method, :string

      add :employee_id, references(:employees, on_delete: :nothing, type: :uuid)
      add :client_id, references(:clients, on_delete: :nothing, type: :uuid)
      add :service_id, references(:services, on_delete: :nothing, type: :uuid)

      timestamps()
    end
  end
end
