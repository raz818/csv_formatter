module CsvFormatter
  class Patient
    attr :first_name, :last_name, :dob, :member_id, :effective_date, :expiry_date, :phone_number
    attr_reader :errors
    def initialize(first_name, last_name, dob, member_id, effective_date, expiry_date, phone_number)
      @first_name = first_name
      @last_name = last_name
      @dob = dob
      @member_id = member_id
      @effective_date = effective_date
      @expiry_date = expiry_date
      @phone_number = phone_number
      @errors = []
    end

    def valid?
      errors = []
      errors.push({attribute: :first_name, message: "first_name must be present"}) if @first_name.nil? || @first_name.empty?
      errors.push({attribute: :last_name, message: "last_name must be present"}) if @last_name.nil? || @last_name.empty?
      errors.push({attribute: :dob, message: "dob must be present"}) if @dob.nil? || @dob.empty?
      errors.push({attribute: :member_id, message: "member_id must be present"}) if @member_id.nil? || @member_id.empty?
      errors.push({attribute: :effective_date, message: "effective_date must be present"}) if @effective_date.nil? || @effective_date.empty?
      @errors = errors
      @errors.empty?
    end

    private

      def validate_phone_number_format
        
      end
  end
  
end