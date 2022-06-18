defmodule HairControl.Service.List do
  alias HairControl.{Service, Repo}

  def call(), do: {:ok, Repo.all(Service)}
end
