defmodule Scheduler.ServerFunctions do
  alias Scheduler.WorkerFunctions

  # Public functions
  def update_state(state) do
    List.pop_at(state, -1)
  end

  def build_worker(worker_state) do
    try do
      WorkerFunctions.start_server(worker_state)
    rescue
      e in RuntimeError -> {:error, "Error occured: " <> e.message}
    end
  end
end
