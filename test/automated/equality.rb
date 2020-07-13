require_relative './automated_init'

context "Error Data Equality" do
  control_error_data = ErrorData::Controls::ErrorData.example

  context "Equal" do
    context "Same Attributes" do
      compare_error_data = ErrorData::Controls::ErrorData.example

      equal = compare_error_data == control_error_data

      test do
        assert(equal)
      end
    end
  end

  context "Not Equal" do
    context "Different Class Names" do
      compare_error_data = ErrorData::Controls::ErrorData.example

      compare_error_data.class_name = Controls::Error::OtherExample.name

      equal = compare_error_data == control_error_data

      test do
        refute(equal)
      end
    end

    context "Different Messages" do
      compare_error_data = ErrorData::Controls::ErrorData.example

      compare_error_data.message = Controls::Error::Message.other_example

      equal = compare_error_data == control_error_data

      test do
        refute(equal)
      end
    end

    context "Different Backtraces" do
      compare_error_data = ErrorData::Controls::ErrorData.example

      compare_error_data.backtrace = Controls::ErrorData::Backtrace.other_example

      equal = compare_error_data == control_error_data

      test do
        refute(equal)
      end
    end
  end
end
