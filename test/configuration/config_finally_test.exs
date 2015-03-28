defmodule ConfigFinallyTest do

	use ExUnit.Case
	
	defmodule SomeSpec do
    use ESpec
    it do: "some test"
  end

	setup_all do
    ESpec.configure fn(c) ->
      c.finally fn -> 
        ESpec.configure fn(c) -> c.hello :world end
      end
    end
    {:ok,
      ex1: Enum.at(SomeSpec.examples, 0),
    }
  end

  test "run ex1", context do
  	ESpec.Runner.run_example(context[:ex1], SomeSpec)
    assert(ESpec.Configuration.get(:hello) == :world)
  end
end