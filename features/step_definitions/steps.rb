require "selenium-webdriver"
require "json"
require "rest_client"


Given /^the application data form is opened$/ do
  @driver = Selenium::WebDriver.for :firefox
  @driver.navigate.to "http://localhost:8080"
end                                                                                                                                                                                            

When /^the insurance clerk enters following information$/ do |values|
  row = values.hashes[0]
  enter_value('salary', row["Salary"])
  enter_value('firstEmploymentStartDate', row["First employment start date"])
end 

When /^submits the form$/ do
  find_by_id('submit').click
  sleep(1)
end       

When /^accepts the data$/ do
  @response = RestClient.post 'http://localhost:8080/api', @valid_data
end       

Given /^the insurance clerk has given valid data$/ do
  @valid_data = { :salary => '9600', :firstEmploymentStartDate => '1.2.2010' }
end            

When /^she gives (.*) as first employment start date$/ do |first_employment_start_date|
  @valid_data[:firstEmploymentStartDate] =  first_employment_start_date
end 

When /^she gives (.*) as salary$/ do |salary|
  @valid_data[:salary] = salary
end          
                                                                                                                                                                                          
Then /^incomplete application is created$/ do
  id = find_by_id('savedApplicationId').text
  @driver.quit                                                                                                                                               
  saved_status = read_db_entry(id)["status"]
  saved_status.should == "1"
end  

Then /^the result is (.*)$/ do |expected_response_status|
  response_status = JSON.parse(@response)["status"]
  response_status.should == expected_response_status
end

def read_db_entry(id) 
  entry = IO.read("db/" + id)
  JSON.parse(entry)
end

def find_by_id(id)
  @driver.find_element(:id, id) 
end   

def enter_value(id, value)
  find_by_id(id).send_keys value
end 