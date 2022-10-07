defmodule HairControl.Repo.Migrations.AlterCollumPriceEmployeeTable do
  use Ecto.Migration

  def change do
    alter table(:employees) do
      modify :total_commission, :integer
      modify :total_received, :integer
    end

    alter table(:payroll) do
      modify :amount_paid, :integer
    end
  end
end
