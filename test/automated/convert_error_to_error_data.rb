require_relative 'bench_init'

test "Convert Error to ErrorData" do
  error = ErrorData::Controls::Error.example
  error_data = ErrorData::Convert::Error.(error)
  error_data.correspond? error
end
