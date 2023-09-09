defmodule RentCars.Categories do
  @moduledoc false

  alias __MODULE__.Category
  alias RentCars.Repo

  def list_categories do
    Repo.all(Category)
  end

  def create_category(params) do
    params
    |> Category.changeset()
    |> Repo.insert()
  end

  def get_category(id) do
    Repo.get(Category, id)
  end

  def update_category(category, params) do
    category
    |> Category.changeset(params)
    |> Repo.update()
  end

  def delete_category(category) do
    Repo.delete(category)
  end
end
