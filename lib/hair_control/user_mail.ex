defmodule HairControl.UserMail do
  import Swoosh.Email

  def welcome(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Equipe Célia Cabeleireira", "higor_dsm@hotmail.com"})
    |> subject("Hello, Colaborador")
    |> html_body("<h1>Hello #{user.name}</h1><p>Teste de envio de email</p>")
    |> text_body("Hello #{user.name} Teste de envio de email")
  end
end
