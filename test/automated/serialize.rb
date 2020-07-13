require_relative 'bench_init'

context "Error Data Serialization" do
  test "Converts to JSON text" do
    control_json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = ErrorData::Controls::ErrorData.example
    json_text = Serialize::Write.(error_data, :json)

    assert(json_text == control_json_text)
  end
end
