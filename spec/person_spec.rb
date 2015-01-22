require 'spec_helper'
require_relative '../lib/person'

describe Person do
  let(:person_bad_values) { Person.new(age: {}, name: [], gender: 65.56) }
  it "gender is a string" do
    expect { person_bad_values.gender.chars }.to raise_exception
  end
  describe "male?" do
    context "is a guy" do
      let(:person_m) { Person.new(gender: "M") }
      it "is true" do
        expect(person_m.male?).to be_truthy
      end
    end
    context "is a girl" do
      let(:person_f) { Person.new(gender: "F") }
      it "is true" do
        expect(person_f.male?).to be_falsey
      end
    end

  end

  describe " with age" do

    it "age is a number" do
      expect { person_bad_values.age.zero? }.to raise_exception
    end

    describe "old?" do
      context "is over 70" do
        let(:person_m) { Person.new(age: 75) }

        it "is old" do
          expect(person_m.old?).to be_truthy
        end
        it "is not young" do
          expect(person_m.young?).to be_falsey
        end
        it "bad age" do
          expect { person_bad_values.young? }.to raise_exception
        end
      end
    end
    describe "young?" do
      context "is under 10" do
        let(:person_m) { Person.new(age: 8) }

        it "is not old" do
          expect(person_m.old?).to be_falsey
        end
        it "is young" do
          expect(person_m.young?).to be_truthy
        end
        it "bad age" do
          expect { person_bad_values.young? }.to raise_exception
        end
      end
    end
  end

  name = "Greg"
  describe "name" do
    it "name is a string" do
      expect { person_bad_values.name.chars }.to raise_exception
    end
    let(:person_name) { Person.new(name: name) }
    describe "name" do
      it "name " do
        expect(person_name.name).to_not be_falsey
      end
    end
  end

end