# frozen_string_literal: true
require 'rack'
require 'socket'
require_relative './atm_v3'

class App
  def initialize
    @atm = ATM_v3.new
  end

  def call(env)
    req = Rack::Request.new(env)
    case req.path
    when '/deposit'
      data = @atm.deposit req.params['value'].to_i
      [200, { 'Content-Type' => 'text/html' }, [data]]
    when '/withdraw'
      data = @atm.withdraw req.params['value'].to_i
      [200, { 'Content-Type' => 'text/html' }, [data]]
    when '/balance'
      data = @atm.balance
      [200, { 'Content-Type' => 'text/html' }, [data]]
    else
      [404, { 'Content-Type' => 'text/html' }, ["Not found"]]
    end
  end
end

app = App.new
server = TCPServer.new('127.0.0.1', 80)
while (connection = server.accept)
  request = connection.readline
  method, full_path = request.split(' ')
  path, params = full_path.split('?')
  status, headers, body = app.call({ 'REQUEST_METHOD' => method, 'PATH_INFO' => path, 'QUERY_STRING' => params })
  connection.print("HTTP/1.1 #{status}\r\n")
  headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }
  connection.print "\r\n"
  body.each { |part| connection.print(part) }
  connection.close
end
