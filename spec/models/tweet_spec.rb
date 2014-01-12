require 'spec_helper'

describe Tweet do
  let(:tweet){ create(:tweet) }

  describe "validations" do

    it "is valid" do
      expect(create(:tweet)).to be_valid
    end

    it "is invalid without a body" do
      expect(build(:tweet, body: nil)).to be_invalid
    end

    it "is invalid without an author" do
      expect(build(:tweet, author: nil)).to be_invalid
    end

    it "is invalid with body longer than 140 chars" do
      expect(build(:invalid_tweet)).to be_invalid
    end
  end
end
