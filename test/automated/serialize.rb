require_relative './automated_init'

context "Error Data Serialization" do
  control_json_text = ErrorData::Controls::ErrorData::JSON.text

  error_data = ErrorData::Controls::ErrorData.example

  json_text = Transform::Write.(error_data, :json)

  test "Converts to JSON text" do
    assert(json_text == control_json_text)
  end
end
