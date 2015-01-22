require 'spec_helper'
require_relative '../lib/user'

describe User do
  let(:user_bad_values) { User.new(age: {}, name: [], gender: 65.56) }


  describe " with age" do
    it "age is a number" do
      expect { user_bad_values.age.zero? }.to raise_exception
    end

    let(:user_m_80) { User.new(age: 80) }
    let(:user_m_60) { User.new(age: 60) }
    let(:user_m_75) { User.new(age: 75) }
    let(:user_m_8) { User.new(age: 8) }

    it "age 60" do
      expect(user_m_60.print_age_based_message).to include "You will turn"
    end
    it "age 75" do
      expect(user_m_75.print_age_based_message).to include "Congrats"
    end
    it "age 80" do
      expect(user_m_80.print_age_based_message).to include "You turned"
    end
    describe "old?" do
      context "is over 70" do
        it "is old" do
          expect(user_m_75.old?).to be_truthy
        end
        it "is not young" do
          expect(user_m_75.young?).to be_falsey
        end
        it "bad age" do
          expect { user_bad_values.young? }.to raise_exception
        end
      end
    end
    describe "young?" do
      context "is under 10" do
        it "is not old" do
          expect(user_m_8.old?).to be_falsey
        end
        it "is young" do
          expect(user_m_8.young?).to be_truthy
        end
        it "bad age" do
          expect { user_bad_values.young? }.to raise_exception
        end
      end
    end
  end

end