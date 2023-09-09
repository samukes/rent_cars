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
end
