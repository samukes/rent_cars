defmodule RentCarsWeb.Api.CategoryController do
  @moduledoc false

  use RentCarsWeb, :controller

  alias RentCars.Categories

  action_fallback RentCarsWeb.Api.FallbackController

  def index(conn, _params) do
    categories = Categories.list_categories()

    conn
    |> put_status(:ok)
    |> render("index.json", %{categories: categories})
  end

  def create(conn, %{"category" => category}) do
    with {:ok, category} <- Categories.create_category(category) do
      conn
      |> put_status(:created)
      |> render("show.json", %{category: category})
    end
  end

  def show(conn, %{"id" => id}) do
    category = Categories.get_category(id)

    conn
    |> put_status(:ok)
    |> render("show.json", %{category: category})
  end

  def update(conn, %{"id" => id, "category" => params}) do
    with category <- Categories.get_category(id),
         {:ok, category} <- Categories.update_category(category, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{category: category})
    end
  end

  def delete(conn, %{"id" => id}) do
    with category <- Categories.get_category(id),
         {:ok, _} <- Categories.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
