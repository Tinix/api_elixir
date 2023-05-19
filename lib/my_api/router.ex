defmodule MyApi.Router do
  use Plug.Router
  import Plug.Conn

  alias MyApi.Auth

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "¡Bienvenido a la API!")
  end

  post "/login" do
    conn = put_resp_header(conn, "content-type", "application/json")
    body = Jason.decode!(conn.body_params)
    username = body["username"]
    password = body["password"]

    # Check the user's credentials

    if valid_credentials?(username, password) do
      token = Auth.encode_token(%{"username" => username})
      send_resp(conn, 200, Jason.encode!(%{"token" => token}))
    else
      send_resp(conn, 401, "Credenciales inválidas")
    end
  end

  # Protected route with JWT authentication
  get "/protected" do
    conn = put_resp_header(conn, "content-type", "application/json")
    
    # Verificar el token JWT
    case get_req_header(conn, "authorization") do
      [token] ->
        case Auth.decode_token(token) do
          {:ok, _claims} ->
            send_resp(conn, 200, "Ruta protegida accesible")
          {:error, _reason} ->
            send_resp(conn, 401, "Token JWT inválido")
        end
      _ ->
        send_resp(conn, 401, "Token JWT no proporcionado")
    end
  end
end

