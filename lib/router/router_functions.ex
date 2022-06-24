defmodule Router.Functions do
  # Create the process name
  def get_process_name(state) do
    key = case Map.fetch(state, "api_key") do
      {:ok, key} -> key
      :error -> raise "Unable to retrieve API key"
    end

    String.to_atom("worker_#{key}")
  end

  # Kill the server and throw error
  def exit_on_error(pid, message) do
    exit_gen_server(pid)
    raise message
  end

  # Kill the Genserver
  def exit_gen_server(pid) do
    GenServer.stop(pid)
    IO.inspect("GenServer #{inspect pid} was killed")
  end
end
