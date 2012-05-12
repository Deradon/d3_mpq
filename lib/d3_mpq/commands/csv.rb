require 'fileutils'

module D3MPQ::Command
  class CSV
    attr_reader :options

    def initialize(options = {})
      @options = options
      @klass = @options[:klass]

      FileUtils.mkdir_p csv_path

      klass = eval("D3MPQ::CSVGenerator::#{@klass}")
      generator = klass.new(generator_params)
      generator.write
    end

    def generator_params
      { :files => input_path, :output_path => output_path }
    end

    def output_path
      "#{csv_path}/#{csv_name}#{patch}#{locale}.csv"
    end

    def csv_name
      @options[:csv_name] || @klass.to_s
    end

    def locale
      ".#{options[:locale]}" if options[:locale] && !options[:locale].empty?
    end

    def patch
      ".#{options[:patch]}" if options[:patch] && !options[:patch].empty?
    end

    def input_path
      options[:csv_input]
    end

    def csv_path
      options[:csv_path]
    end
  end
end

