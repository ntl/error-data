require_relative './automated_init'

context "Error Data Deserialization" do
  control_error_data = ErrorData::Controls::ErrorData.example

  json_text = ErrorData::Controls::ErrorData::JSON.text

  error_data = Transform::Read.(json_text, :json, control_error_data.class)

  test "Converts from JSON text" do
    assert(error_data == control_error_data)
  end
end
