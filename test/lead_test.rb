require "test_helper"
require "karmacrm_client/lead"

module KarmacrmClient
  class LeadTest < Test::Unit::TestCase
    def test_create
      all = Lead.find(:all)
      first_name = "Test"
      last_name = "Lead"
      lead = Lead.create(:first_name => first_name, :last_name => last_name)
      assert lead.save

      assert_equal all.length + 1, Lead.find(:all).length
      assert_equal first_name, lead.first_name
      assert_equal last_name, lead.last_name
    end
  end
end
