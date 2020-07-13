class ErrorData
  include Schema::DataStructure

  attribute :class_name, String
  attribute :message, String
  attribute :backtrace, Backtrace

  def backtrace
    @backtrace ||= Backtrace.new
  end

  def self.build(data=nil)
    instance = super
    instance.backtrace = Backtrace.build(instance.backtrace)
    instance
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

  def to_h
    data = attributes
    data[:backtrace] = backtrace.to_a
    data
  end

  module Serializer
    def self.json
      JSON
    end

    def self.instance(raw_data)
      ErrorData.build(raw_data)
    end

    def self.raw_data(instance)
      instance.to_h
    end

    module JSON
      def self.deserialize(text)
        formatted_data = ::JSON.parse(text)
        Casing::Underscore.(formatted_data)
      end

      def self.serialize(raw_data)
        formatted_data = Casing::Camel.(raw_data)
        ::JSON.generate(formatted_data)
      end
    end
  end
end
