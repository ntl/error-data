require_relative 'bench_init'

context "Error Data Equality" do
  test "When attributes are equal" do
    error_data_1 = ErrorData::Controls::ErrorData.example
    error_data_2 = ErrorData::Controls::ErrorData.example

    assert(error_data_1 == error_data_2)
  end
end
