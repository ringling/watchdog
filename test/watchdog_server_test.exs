defmodule Watchdog.ServerTest do
  use ExUnit.Case

  @default_switch %DeadMansSwitch{app_name: "My test app"}

  setup do
    {:ok, server} = Watchdog.Server.start_link
    {:ok, server: server}
  end

  test "should be inactive by default", %{server: server} do
    switch = Watchdog.Server.initialize(server, @default_switch)
    refute switch.active
  end

  test "should assign UUID on inititialize", %{server: server} do
    switch = Watchdog.Server.initialize(server, @default_switch)
    assert switch.uuid
  end

  test "should return all inititialized switches", %{server: server} do
    switch = Watchdog.Server.initialize(server, @default_switch)
    switch_map = Watchdog.Server.all_switches(server)
    assert length(Map.keys(switch_map)) == 1
  end

end
