defmodule RentCarsWeb.Api.AccountController do
  use RentCarsWeb, :controller

  alias RentCars.Accounts

  action_fallback RentCarsWeb.FallbackController

  def create(conn, %{"user" => account}) do
    with {:ok, user} <- Accounts.create_user(account) do
      conn
      |> put_status(:created)
      |> render("show.json", %{user: user})
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    conn
    |> put_status(:ok)
    |> render("show.json", %{user: user})
  end
end
