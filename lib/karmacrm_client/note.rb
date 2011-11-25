require "base"

module KarmacrmClient
  class Note < Base
    def company
      Company.find(company_id)
    end
  end
end
