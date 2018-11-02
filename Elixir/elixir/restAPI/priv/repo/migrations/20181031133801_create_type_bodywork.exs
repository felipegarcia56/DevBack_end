defmodule RestAPI.Repo.Migrations.CreateTypeBodywork do
  use Ecto.Migration

  def change do
    create table(:type_bodywork) do
      add :description, :text

      timestamps()
    end

  end
end
