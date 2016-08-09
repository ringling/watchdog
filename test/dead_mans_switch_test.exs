defmodule DeadMansSwitchTest do
  use ExUnit.Case
  doctest DeadMansSwitch

  @default_switch %DeadMansSwitch{app_name: "My test app"}

  setup do
    {:ok, server} = DeadMansSwitch.Server.start_link
    {:ok, server: server}
  end

  test "should be inactive by default", %{server: server} do
    switch = DeadMansSwitch.Server.initialize(server, @default_switch)
    refute switch.active
  end

  test "should assign UUID on inititialize", %{server: server} do
    switch = DeadMansSwitch.Server.initialize(server, @default_switch)
    assert switch.uuid
  end

  test "should return all inititialized switches", %{server: server} do
    switch = DeadMansSwitch.Server.initialize(server, @default_switch)
    switch_map = DeadMansSwitch.Server.all_switches(server)
    assert length(Map.keys(switch_map)) == 1
    assert Map.has_key?(switch_map, "UUID")
  end

end
