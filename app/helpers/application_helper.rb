module ApplicationHelper
  # convirtiendo la respuesta del servidor a objecto json
  # y asi poder evaluar durante las pruebas
  def payload_test
    JSON.parse(response.body, symbolize_names: true)
  end
end
