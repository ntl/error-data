class ErrorData
  module Controls
    module Error
      module Backtrace
        def self.example
          [
            Frames::First.text,
            Frames::Second.text,
            Frames::Third.text
          ]
        end

        def self.other_example
          [
            Frames::First.text,
            Frames::Third.text,
            Frames::Second.text
          ]
        end

        module Frames
          module Text
            def text
              "#{filename}:#{line_number}:in `#{method_name}'"
            end
          end

          module First
            extend Text

            def self.line_number
              111
            end

            def self.filename
              'some_file.rb'
            end

            def self.method_name
              'some_method'
            end
          end

          module Second
            extend Text

            def self.line_number
              11
            end

            def self.filename
              'some_other_file.rb'
            end

            def self.method_name
              'some_other_method'
            end
          end

          module Third
            extend Text

            def self.line_number
              1
            end

            def self.filename
              'yet_another_file.rb'
            end

            def self.method_name
              'yet_another_method'
            end
          end
        end
      end
    end
  end
end
