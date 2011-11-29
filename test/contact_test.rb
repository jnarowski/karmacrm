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

    def test_find
      all = Contact.find(:all)
      assert_not_nil all.select {|cnt| cnt.first_name == 'Test'}
    end

    def test_find_by_name
      contacts = Contact.find(:all, :params => { :first_name => "Test" })
      assert_not_nil contacts
      assert contacts.length > 0
      assert contacts[0].id > 0
    end

    def test_update
      contact = Contact.find(:first, :params => { :first_name => "Test" })
      assert_not_nil contact
      contact.name = "Changed first name"
      assert contact.save
      assert_not_nil Contact.find(:first, :params => { :first_name => "Changed first name" })
    end

    def test_delete
      contact = Contact.new(:first_name => 'Contact to', :last_name => 'Delete')
      contact.save

      Contact.delete(contact.id)
      assert_nil Contact.find(:first, :params => { :first_name => "Contact to" })
    end
  end
end
