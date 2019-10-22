Given /^There is a page created by me$/ do
    u = College.new(:name => "Universidade Teste 001", :initials => "UT001", :city => "São Paulo", :state => "SP", :country => "Brasil", :unit => "Faculdade Teste 001", :user_id => @user.id, :background_color => "fafafa", :font_family => "Arial", :background_image => "", :font_color => "#000000")
    u.save

    @college = College.where(name: u.name, city: u.city, state: u.state, country: u.country, unit: u.unit).take
end

Given /^I am on the edit page settings page$/ do
    visit edit_college_path(@college, :id => @college.id)
end

When /^I fill the edit page settings form$/ do
    fill_in "college[background_color]", with: "#fafafa"
    fill_in "college[background_image]", with: ""
    fill_in "college[font_family]", with: "Arial"
    fill_in "college[font_color]", with: "#000000"
    select 'Manual', from: "college[admin_approves_spotted]"
    select 'Sim', from: "college[request_to_participate]"
end

When /^I click the Atualizar Edição de Página button$/ do
    click_button "Atualizar"
end

Then /^I should see the green success toast$/ do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
end

When /^I fill the edit page settings form including background_image field$/ do
    fill_in "college[background_color]", with: "#fafafa"
    fill_in "college[background_image]", with: "https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75"
    fill_in "college[font_family]", with: "Arial"
    fill_in "college[font_color]", with: "#000000"
    select 'Manual', from: "college[admin_approves_spotted]"
    select 'Sim', from: "college[request_to_participate]"
end

When /^I fill the edit page settings form except font_family field$/ do
    fill_in "college[background_color]", with: "#fafafa"
    fill_in "college[background_image]", with: "https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75"
    fill_in "college[font_family]", with: ""
    fill_in "college[font_color]", with: "#000000"
    select 'Manual', from: "college[admin_approves_spotted]"
    select 'Sim', from: "college[request_to_participate]"
end
  