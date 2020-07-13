require_relative './automated_init'

context "Convert Error to ErrorData" do
  error = ErrorData::Controls::Error.example

  error_data = ErrorData::Convert::Error.(error)

  corresponds = error_data.correspond?(error)

  test do
    assert(corresponds)
  end
end
