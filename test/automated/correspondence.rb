require_relative './automated_init'

context "Error Data Correspondence with Error" do
  error = Controls::Error.example

  context "Correspondence" do
    error_data = Controls::ErrorData.example

    corresponds = error_data.correspond?(error)

    test do
      assert(corresponds)
    end
  end

  context "No Correspondence" do
    context "Different Classes" do
      class_name = Controls::Error::OtherExample.name

      error_data = Controls::ErrorData.example(class_name: class_name)

      corresponds = error_data.correspond?(error)

      test do
        refute(corresponds)
      end
    end

    context "Different Error Messages" do
      message = Controls::Error::Message.other_example

      error_data = Controls::ErrorData.example(message: message)

      corresponds = error_data.correspond?(error)

      test do
        refute(corresponds)
      end
    end

    context "Different Backtraces" do
      backtrace = Controls::ErrorData::Backtrace.other_example

      error_data = Controls::ErrorData.example(backtrace: backtrace)

      corresponds = error_data.correspond?(error)

      test do
        refute(corresponds)
      end
    end
  end
end
