defmodule Router.Functions do
  @doc """
  Generate a process name

  ## Examples

    iex> Router.Functions.get_process_name(%{"api_key" => "test_value"})
    :worker_test_value
  """
  def get_process_name(state) do
    key = case Map.fetch(state, "api_key") do
      {:ok, key} -> key
      :error -> raise "Unable to retrieve API key"
    end

    String.to_atom("worker_#{key}")
  end

  @doc """
  Exit the server on error
  """
  def exit_on_error(pid, message) do
    exit_gen_server(pid)
    raise message
  end

  @doc """
  Exits the gen server
  """
  def exit_gen_server(pid) do
    GenServer.stop(pid)
    IO.inspect("GenServer #{inspect pid} was killed")
  end
end
