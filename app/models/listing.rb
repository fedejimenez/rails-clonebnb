# class Listing < ApplicationRecord
class Listing < ActiveRecord::Base

# # Associations
 #  belongs_to :user
 #  # acts_as_bookable time_type: :range, bookable_across_occurrences: true


 #  scope :not_belonging_to_current_user, lambda { |current_user_id| 
 #    { :conditions => ["user_id != ?", current_user_id] }
 #  }

 #  scope :apply_full_search_criteria, lambda { |place, guests_count, check_in, check_out| 
 #    {
 #      :conditions => ["place = ? and maximum_guests >= ? and availability_from <= ? and availability_to >= ? ", place, guests_count, check_in, check_out]
 #    }
 #  }

 #  scope :apply_place_search_criteria, lambda { |place| 
 #    {
 #      :conditions => ["place = ?", place] 
 #    }
 #  }

 #  has_many :reservations,:dependent => :destroy

 #  # Validations
 #  validates_presence_of :name, :address, :price
 #  # validate :validate_availability

 #  #paperclip validation
 #  # validates_attachment_presence :snap

 #  def self.get_listings_for_search_attr(search_attr, current_user)
 #    if search_attr[:guests_count]!=nil && search_attr[:place]!=nil
 #      check_in = "#{search_attr["check_in(1i)"]}-#{search_attr["check_in(2i)"]}-#{search_attr["check_in(3i)"]}"
 #      check_out = "#{search_attr["check_out(1i)"]}-#{search_attr["check_out(2i)"]}-#{search_attr["check_out(3i)"]}"
 #      Listing.not_belonging_to_current_user(current_user).apply_full_search_criteria(search_attr[:place], search_attr[:guests_count], check_in, check_out)
 #    elsif search_attr[:place] != nil
 #      Listing.not_belonging_to_current_user(current_user.id).apply_place_search_criteria(search_attr[:place])
 #    else
 #      Listing.not_belonging_to_current_user(current_user.id)
 #    end
 #  end

 #  def self.validate_and_create(params, current_user)
 #    listing = current_user.listings.new(params[:listing])
 #    result = {}
 #    if listing.save
 #      result[:message] = "Listing was successfully created."
 #      result[:path] = listing
 #    else
 #      result[:message] = listing.errors.full_messages.to_sentence
 #      result[:path] = {:action => "new"}
 #      result[:error] = true
 #    end
 #    return result
 #  end

 #  def self.validate_and_update(params, listing, current_user)
 #    result = {}
 #    if listing.update_attributes(params[:listing])
 #      result[:message] = 'Listing was successfully updated.'
 #      result[:path] = listing
 #    else
 #      result[:message] = listing.errors.full_messages.to_sentence
 #      result[:path] = {:action => "edit"}
 #      result[:error] = true
 #    end
 #    return result
 #  end

 #  private

 #  def validate_availability
 #  	errors.add("Availability ") if self.availability_from >= self.availability_to
 #  end

# end

  # acts_as_bookable time_type: :range, bookable_across_occurrences: true
  
  # mount_uploaders :photos, PhotoUploader
  
  # require 'pg_search'
  # include PgSearch
  # multisearchable :against => [ :title, :description, :city, :country ]
  
  has_many :keyword_listings
  has_many :keywords, through: :keyword_listings
  has_many :listing_images
  accepts_nested_attributes_for :listing_images
  belongs_to :user
  
  scope :city, -> (city) { where( "city ILIKE :city", city: "%#{city}%" )}
  scope :price, -> (price) { where ( "price < ?" " #{price} ")}
  scope :guest_number, -> (guest_number) { where ( "guest_number >= ?" " #{guest_number} ")}
  scope :room_number, -> (room_number) { where ( "room_number >= ?" " #{room_number}" )}
  scope :bathrooms, -> (bathrooms) { where ("bathrooms >= ?" " #{bathrooms}")} 
    
    def self.search_cities(query)
      where("city ILIKE :city", city: "%#{query}%").distinct.map do |record|
        record.city
      end
    end
    
    def total_reviews
      Review.where(listing_id: self.id)
    end
    
    def rating
      rating = 0
      if total_reviews.count > 0
        total_reviews.each do |review|
          rating += review.rating
        end
        rating = rating / total_reviews.count
      end
    end
    
    def total_price(start_date, end_date)
      (self.price.to_i * booking_length(start_date, end_date)).to_i
    end
    
    def booking_length(start_date, end_date)
      end_date.to_date - start_date.to_date
    end
    
    def date_range(start_date, end_date)
      (start_date.to_date..end_date.to_date).map(&:to_s)
    end
    
    def update_listing_schedule
      current_listing.schedule = IceCube::Schedule.new(Date.today, duration: 365.days)
      current_listing.save
    end
    
    def date_within_bookable_range?(start_date, end_date)
      update_listing_schedule
      date_range(start_date, end_date).each do |date|
        if !current_listing.schedule.include?(date)
          false
        end
      end
      true
    end
  
    def is_available?(start_date, end_date)
      range_booking = date_range(start_date, end_date)
      # range_available = date_range(self.availability_from, self.availability_to)
      range.each do |date|
        date = date.to_date.strftime # Issue in different formats- converting to date then back to string gets all dates to same format
        if self.dates.include?(date)
          return false
        end
      true
      end
    end
    
    def reserve_dates(start_date, end_date)
      range = date_range(start_date, end_date)
      range.each do |date|
        self.dates << date
      end
      self.save
    end
    
    def host
      if self.user_id == nil
        "Mystery house!"
      else
        User.find(self.user_id).first_name
      end
    end
    
    def property_type      
      # property = Hash.new
      
      # subtype_id = Property.find(self.property_id).place_type_id
      # type_id = Property.find(self.property_id).property_type_id
      
      # subtype = PropertySubtype.find(subtype_id).subtype
      # type = PropertyType.find(type_id).property 
      
      # property[:subtype] = subtype
      # property[:type] = type
      
      # property
      
    end
  end