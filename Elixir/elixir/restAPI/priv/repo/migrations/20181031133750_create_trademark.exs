defmodule RestAPI.Repo.Migrations.CreateTrademark do
  use Ecto.Migration

  def change do
    create table(:trademark) do
      add :description, :text

      timestamps()
    end

  end
end
