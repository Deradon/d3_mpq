module D3MPQ::Command
  class Extract
    attr_reader :options

    def initialize(options = {})
      @options = options
      @options[:mpq_path] += "/" unless @options[:mpq_path].end_with?("/")
      logger "Extracting MPQ"
      cmd = "#{cd} && smpq -ef #{mpq} #{patch}"
      logger "Performing: #{cmd}"
      logger `#{cmd}`
    end

    class << self
      def all
        known_mpqs.each { |mpq| self.new(mpq) }
      end

      def known_mpqs
        [
          "ClientData",
          "GameBalance",
          "enUS_Audio",
          "enUS_Cutscene",
          "enUS_Text",
          "HLSLShaders",
          "Sound",
          "Texture"
        ]
      end
    end

    def cd
      "cd #{options[:extract_path]}"
    end

    def patch
      "-p #{mpq_path}base/* #{mpq_path}#{options[:locale]}/* #{mpq_path}Win/*"
    end

    def mpq
      "#{mpq_path}#{options[:mpq]}.mpq"
    end

    def mpq_path
      "../#{options[:mpq_path]}"
    end

    def logger(msg)
      puts msg
    end
  end
end

