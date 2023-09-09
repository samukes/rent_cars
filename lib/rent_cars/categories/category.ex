defmodule RentCars.Categories.Category do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @fields ~w(name description)a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field(:name, :string)
    field(:description, :string)

    timestamps()
  end

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(category, params) do
    category
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:name, name: "categories_name_index")
    |> update_change(:name, &String.upcase/1)
  end
end
