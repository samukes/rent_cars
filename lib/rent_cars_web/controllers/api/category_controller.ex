defmodule RentCarsWeb.Api.CategoryController do
  @moduledoc false

  use RentCarsWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{data: [%{description: "pumpkin 1223", id: "123123", name: "SPOT"}]})
  end
end
