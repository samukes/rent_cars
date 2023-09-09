defmodule RentCars.CategoriesFixtures do
  @moduledoc false

  alias RentCars.Categories

  def category_fixture(params \\ %{}) do
    {:ok, category} =
      params
      |> Enum.into(%{description: "Category description", name: "Category name"})
      |> Categories.create_category()

    category
  end
end
