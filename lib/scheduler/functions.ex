defmodule Scheduler.Functions do
  alias Router.Functions

  def update_state(state) do
    List.pop_at(state, -1)
  end

  def build_worker(worker_state) do
    {:ok, pid} = GenServer.start_link(HelperWorker.HelperWorkerServer, worker_state)
    IO.inspect("GenServer #{inspect pid} was started")
    case GenServer.call(pid, :make_request) do
      {:error, message} -> Functions.exit_on_error(pid, message)
      res -> Functions.exit_gen_server(pid); res
    end
  end
end
