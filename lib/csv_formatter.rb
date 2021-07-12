# frozen_string_literal: true

require_relative "csv_formatter/version"
require_relative "csv_formatter/patient"
require_relative "csv_formatter/formatter"
require "csv"

module CsvFormatter
  class Error < StandardError; end

  def self.run(file)
    formatter = Formatter.new
    patients = formatter.format(file)
    CSV.open("output/output.csv", "w") do |csv|
      csv << ["first_name", "last_name", "dob", "member_id", "effective_date", "expiry_date", "phone_number"]
      patients.each do |p|
        csv << [p.first_name, p.last_name, p.dob, p.member_id, p.effective_date, p.expiry_date, p.phone_number] if p.valid?
      end
    end

    File.open("output/results.txt", "w") do |file|
      file << "The following rows could not be formatted for one or more reasons\n"
      patients.each_with_index do |p, i|
        if !p.valid?
          errors = p.errors.map do |e|
            e[:message]
          end
          file << "Row: #{i + 1}, issues: #{errors.join(", ")}\n"
        end
        
      end
    end
  end
  
end
