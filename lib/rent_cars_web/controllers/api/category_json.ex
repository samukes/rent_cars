defmodule RentCarsWeb.Api.CategoryJSON do
  @moduledoc false

  def render("index.json", %{categories: categories}) do
    %{data: many_category(categories)}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id, description: category.description, name: category.name}
  end

  defp many_category(categories) when is_list(categories) do
    Enum.reduce(categories, [], fn elem, acc ->
      [render("category.json", %{category: elem}) | acc]
    end)
  end

  defp many_category(_categories), do: []
end
