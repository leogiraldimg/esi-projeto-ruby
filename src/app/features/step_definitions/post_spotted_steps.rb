Given(/^I am on the new spotted page$/) do
    click_link("Novo spotted")
end

When(/^I fill the content spotted field with some information$/) do
    fill_in "spotted[content]", with: "Spotted Teste"
end

And(/^I click the Mandar spotted button$/) do
    click_button("Mandar spotted")
end

And(/^I should see my new spotted on the timeline$/) do
    expect(page).to have_xpath('.//div', text: "Spotted Teste")
end

# - - -

Given (/^I posted a spotted successfully on the college page$/) do
    steps %Q{
        Given I am on the new spotted page
        When I fill the content spotted field with some information
        And I click the Mandar spotted button
        Then I should see the college page
        And I should see my new spotted on the timeline
    }
end

Given (/^I posted a spotted successfully on my college page$/) do
    steps %Q{
        Given I am on the new spotted page
        When I fill the content spotted field with some information
        And I click the Mandar spotted button
        Then I should see my college page
        And I should see my new spotted on the timeline
    }
end