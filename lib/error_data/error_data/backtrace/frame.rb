class ErrorData
  class Backtrace
    class Frame
      include Schema::DataStructure

      attribute :filename, String
      attribute :line_number, Integer
      attribute :method_name, String

      def to_s
        "#{filename}:#{line_number}:in `#{method_name}'"
      end

      def correspond?(backtrace_text)
        to_s == backtrace_text
      end

      def self.parse(frame_text)
        filename, line_number, method_name = frame_text.split(':')

        line_number = Integer(line_number)

        method_name.gsub!(/^in `(.*?)'$/, "\\1")

        build({
          :filename => filename,
          :line_number => line_number,
          :method_name => method_name
        })
      end
    end
  end
end
