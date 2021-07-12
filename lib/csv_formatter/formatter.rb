module CsvFormatter
  class Formatter
    attr_reader :patients
    def initialize
      @patients = []
    end

    def format(file)
      CSV.foreach(file, headers: true) do |row|
        data = row.to_h
        stripped_values = data.values.map do |v|
          v.strip unless v.nil?
        end+
        p = Patient.new(*stripped_values)
        @patients.push(p)
      end

      @patients
    end

    def format_date(date)
      numbers = date.split(/\d+/)
    end
  end
end