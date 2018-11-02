defmodule RestAPI.Repo.Migrations.CreateTypeVehicle do
  use Ecto.Migration

  def change do
    create table(:type_vehicle) do
      add :description, :text

      timestamps()
    end

  end
end
