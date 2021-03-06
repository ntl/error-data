class ErrorData
  include Schema::DataStructure

  attribute :class_name, String
  attribute :message, String
  attribute :backtrace, Backtrace, default: ->{ Backtrace.new }

  def transform_write(data)
    backtrace = data.delete(:backtrace)

    backtrace_data = backtrace.to_a

    data[:backtrace] = backtrace_data
  end

  def transform_read(data)
    backtrace = data.delete(:backtrace)

    return if backtrace.nil?

    backtrace.each do |frame_data|
      frame = Backtrace::Frame.build(frame_data)

      self.backtrace.add_frame(frame)
    end
  end

  def set_backtrace(backtrace)
    self.backtrace = Backtrace.parse(backtrace)
  end

  def correspond?(error)
    error_corresponds =
      class_name == error.class.name &&
      message == error.message

    backtrace_corresponds = backtrace.text_frames == error.backtrace

    error_corresponds && backtrace_corresponds
  end

  module Transform
    def self.json
      JSON
    end

    def self.raw_data(instance)
      instance.attributes
    end

    def self.instance(raw_data)
      ErrorData.build(raw_data)
    end

    module JSON
      def self.read(text)
        formatted_data = ::JSON.parse(text, symbolize_names: true)
        Casing::Underscore.(formatted_data)
      end

      def self.write(raw_data)
        formatted_data = Casing::Camel.(raw_data)
        ::JSON.generate(formatted_data)
      end
    end
  end
end
