defmodule Pento.Repo.Migrations.UsersModifyUsername do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :username, :string, null: false
    end
  end
end
