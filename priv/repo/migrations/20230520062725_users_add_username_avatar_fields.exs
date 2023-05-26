defmodule Pento.Repo.Migrations.UsersAddUsernameAvatarFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, null: false, default: ""
      add :avatar, :string
    end
  end
end
