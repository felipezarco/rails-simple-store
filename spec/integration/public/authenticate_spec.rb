require "rails_helper"
describe "As an operator user", type: :request do
  let!(:department) { FactoryGirl.create(:department) }
  let!(:operator) { FactoryGirl.create(:operator, department_id: department.id) }
  let!(:user) { FactoryGirl.create(:user, operator_id: operator.id )}

  before(:each) { visit login_url }

  describe "I want to login" do
    context "whith valid information" do
      before :each do
        fill_in "name", with: user.name
        fill_in "password", with: user.password
      end
      it "log-in" do
        find('input[name="commit"]').click
        expect(current_path).to eq admin_path
      end
    end
    context "whith invalid information" do
      before :each do
        fill_in "name", with: "adminerrado"
        fill_in "password", with: "senhaerrada"
      end
      it "dones't log-in" do
         find('input[name="commit"]').click
         expect(current_path).to_not eq admin_path
      end
    end
  end
end
