defmodule RentCarsWeb.Api.CategoryController do
  @moduledoc false

  use RentCarsWeb, :controller

  alias RentCars.Categories

  def index(conn, _params) do
    categories = Categories.list_categories()

    conn
    |> put_status(200)
    |> render("index.json", %{categories: categories})
  end
end
