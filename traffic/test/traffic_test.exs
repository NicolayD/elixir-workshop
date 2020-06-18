defmodule TrafficTest do
  use ExUnit.Case
  doctest Traffic

  setup do
    {:ok, traffic_pid} = Traffic.start()
    # In case someone needs the Traffic GenServer PID
    {:ok, traffic_pid: traffic_pid}
  end

  @tag :base
  test "traffic lights change", %{traffic_pid: traffic_pid} do
    IO.inspect traffic_pid

    assert Traffic.get_lights() == {:red, :red}
    Traffic.change_lights()
    assert Traffic.get_lights() == {:red, :green}
  end

  # Traffic lights change after 1 second.
  @tag :base
  test "cars pass", %{traffic_pid: traffic_pid} do
    {:ok, car1_pid} = Car.start(:A)
    {:ok, car2_pid} = Car.start(:B)

    # B becomes green
    Traffic.change_lights()

    :timer.sleep(1050)
    assert Process.alive?(car2_pid) == false

    # Both become red
    Traffic.change_lights()

    # A becomes green
    Traffic.change_lights()

    :timer.sleep(1050)
    assert Process.alive?(car1_pid) == false
  end

  @tag :additional
  test "A stays green for 6 seconds, B stays green for 4 seconds", %{traffic_pid: traffic_pid} do
    # red-red for 1 second
    :timer.sleep(1_050)

    # red-green for 4 seconds + 1 second red-red
    assert Traffic.get_lights == {:red, :green}
    :timer.sleep(5_050)

    # green-red for 6 seconds + 1 second red-red
    assert Traffic.get_lights == {:green, :red}
    :timer.sleep(7_050)

    # red-green for 4 seconds + 1 second red-red
    assert Traffic.get_lights == {:red, :green}
    :timer.sleep(5_050)

    # Add 1 car to queue B and 2 to queue A to change the sequence
    {:ok, _pid} = Car.start(:A)
    {:ok, _pid} = Car.start(:A)
    {:ok, _pid} = Car.start(:B)

    # green-red for 4 seconds + 1 second red-red
    :timer.sleep(5_050)
    assert Traffic.get_lights == {:green, :red}

    # red-green for 6 seconds + 1 second red-red
    :timer.sleep(7_050)
    assert Traffic.get_lights == {:red, :green}
  end

  # If you want, you can add tests for cases when a car runs out of fuel
  # in the middle of the intersection. :)
end
