require "test_helper"
require "karmacrm/contact"

module Karmacrm
  class ContactTest < Test::Unit::TestCase
    def test_create
      all = Contact.find(:all)
      first_name = "Test"
      last_name = "Contact"
      contact = Contact.new(:first_name => first_name, :last_name => last_name)
      assert contact.save

      assert_equal all.length + 1, Contact.find(:all).length
      assert_equal first_name, contact.first_name
      assert_equal last_name, contact.last_name
    end
  end
end
