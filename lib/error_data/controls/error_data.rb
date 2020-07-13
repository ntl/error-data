class ErrorData
  module Controls
    module ErrorData
      def self.example(class_name: nil, message: nil, backtrace: nil)
        class_name ||= self.class_name
        message ||= self.message
        backtrace ||= self.backtrace

        error_data = ::ErrorData.new

        error_data.class_name = class_name
        error_data.message = message

        error_data.backtrace = backtrace

        error_data
      end

      def self.class_name
        Controls::Error.class_name
      end

      def self.message
        Controls::Error.message
      end

      def self.backtrace
        Backtrace.example
      end

      module Backtrace
        def self.example
          ::ErrorData::Backtrace.new.tap do |b|
            b << Frames::First.example
            b << Frames::Second.example
            b << Frames::Third.example
          end
        end

        def self.other_example
          ::ErrorData::Backtrace.new.tap do |b|
            b << Frames::First.example
            b << Frames::Third.example
            b << Frames::Second.example
          end
        end

        module Frames
          module First
            def self.example
              ::ErrorData::Backtrace::Frame.new.tap do |f|
                f.line_number = Controls::Error::Backtrace::Frames::First.line_number
                f.filename = Controls::Error::Backtrace::Frames::First.filename
                f.method_name = Controls::Error::Backtrace::Frames::First.method_name
              end
            end
          end

          module Second
            def self.example
              ::ErrorData::Backtrace::Frame.new.tap do |f|
                f.line_number = Controls::Error::Backtrace::Frames::Second.line_number
                f.filename = Controls::Error::Backtrace::Frames::Second.filename
                f.method_name = Controls::Error::Backtrace::Frames::Second.method_name
              end
            end
          end

          module Third
            def self.example
              ::ErrorData::Backtrace::Frame.new.tap do |f|
                f.line_number = Controls::Error::Backtrace::Frames::Third.line_number
                f.filename = Controls::Error::Backtrace::Frames::Third.filename
                f.method_name = Controls::Error::Backtrace::Frames::Third.method_name
              end
            end
          end
        end
      end

      def self.data
        data = {}

        data[:class_name] = Controls::Error.class_name
        data[:message] = Controls::Error.message

        backtrace = [
          {
            :line_number => Controls::Error::Backtrace::Frames::First.line_number,
            :filename => Controls::Error::Backtrace::Frames::First.filename,
            :method_name => Controls::Error::Backtrace::Frames::First.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Frames::Second.line_number,
            :filename => Controls::Error::Backtrace::Frames::Second.filename,
            :method_name => Controls::Error::Backtrace::Frames::Second.method_name
          },
          {
            :line_number => Controls::Error::Backtrace::Frames::Third.line_number,
            :filename => Controls::Error::Backtrace::Frames::Third.filename,
            :method_name => Controls::Error::Backtrace::Frames::Third.method_name
          }
        ]

        data[:backtrace] = backtrace

        data
      end

      module JSON
        def self.text
          ::JSON.generate(data)
        end

        def self.data
          {
            'className' => Controls::Error.class_name,
            'message' => Controls::Error.message,
            'backtrace' => Backtrace.data
          }
        end

        module Backtrace
          def self.data
            [
              Frames::First.data,
              Frames::Second.data,
              Frames::Third.data
            ]
          end

          module Frames
            module First
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::First.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::First.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::First.method_name
                }
              end
            end

            module Second
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::Second.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::Second.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::Second.method_name
                }
              end
            end

            module Third
              def self.data
                {
                  'filename' => Controls::Error::Backtrace::Frames::Third.filename,
                  'lineNumber' => Controls::Error::Backtrace::Frames::Third.line_number,
                  'methodName' => Controls::Error::Backtrace::Frames::Third.method_name
                }
              end
            end
          end
        end
      end
    end
  end
end
