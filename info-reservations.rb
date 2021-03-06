1 - Database (planning fields, associations)
  Fields
    - start_date
    - end_date
    - guests
    - total_price

  Relations
    - belongs_to_user 
    - belongs_to_listing 

2 - routing
3 - reservation creation
   - info
   - price
   - validations


Console
   - rails g migration create_reservation

a- migration.rb
  def change
    create table.....
    t.date :start_date, null:false
    t.date :end_date, null:false
    t.integer :guest, null:false
    t.integer :total_price, null:false

    t.belongs_to :user, null:false  # current_user
    t.belongs_to :listing, null:false # information through a form
  
    t.timestap
  end

b- Routs   (3000/rails/info/routes)
  one way ---- > get '/listing/:id/reservations/new' => 'reservations#new'
  
  better way---- >
	  resources :listings do 
	  	resources :reervations
	  end

c rails g model reservation
   reservations--- >
	   belongs_to :user
	   belongs_to :listings

	   validations

	   validate :start_date, presence:true
	   validate :end_date, presence:true

	   validate :check_dates
	   validate :check_before_today
	   validate :check_overlap

	   before_create :compute_total_price


	   def compute_total_price
         byebug
         lsiting_price = Listing.find(self.listing_id).price
         self.total_price = (self.end_date - self.start_date) * listing_price
	   end

	   def check_dates
	   		# consider todays date (cant be before
	   		if self.start_date > self.end_date
	   			error.add(:check_dates_error, "The start nust be before ending date")
	   		end
	   end

	   def check_overlap
	   	 # find all the reservations for current listing
	   	 # check against the new reservation
	   	 # if there are overlap --> error
	   	 # metod overlap 
	   end


   listings  --> has_many :reservations
   user ---> has_many :reservations

d rails g controller reservatios

e html form

 <% render 'reservations/booking_form' %>

 _booking_form.html.erb
  
   // local: true ----> no ajax (by default form_with uses ajax behaviour)

  <%= form_with scope: :reservation, url: listing_reservation_path(params[:id]), local: true do |f| %>


  <%= f.label :start_date %>
  <%= f.date_field :start_date  %>

  <%= f.label :end_date %>
  <%= f.date_field :end_date  %>

  <%= f.label :guests_number %>
  <%= f.number_field :guest  %>

  <%= f.submit 'Book now'  %>
  
  <% end %>

  another way
  <%= form_with model: [@listing, @reservation] do |f| %>
  <% end %>
  need to chang in listing_controller 
  def show
  @reservation = Reservation.new(reservation)
  end

  f Reservations controller

  def create
 	reservation = Reservation.new(reservation_param)
 	reservation.user_id = current_user.id
 	reservation.listing_id = params[:listing_id]

 	if reservation.save
 		redirect_to root_url
 	else
 		redirect_back(fallback_location: root_url)
 	end

 	total_price = 
  end

  private
  
  // allows all the params inside reservation and they are wrapped iside reservation
  def reservation_params
    byebug
  	params.require(:reservation).permit(:start_date, :end_date, :guest)
  end



# validate start_date < end_date
# validate no overlap booking

# reservation.errors.full_messages