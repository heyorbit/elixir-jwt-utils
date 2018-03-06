[![Coverage Status](https://coveralls.io/repos/github/heyorbit/elixir-jwt-utils/badge.svg?branch=master)](https://coveralls.io/github/heyorbit/elixir-jwt-utils?branch=master)
[![Hex version](https://img.shields.io/hexpm/v/sippet.svg "Hex version")](https://hex.pm/packages/jwt_test_utils)
[![Hex Docs](https://img.shields.io/badge/hex-docs-9768d1.svg)](https://hexdocs.pm/jwt_test_utils)
[![Build Status](https://travis-ci.org/heyorbit/elixir-jwt-utils.svg?branch=master)](https://travis-ci.org/heyorbit/elixir-jwt-utils)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/heyorbit/elixir-jwt-utils.svg)](https://beta.hexfaktor.org/github/heyorbit/elixir-jwt-utils)

# JwtTestUtils

Test utils for app based JWT authentication

Features:

  * Create mocked JWT tokens
  * Create Plug.Conn structs with an injected JWT token

## Installation

Add to dependencies

```elixir
def deps do
  [{:jwt_test_utils, "~> 0.1.1", only: :test}]
end
```

```bash
mix deps.get
```
