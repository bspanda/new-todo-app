require "date"
require "active_record"

class Todo < ActiveRecord::Base
  belongs_to :user

  def self.overdue
    all.where("completed = ? and due_date < ? ", false, Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
