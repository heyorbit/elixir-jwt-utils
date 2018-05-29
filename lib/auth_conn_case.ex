defmodule JwtTestUtils.AuthConnCase do
  @moduledoc """
  Module to provide authed conn using JWT
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @fake_user_id "user@fake.is"
      @auth_header "authorization"
      @exp 17_295_205_807

      alias JwtTestUtils.JwtMocker

      @typedoc """
      Opts:
        - username: Will be present in the `username` claim of the JWT
        - auth_header: The header name where the JWT will be put
        - exp: Expiration timestamp for the JWT
      """
      @type opts :: [
              username: any,
              auth_header: String.t(),
              exp: non_neg_integer
            ]

      @doc """
      Returns a Plug.Conn with a injected header with a JWT token injected.

      By default returns always the same token in the "authorization" header.
      """
      @spec build_authed_conn(opts) :: Plug.Conn.t()
      def build_authed_conn(opts \\ []) do
        username = opts[:username] || @fake_user_id
        auth_header = opts[:auth_header] || @auth_header
        exp = opts[:exp] || @exp

        jwt = JwtMocker.generate_json_token(username, exp)

        conn =
          Plug.Adapters.Test.Conn.conn(%Plug.Conn{}, :get, "/", nil)
          |> Plug.Conn.put_private(:plug_skip_csrf_protection, true)
          |> Plug.Conn.put_private(:phoenix_recycled, true)

        Plug.Conn.put_req_header(conn, auth_header, jwt)
      end
    end
  end
end
