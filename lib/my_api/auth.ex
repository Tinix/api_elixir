defmodule MyApi.Auth do
  require Joken

  @jwt_secret "your_secret_key"

  def encode_token(payload) do
    Joken.encode(payload, @jwt_secret)
  end

  def decode_token(token) do
    Joken.decode(token, @jwt_secret)
  end
end
