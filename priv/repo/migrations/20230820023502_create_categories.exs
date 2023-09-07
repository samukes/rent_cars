defmodule RentCars.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary, primary_key: true
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:categories, [:name])
  end
end
