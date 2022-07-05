defmodule HairControl.Employee.List do
  alias HairControl.{Employee, Repo}

  def call(), do: {:ok, Repo.all(Employee)}
end
