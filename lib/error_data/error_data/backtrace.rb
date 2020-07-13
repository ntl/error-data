class ErrorData
  class Backtrace
    include Schema::DataStructure

    attribute :frames, Array, default: ->{ Array.new }

    def transform_read(data)
      frames = data.delete(:frames)

      frames = Array(frames)

      frames.each do |frame_data|
        frame = Frame.build(frame_data)

        add_frame(frame)
      end
    end

    def add_frame(frame)
      frames << frame
      self
    end
    alias :<< :add_frame

    def each(&blk)
      frames.each &blk
    end

    def text_frames
      frames.map do |frame|
        frame.to_s
      end
    end

    def to_a
      frames.map do |frame|
        frame.to_h
      end
    end

    def self.parse(backtrace)
      instance = new

      backtrace.each do |frame|
        instance.add_frame(Frame.parse(frame))
      end

      instance
    end
  end
end
