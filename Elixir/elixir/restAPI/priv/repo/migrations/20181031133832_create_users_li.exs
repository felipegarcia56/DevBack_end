defmodule RestAPI.Repo.Migrations.CreateUsersLi do
  use Ecto.Migration

  def change do
    create table(:users_li) do
      add :last_name, :text
      add :full_name, :text
      add :identification, :text
      add :type_user, :integer

      timestamps()
    end

  end
end
