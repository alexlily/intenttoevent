class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def self.find_averages
  	lat = 0
  	lon = 0
  	self.all.each do |user|
  		lat += user.latitude.to_f
  		lon += user.longitude.to_f
  	end
  	lat = lat / self.all.length
  	lon = lon / self.all.length 
  	return [lat, lon]

  end
  def self.find_average_lat
  	self.find_averages[0].to_s
  end
  def self.find_average_lon
  	self.find_averages[1].to_s
  end

end
