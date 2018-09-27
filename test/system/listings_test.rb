require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Address", with: @listing.address
    fill_in "Bed Number", with: @listing.bed_number
    fill_in "City", with: @listing.city
    fill_in "Country", with: @listing.country
    fill_in "Description", with: @listing.description
    fill_in "Guest", with: @listing.guest
    fill_in "Name", with: @listing.name
    fill_in "Number", with: @listing.number
    fill_in "Place Type", with: @listing.place_type
    fill_in "Price", with: @listing.price
    fill_in "Property Type", with: @listing.property_type
    fill_in "Room Number", with: @listing.room_number
    fill_in "State", with: @listing.state
    fill_in "User", with: @listing.user_id
    fill_in "Zipcode", with: @listing.zipcode
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @listing.address
    fill_in "Bed Number", with: @listing.bed_number
    fill_in "City", with: @listing.city
    fill_in "Country", with: @listing.country
    fill_in "Description", with: @listing.description
    fill_in "Guest", with: @listing.guest
    fill_in "Name", with: @listing.name
    fill_in "Number", with: @listing.number
    fill_in "Place Type", with: @listing.place_type
    fill_in "Price", with: @listing.price
    fill_in "Property Type", with: @listing.property_type
    fill_in "Room Number", with: @listing.room_number
    fill_in "State", with: @listing.state
    fill_in "User", with: @listing.user_id
    fill_in "Zipcode", with: @listing.zipcode
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
