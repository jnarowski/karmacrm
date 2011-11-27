module Karmacrm
  class Note < Base
    def company
      Company.find(company_id)
    end

    def user
      User.find(user_id)
    end

  end
end
