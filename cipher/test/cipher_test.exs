defmodule CipherTest do
  use ExUnit.Case
  doctest Cipher

  describe "substitute/3" do
    test "substitutes all occurences of the letter A with Z case insensitive" do
      input = "All along the watchtower"
      output = "Zll zlong the wztchtower"

      assert Cipher.substitute(input, "a", "z") == output
    end
  end

  describe "caesar/2" do
    test "shifts all letters according" do
      input = "Purple haze all in my brain"
      output = "Rwtrng jcbg cnn kp oa dtckp"

      assert Cipher.caesar(input, 3) == output
    end
  end

  describe "atbash/1" do
    test "changes all letters by mapping the alphabet in reverse" do
      input = "Castles made of sand"
      output = "Xzhgovh nzwv lu hzmw"

      assert Cipher.atbash(input) == output
    end
  end
end
