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
end
