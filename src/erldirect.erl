%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc erldirect.

-module(erldirect).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the erldirect server.
start() ->
    erldirect_deps:ensure(),
    ensure_started(crypto),
    application:start(erldirect).


%% @spec stop() -> ok
%% @doc Stop the erldirect server.
stop() ->
    application:stop(erldirect).
