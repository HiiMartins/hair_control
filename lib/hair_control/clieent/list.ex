defmodule HairControl.Client.List do
  alias HairControl.{Client, Repo}

  def call(), do: {:ok, Repo.all(Client)}

  # TODO: implmenta lógica de listagem dos clientes
end
