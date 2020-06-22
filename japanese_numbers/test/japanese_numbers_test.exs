defmodule JapaneseNumbersTest do
  use ExUnit.Case
  doctest JapaneseNumbers

  test "calculates everything before man" do
    assert JapaneseNumbers.calculate(10) == "juu"
    assert JapaneseNumbers.calculate(100) == "hyaku"
    assert JapaneseNumbers.calculate(1000) == "sen"
    assert JapaneseNumbers.calculate(110) == "hyaku juu"
    assert JapaneseNumbers.calculate(1110) == "sen hyaku juu"
  end

  test "calculates man" do
    assert JapaneseNumbers.calculate(100000) == "10 man"
  end

  test "calculates composite numbers" do
    assert JapaneseNumbers.calculate(1001000) == "100 man sen"
    assert JapaneseNumbers.calculate(1005000) == "100 man 5 sen"
    assert JapaneseNumbers.calculate(1001110) == "100 man sen hyaku juu"
    assert JapaneseNumbers.calculate(1005550) == "100 man 5 sen 5 hyaku 5 juu"
  end
end
