defmodule PhoenixDdd.JobController do
  use PhoenixDdd.Web, :controller

  def get_job(conn, %{"job_id" => job_id}) do
    case job_id |> PhoenixDdd.Repository.Job.get do
      nil -> conn |> send_resp(:not_found, "")
      %PhoenixDdd.Model.Job{user_id: user_id, code: code} ->
        data = %{"user_id" => user_id, "code" => code}
        conn |> json(data)
    end
  end

  def submit_job(conn, params = %{"code" => code, "user_id" => user_id}) do
    case %{user_id: user_id, code: code} |> PhoenixDdd.Model.Job.create do
      nil -> conn |> send_resp(:isr, "")
      job ->
        case job |> PhoenixDdd.Repository.Job.submit do
          nil -> conn |> send_resp(:not_found, "")
          submitted_job ->
            data = %{"job_id" => submitted_job.job_id}
            conn |> put_status(:created) |> json(data)
        end
    end
  end
end
