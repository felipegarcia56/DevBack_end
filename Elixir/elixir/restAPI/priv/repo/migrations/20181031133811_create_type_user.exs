defmodule RestAPI.Repo.Migrations.CreateTypeUser do
  use Ecto.Migration

  def change do
    create table(:type_user) do
      add :description, :text

      timestamps()
    end

  end
end
