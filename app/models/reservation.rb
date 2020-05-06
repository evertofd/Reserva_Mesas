class Reservation < ApplicationRecord
  enum status:  [:created , :process , :finished]


  def start
    self.start_date
  end

  def title
    (self.user.nil?)?"-":self.try(:user).name
  end

  def editable?
    Date.today < start_date ? true : false
  end



  has_and_belongs_to_many :tables
  belongs_to :user

end
