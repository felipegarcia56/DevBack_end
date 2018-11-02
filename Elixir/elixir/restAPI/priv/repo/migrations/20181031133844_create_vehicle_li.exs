defmodule RestAPI.Repo.Migrations.CreateVehicleLi do
  use Ecto.Migration

  def change do
    create table(:vehicle_li) do
      add :plate, :text
      add :type_vehicle, :integer
      add :type_bodywork, :integer
      add :trademark, :integer
      add :id_user, :integer

      timestamps()
    end

  end
end
