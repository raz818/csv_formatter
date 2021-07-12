
RSpec.describe CsvFormatter::Patient do
  describe ".valid?" do
    context "all attributes are valid" do
      it "returns true" do
        patient = CsvFormatter::Patient.new("Jason", "Bateman ", "12/12/2010", "AB 0000", "1/1/2010", nil, nil)
        expect(patient.valid?).to eq(true)
      end
    end+
  end
end