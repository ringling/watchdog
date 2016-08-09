# Watchdog




If a watchdog or [dead man's switch](https://en.wikipedia.org/wiki/Dead_man%27s_switch) is not triggered within a certain time limit, it will bring the apply corrective measures or notify for them to be performed.

This application is inspired by [deadmanssnitch](https://deadmanssnitch.com/) and will emit an event, if it doesn't receive a message(ping) within a specified time limit(countdown timer) for a specific application.
This event can again trigger an action, e.g. sending an email or SMS or calling a callback hook.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `watchdog` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:watchdog, "~> 0.1.0"}]
    end
    ```

  2. Ensure `watchdog` is started before your application:

    ```elixir
    def application do
      [applications: [:watchdog]]
    end
    ```

