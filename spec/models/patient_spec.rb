# -*- coding: utf-8 -*-
require 'spec_helper'

describe Patient do
  before :all do
    Patient.destroy_all
    p1 = Patient.new(first_name: "foo", last_name: "bar", status: "initial", gender: "male")
    p2 = Patient.new(first_name: "xxx", last_name: "yyy", status: "referred", gender: "female")
    l1 = Location.find_by(name: "Test Location 1")
    l2 = Location.find_by(name: "Test Location 2")
    p1.location = l1
    p2.location = l2
    p1.save; p1.save
  end

  let(:p1) { Patient.find_by(first_name: "foo") }
  let(:params) { { first_name: "1", last_name: "2", status: "referred", gender: "female" } }

  context "associations" do
    it { should belong_to(:location) }
  end # context "associations"

  context "columns" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:middle_name) }
    it { should have_db_column(:birthday) }
    it { should have_db_column(:medical_number) }
    it { should have_db_column(:gender) }
    it { should have_db_column(:status) }
    it { should have_db_column(:view_count) }
    it { should have_db_column(:deleted) }
  end # context "columns"

  context "validations" do
    it "have first & last name & location" do
      %w(first_name last_name location).each do |v|
        expect(p1.update_attributes(v.to_sym => nil)).to eq false
      end
    end

    it "have status in %w(initial referred treatment closed)" do
      %w(initial referred treatment closed).each do |l|
        expect(p1.update_attributes(:status => l)).to eq true
      end
      expect(p1.update_attributes(:status => "illegal")).to eq false
    end

    it "first & last name length is 30 maximum" do
      expect(p1.update_attributes(:first_name => "1" * 31)).to eq false
      expect(p1.update_attributes(:last_name => "1" * 31)).to eq false
    end

    it "middle_name length is 10 maximum" do
      expect(p1.update_attributes(:middle_name => "1" * 11)).to eq false
    end

    it "gender is in %w(not_available male female)" do
      %w(not_available male female).each do |g|
        expect(p1.update_attributes(:gender => g)).to eq true
      end
      expect(p1.update_attributes(:gender => "multi-gender!")).to eq false
    end

    it "have correct medical record number" do
      p = Patient.new(params)
      p.location = Location.first
      p.save
      expect(p.medical_number).to eq "MR%06d" % p.id
    end

    it "has deleted status false by default" do
      p = Patient.new(params)
      p.location = Location.first
      p.save
      expect(p.deleted).to eq false
    end

    it "has view count 0 by default" do
      p = Patient.new(params)
      p.location = Location.first
      p.save
      expect(p.view_count).to eq 0
    end

  end # context "validations"

  context "methods#ages" do
    it "return patient's age" do
      p1.update_attributes(:birthday => Date.new(*[1991, 2, 9]))
      expect(p1.ages).to eq 23
    end
  end # context 'methods#ages'

  context "methods#full_name" do
    it "return patient's full name" do
      expect(p1.full_name).to eq "bar, foo"
    end
  end
end
