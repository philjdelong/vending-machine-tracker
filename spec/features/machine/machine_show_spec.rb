require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a machine show page", type: :feature do
    before :each do
      @owner = Owner.create(  name: "Phil")

      @machine = @owner.machines.create(  location: "Denver")

      @snack_1 = @machine.snacks.create(  name: "Cheetos",
                                          price: 1
      )

      visit "/machines/#{@machine.id}"
    end
    it "i see all snacks and each price" do
      expect(page).to have_content("#{@snack_1.name}")
      expect(page).to have_content("#{@snack_1.price}")
      expect(page).to have_content("#{@snack_2.name}")
      expect(page).to have_content("#{@snack_2.price}")
    end
  end
end

# User Story 1 of 3
#
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
