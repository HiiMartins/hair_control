defmodule HairControlWeb.ErrorView do
  use HairControlWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("400.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translate_errors(result)}
  end


  def render("400.json", %{result: message}) do
    %{message: message}
  end

  def render("401.json", %{message: message}) do
    %{message: message}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
