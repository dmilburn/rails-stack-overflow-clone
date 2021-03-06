require 'spec_helper'

feature 'Voting' do
  let(:user) { User.create(name: "username", password: 'password', password_confirmation: 'password')}
   let(:user2) { User.create(name: "username2", password: 'password', password_confirmation: 'password')}
  let!(:question) { Question.create(title: "question_title", body: "quesiton_body", user_id: user.id)}
  context "Signed in user can vote" do
    it "should allow a user to upvote a question" do
      stub_current_user(user)
      visit root_path
      click_on("Upvote")
      expect(page).to have_content "1"
    end
    it "should not allow the same user to vote on the same question again" do
      stub_current_user(user)
      visit root_path
      click_on("Upvote")
      expect(page).to have_content "1"
    end
    it "should allow a user to downvote a question" do
      stub_current_user(user2)
      visit root_path
       click_on("Downvote")
      expect(page).to have_content "0"
    end
    it "should not allow the same user to vote on the same question again" do
      stub_current_user(user2)
      visit root_path
      click_on("Downvote")
      expect(page).to have_content "0"
    end
  end
end