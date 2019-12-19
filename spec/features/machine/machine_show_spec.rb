require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a machine show page", type: :feature do
    before :each do
      @owner = Owner.create(  name: "Phil")

      @machine = @owner.machines.create(  location: "Denver")

      @snack_1 = @machine.snacks.create(  name: "Cheetos",
                                          price: 1
      )

      @snack_2 = @machine.snacks.create(  name: "Fretos",
                                          price: 2
      )

      visit "/machines/#{@machine.id}"
    end
    it "i see all snacks and each price" do
      expect(page).to have_content("#{@snack_1.name}")
      expect(page).to have_content("#{@snack_1.price}")
      expect(page).to have_content("#{@snack_2.name}")
      expect(page).to have_content("#{@snack_2.price}")
    end

    it "i see the average price of all snacks" do
      expect(page).to have_content("Avg snack price: #{@machine.avg_snack_price}")
    end
  end
end
