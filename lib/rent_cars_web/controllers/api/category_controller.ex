defmodule RentCarsWeb.Api.CategoryController do
  @moduledoc false

  use RentCarsWeb, :controller

  def index(conn, _params) do
    categories = [%{description: "pumpkin 1223", id: "123123", name: "SPOT"}]

    conn
    |> put_status(200)
    |> render("index.json", %{categories: categories})
  end
end
