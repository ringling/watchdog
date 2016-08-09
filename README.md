# DeadMansSwitch

The term [dead man's switch](https://en.wikipedia.org/wiki/Dead_man%27s_switch) is used in trains. Where it, if not triggered within a certain time limit, will bring the train to a halt.

This application is inspired by [deadmanssnitch](https://deadmanssnitch.com/) and will emit an event, if it doesn't receive a message(ping) within a specified time limit(countdown timer) for a specific application.
This event can again trigger an action, e.g. sending an email or SMS or calling a callback hook.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `dead_mans_switch` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:dead_mans_switch, "~> 0.1.0"}]
    end
    ```

  2. Ensure `dead_mans_switch` is started before your application:

    ```elixir
    def application do
      [applications: [:dead_mans_switch]]
    end
    ```

