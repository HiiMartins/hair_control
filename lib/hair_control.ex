defmodule HairControl do
  @moduledoc """
  HairControl keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias HairControl.{Employee, Client, Sale, Service, ServicePacks}
  alias Employee.Payroll

  defdelegate create_employee(params), to: Employee.Create, as: :call
  defdelegate delete_employee(params), to: Employee.Delete, as: :call
  defdelegate fetch_employee(params), to: Employee.Get, as: :call
  defdelegate list_employees(), to: Employee.List, as: :call
  defdelegate update_employee(params), to: Employee.Update, as: :call

  defdelegate create_client(params), to: Client.Create, as: :call
  defdelegate delete_client(params), to: Client.Delete, as: :call
  defdelegate fetch_client(params), to: Client.Get, as: :call
  defdelegate list_clients(), to: Client.List, as: :call
  defdelegate update_client(params), to: Client.Update, as: :call

  defdelegate create_service(params), to: Service.Create, as: :call
  defdelegate delete_service(params), to: Service.Delete, as: :call
  defdelegate fetch_service(params), to: Service.Get, as: :call
  defdelegate list_services(), to: Service.List, as: :call
  defdelegate update_service(params), to: Service.Update, as: :call

  defdelegate create_sale(params), to: Sale.Create, as: :call
  defdelegate delete_sale(params), to: Sale.Delete, as: :call
  defdelegate fetch_sale(params), to: Sale.Get, as: :call
  defdelegate list_sales(params), to: Sale.List, as: :call

  defdelegate create_payroll(params), to: Payroll.Create, as: :call
  defdelegate delete_payroll(params), to: Payroll.Delete, as: :call
  defdelegate fetch_payroll(params), to: Payroll.Get, as: :call
  defdelegate list_payroll(), to: Payroll.List, as: :call

  defdelegate create_service_pack(params), to: ServicePacks.Create, as: :call
  defdelegate delete_service_pack(params), to: ServicePacks.Delete, as: :call
  defdelegate fetch_service_pack(params), to: ServicePacks.Get, as: :call
  defdelegate list_service_pack(), to: ServicePacks.List, as: :call
  defdelegate update_service_pack(params), to: ServicePacks.Update, as: :call
end
