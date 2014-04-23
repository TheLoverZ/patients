require 'spec_helper'

describe Location do
  context "associations" do
    it { should have_many(:patients) }
  end # context "associations"
  context "columns" do
    it { should have_db_column(:code) }
    it { should have_db_column(:name) }
  end # context "columns"
  context "validations" do
    it "code is maximum 10" do
      l = Location.new(:code => "1" * 11, :name => "foo")
      expect(l.save).to eq false
    end
    it "name is maximum 80" do
      l = Location.new(:name => "f" * 81)
      expect(l.save).to eq false
    end
    it "must have name property" do
      l = Location.new(:code => 123)
      expect(l.save).to eq false
      l.name = "foo"
      expect(l.save).to eq true
    end
  end # context "validations"
end
