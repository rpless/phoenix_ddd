defmodule PhoenixDdd.Repository.Job do
  alias PhoenixDdd.Persistence
  import Ecto.Query

  def submit(job) do
    insert = job |> to_persistence_model |> Persistence.insert
    case insert do
      {:error, change} -> {:error, change.message}
      {:ok, model} -> model |> to_domain_model
    end
  end

  def get(job_id) when is_binary(job_id) do
    query = from u in PhoenixDdd.Persistence.Job,
      where: u.job_id == ^job_id
    case query |> Persistence.one do
      nil -> nil
      model -> model |> to_domain_model
    end
  end

  defp to_domain_model(persistence_model) do
    %PhoenixDdd.Model.Job{
      job_id: persistence_model.job_id,
      user_id: persistence_model.user_id,
      code: persistence_model.code
    }
  end

  defp to_persistence_model(domain_model) do
    %PhoenixDdd.Persistence.Job{
      job_id: domain_model.job_id,
      user_id: domain_model.user_id,
      code: domain_model.code
    }
  end
end
