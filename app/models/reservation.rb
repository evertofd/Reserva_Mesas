class Reservation < ApplicationRecord
  def start
    self.start_date
  end

def title
  (self.user.nil?)?"-":self.try(:user).email
end



  has_and_belongs_to_many :tables
  belongs_to :user

end
