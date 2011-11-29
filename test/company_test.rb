require "test/test_helper"
require "karmacrm/company"

module Karmacrm
  class CompanyTest < Test::Unit::TestCase
    def test_create
      all_companies = Company.find(:all)
      company = Company.new(:name => 'Test company')
      company.save
      assert_equal all_companies.length + 1, Company.find(:all).length
    end

    def test_find
      all_companies = Company.find(:all)
      assert_not_nil all_companies.select {|cmp| cmp.name == 'Test company'}
    end

    def test_find_by_name
      companies = Company.find(:all, :params => { :name => "Test company" })
      assert_not_nil companies
      assert companies.length > 0
      assert companies[0].id > 0
    end

    def test_update
      company = Company.find(:first, :params => { :name => "Test company" })
      assert_not_nil company
      company.name = "The other company"
      assert company.save
      assert_not_nil Company.find(:first, :params => { :name => "The other company" })
    end

    def test_delete
      company = Company.new(:name => 'Company to delete')
      company.save

      Company.delete(company.id)
      assert_nil Company.find(:first, :params => { :name => "Company to delete" })
    end
  end
end
