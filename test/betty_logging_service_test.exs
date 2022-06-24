defmodule BettyLoggingServiceTest do
  use ExUnit.Case
  doctest BettyLoggingService

  test "greets the world" do
    assert BettyLoggingService.hello() == :world
  end
end
