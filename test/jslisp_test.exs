defmodule JslispTest do
  use ExUnit.Case
  doctest Jslisp

  test "greets the world" do
    assert Jslisp.hello() == :world
  end
end
