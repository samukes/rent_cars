defmodule RentCarsWeb.Api.AccountJSON do
  @moduledoc false

  def render("show.json", %{user: _} = elem) do
    %{data: render("user.json", elem)}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      user_name: user.user_name,
      email: user.email,
      driver_license: user.driver_license,
      roles: user.roles
    }
  end
end
