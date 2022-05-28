defmodule HairControl do
  @moduledoc """
  HairControl keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias HairControl.Employee

  defdelegate create_employee(params), to: Employee.Create, as: :call
end
