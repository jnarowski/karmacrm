require "test/test_helper"
require "karmacrm/company"

module Karmacrm
  class CompanyTest < Test::Unit::TestCase
    def setup
    end

    def test_create
      all_companies = Company.find(:all)
      company = Company.new(:name => 'Test company')
      company.save
      assert_equal all_companies.length + 1, Company.find(:all).length
    end
  end
end
