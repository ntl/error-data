require_relative './automated_init'

context "Error Data Equality" do
  control_error_data = ErrorData::Controls::ErrorData.example

  context "Same Attributes" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    equal = compare_error_data == control_error_data

    test "Equal" do
      assert(equal)
    end
  end

  context "Different Attributes" do
    compare_error_data = ErrorData::Controls::ErrorData.example

    compare_error_data.message = Controls::Error::Message.other_example

    equal = compare_error_data == control_error_data

    test "Not equal" do
      refute(equal)
    end
  end
end
