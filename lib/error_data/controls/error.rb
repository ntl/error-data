class ErrorData
  module Controls
    module Error
      Example = Class.new(RuntimeError)

      OtherExample = Class.new(RuntimeError)

      def self.example
        error = Example.new(message)
        error.set_backtrace(Backtrace.example)
        error
      end

      def self.class_name
        Example.name
      end

      def self.message
        Message.example
      end
    end
  end
end
