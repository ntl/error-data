require_relative 'bench_init'

context "Error Data Deserialization" do
  test "Converts from JSON text" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    json_text = ErrorData::Controls::ErrorData::JSON.text

    error_data = Serialize::Read.(json_text, compare_error_data.class, :json)

    assert(error_data == compare_error_data)
  end
end
