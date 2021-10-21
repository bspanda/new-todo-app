class User < ActiveRecord::Base
  def to_display_string
    "#{id}.  #{name}  #{email} #{password}"
  end
end
