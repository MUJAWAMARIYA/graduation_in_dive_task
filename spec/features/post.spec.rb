require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature " Post management function", type: :feature do
#  # In scenario (alias of it), write the processing of the test for each item you want to check
 background  do
  #  User.create!(email: 'm@gmail.Com',  password: '1234567')
  #    visit  root_path
    
  #     fill_in  'Email',  with: 'm@gmail.Com'
    
  #   # find('email', match: :first).set('m@gmail.com')
    
  #   fill_in  'Password' ,  with: '1234567'
   
  #   click_on  'Log in'
    
  # expect(page).to have_text('Signed in successfully.')
   
end
scenario "Test post list" do
 
  @posts=Post.all
  assert @posts

end

 # visit to tasks_path (transition to task list page)
# visit tasks_path
 # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
 scenario "Test post creation" do
  @post=Post.create(user_name: "web", country: "testtest", province: "mm", district:"jj", sector:"kkk",cell:"jjj",village:"hh",telephone_number:"07855433229", gender:"male", ID_number:"1123456789087654", lost_id_date_or_found_id_date:"22-03-2019", post_reason:"jjjj", confirmation:"true", property_name:"yyy")
  assert @post
 end

 it "Validation does not pass if country is empty" do
post= Post.new(user_name: 'web', country: '', province: "mm", district:"jj", sector:"kkk",cell:"jjj",village:"hh",telephone_number:"07855433229", gender:"male", ID_number:"1123456789087654", lost_id_date_or_found_id_date:"22-03-2019", post_reason:"jjjj", confirmation:"true", property_name:"yyy")
   expect(post).not_to be_valid
 end
 

 scenario "Test whether search button works" do
  visit  root_path
  if has_field?('email')
  fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   expect(page).to have_text('Signed in successfully.')
  
   Post.create(user_name: "web", country: "testtest")
  
   fill_in  '@q',  with: 'web'
  
  click_on "Search"
  expect(page).to have_content('web')
   visit  new_post_path
 end
end
 end