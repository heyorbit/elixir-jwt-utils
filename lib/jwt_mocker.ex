defmodule JwtTestUtils.JwtMocker do
  @moduledoc """
  Module to generate and validate a JWT token
  """

  import Joken

  @secret_key "secret_key"

  @doc """
  Returns the secret key used to sign the mock JWT tokens
  """
  @spec secret_key() :: String.t()
  def secret_key, do: @secret_key

  @doc """
  Generate a JWT token given a username.

  ## Examples

      iex> JwtTestUtils.JwtMocker.generate_json_token("a_username")
      "ees45nj3453jkbgbrk3jtvnvjkwn254ioj5iogf4nnj42gn24jkgnt35353ella2375zp1m4me"
  """
  @spec generate_json_token(String.t(), Integer.t()) :: String.t()
  def generate_json_token(username, exp \\ 0) do
    %{username: username, exp: exp}
    |> token()
    |> with_signer(hs256(@secret_key))
    |> sign()
    |> get_compact()
  end

  @doc """
  Validates a JWT token for the given username.

  ## Examples

      iex> JwtTestUtils.JwtMocker.validate_token("ees45nj3453jkbgbrk3jtvnvjkwn254ioj5iogf4nnj42gn24jkgnt35353ella2375zp1m4me", "a_username")
      :ok

      iex> JwtTestUtils.JwtMocker.validate_token("", "a_username")
      :error
  """
  @spec validate_token(String.t(), String.t(), Integer.t()) :: :ok | :error
  def validate_token(jwt, username, exp \\ 0) do
    jwt
    |> token()
    |> with_validation("username", &(&1 == username))
    |> with_validation("exp", &(&1 == exp))
    |> verify!(hs256(@secret_key))
    |> elem(0)
  end
end
