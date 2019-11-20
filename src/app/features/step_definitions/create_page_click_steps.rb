Given (/^I am on the create new page page$/) do
    visit new_college_path
end

When (/^I fill the create new page form$/) do
    fill_in "college[name]", with: "Universidade Teste 001"
    fill_in "college[initials]", with: "UT001"
    fill_in "college[city]", with: "São Paulo"
    fill_in "college[state]", with: "SP"
    fill_in "college[country]", with: "Brasil"
    fill_in "college[unit]", with: "Faculdade Teste 001"
    fill_in "college[background_color]", with: "#fafafa"
    fill_in "college[font_family]", with: "Arial"
    fill_in "college[font_color]", with: "#000000"
    select 'Manual', from: "college[admin_approves_spotted]"
    select 'Não', from: "college[request_to_participate]"
end

When (/^I click the Cadastrar Nova Página button$/) do
    click_button "Cadastrar"
end

# - - -

Given(/^There is a college page created$/) do
    steps %Q{
        Given There is an unregistered user
    }
    u = College.new(:name => "Universidade Teste 002", :initials => "UT002", :city => "São Paulo", :state => "SP", :country => "Brasil", :unit => "Faculdade Teste 002", :user_id => @user.id, :background_color => "fafafa", :font_family => "Arial", :background_image => "", :font_color => "#000000", :request_to_participate => 0)
    u.save

    @college = College.find_by(initials: "UT002")
end

Given(/^I created a college page$/) do
    steps %Q{
        Given I am on the create new page page
        When I fill the create new page form
        And I click the Cadastrar Nova Página button
        Then I should see the initial user page
    }
    @college = College.find_by(initials: "UT001")
    
    
end