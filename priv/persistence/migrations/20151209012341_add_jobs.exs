defmodule PhoenixDdd.Persistence.Migrations.AddJobs do
  use Ecto.Migration

  def change do
    create table(:jobs, primary_key: false) do
      add :job_id, :string, primary_key: true
      add :user_id, references(:users, column: :user_id, type: :string, on_delete: :delete_all)
      add :code, :text
    end
  end
end
