require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature " Post management function", type: :feature do
#  # In scenario (alias of it), write the processing of the test for each item you want to check
 background  do
   User.create!(email: 'm@gmail.Com',  password: '1234567')
     visit  root_path
    
      fill_in  'Email',  with: 'm@gmail.Com'
    
    # find('email', match: :first).set('m@gmail.com')
    
    fill_in  'Password' ,  with: '1234567'
   
    click_on  'Log in'
    
  expect(page).to have_text('Signed in successfully.')
   
end
scenario "Test post list" do
 
   visit  new_post_path
  
   fill_in  'user_name' ,  with: 'grettings'
   
 
   fill_in  'country' ,  with: 'testtest'
   click_on 'Create  Post'
   expect(page).to have_content 'testtest'
   expect(page).to have_content 'grettings'

end

 # visit to tasks_path (transition to task list page)
# visit tasks_path
 # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
 scenario "Test post creation" do
 
  visit  new_post_path
 
  fill_in  'user_name' ,  with: 'grettings'
   
 
  fill_in  'country' ,  with: 'testtest'
   click_on 'Create Post'
   expect(page).to have_text('Post was successfully created.')
 end

 scenario "Test post details" do
  #  visit  root_path
  #  fill_in  'Email',  with: 'm@gmail.Com'
  #  fill_in  'Password',  with: '1234567'
  #  click_on  'Log in'
  #  expect(page ).to have_text('')
  visit  new_post_path

  fill_in  'user_name' ,  with: 'grettings'
   
 
  fill_in  'country' ,  with: 'testtest'
   click_on 'Create post'
   
   expect(page).to have_text('test')
 end

 it "Validation does not pass if the user_name is empty" do
   task = Post.new(user_name: '', country: 'Failure test')
   expect(post).not_to be_valid
 end
 it "Validation does not pass if country is empty" do
   task = Post.new(user_name: 'web', country: '')
   expect(post).not_to be_valid
 end
 
 it "validation passes If content is described in user_name and country "do
 
  visit  new_post_path
  
  
  fill_in  'user_name' ,  with: 'grettings'
   
 
  fill_in  'country' ,  with: 'testtest'
   click_on 'Create Post'
   # task = Task.new(title: 'Test', content: 'Failure test')
   expect(page).to have_text('Post was successfully created.')
 end


 scenario "Test whether search button works" do
  visit  root_path
  if has_field?('email')
  fill_in  'Email',  with: 'm@gmail.Com'
   fill_in  'Password' ,  with: '1234567'
   click_on  'Log in'
   expect(page).to have_text('Signed in successfully.')
  
   Post.create(user_name: "web", country: "testtest")
  
   fill_in  'term',  with: 'web'
  
  click_on "Search"
  expect(page).to have_content('web')
   visit  new_post_path
 end
end
 end