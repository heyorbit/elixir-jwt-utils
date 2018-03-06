defmodule JwtTestUtils.AuthConnCase do
  @moduledoc """
  Module to provide authed conn using JWT
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @fake_user_id "user@fake.is"
      @auth_header "authorization"

      alias JwtTestUtils.JwtMocker

      @doc """
      Returns a Plug.Conn with a injected header with a JWT token injected.

      By default returns always the same token in the "authorization" header.
      """
      @spec build_authed_conn(String.t(), String.t()) :: {Plug.Conn.t()}
      def build_authed_conn(user_id \\ @fake_user_id, auth_header \\ @auth_header) do
        jwt = JwtMocker.generate_json_token(user_id)

        conn =
          Plug.Adapters.Test.Conn.conn(%Plug.Conn{}, :get, "/", nil)
          |> Plug.Conn.put_private(:plug_skip_csrf_protection, true)
          |> Plug.Conn.put_private(:phoenix_recycled, true)

        Plug.Conn.put_req_header(conn, auth_header, jwt)
      end
    end
  end
end
