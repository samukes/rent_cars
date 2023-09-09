defmodule RentCarsWeb.ErrorJSON do
  # If you want to customize a particular status code,
  # you may add your own clauses, such as:
  #
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".

  use RentCarsWeb, :html

  def render("422.json" = template, %{changeset: changeset}) do
    %{
      errors: %{
        reason: Ecto.Changeset.traverse_errors(changeset, &translate_error/1),
        detail: Phoenix.Controller.status_message_from_template(template)
      }
    }
  end

  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
