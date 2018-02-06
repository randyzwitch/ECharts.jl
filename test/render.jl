@test json("hello") == "\"hello\""
@test makevalidjson(:hello) == "hello"
@test makevalidjson([:hello, :world]) == ["hello", "world"]
@test makevalidjson(missing) == "-"
