defmodule Router.Pipelines do

  alias Router.Functions

  def get_log_pipeline(body) do
    # Geef het beestje een naam
    server_name = Functions.get_process_name(body)
    IO.inspect(server_name)

    # Manage the GenServer
    {:ok, pid} = GenServer.start_link(HelperWorker.HelperWorkerServer, body)
    IO.inspect("GenServer #{inspect pid} was started")
    case GenServer.call(pid, :make_request) do
      {:error, message} -> Functions.exit_on_error(pid, message)
      res -> Functions.exit_gen_server(pid); res
    end
  end

end
