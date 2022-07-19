defmodule Scheduler.WorkerFunctions do
  defp exit_on_error(pid, message) do
    exit_gen_server(pid)
    raise message
  end

  defp exit_gen_server(pid) do
    GenServer.stop(pid)
    IO.inspect("GenServer #{inspect pid} was killed")
  end

  def start_server(worker_state) do
    {:ok, pid} = GenServer.start_link(HelperWorker.HelperWorkerServer, worker_state)
    IO.inspect("GenServer #{inspect pid} was started")
    case GenServer.call(pid, :make_request) do
      {:error, message} -> exit_on_error(pid, message)
      res -> exit_gen_server(pid); res
    end
  end
end
