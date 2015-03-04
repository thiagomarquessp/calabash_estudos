Then(/^I enter a phone number$/) do
  enter_text("android.widget.EditText id:'etPhoneNumber'", generate_random_phone_number())
end

Then(/^I enter a name$/) do
  enter_text("android.widget.EditText id:'etName'", generate_random_name())
end

Then(/^I set the date "(.*?)" into field with id "(.*?)"$/) do |date, widgetId|
  tap_when_element_exists("android.widget.EditText id:'etBirthDate'")
  sleep 0.1
  if defined? set_date
    set_date("android.widget.DatePicker id:'datePicker'", date.to_i, "04".to_i, "01".to_i)
  else
    set_date_fallback("android.widget.DatePicker id:'datePicker'", date.to_i, "04".to_i, "01".to_i)
  end
  tap_when_element_exists("* {text CONTAINS[c] 'Ok'}")
end

Then(/^I enter a email$/) do
  enter_text("android.widget.EditText id:'etEmail'", generate_random_email())
end

Then(/^I press "(.*?)" list option$/) do |option|
  sleep 1
  tap_when_element_exists("android.widget.ListView index:0 TextView {text CONTAINS[c] '#{option}' index:0}")

end

def generate_random_phone_number
  area_code = "11"
  first_two_digits = "99"
  random_part = 7.times.map { Random.rand(1...10) }
  area_code + first_two_digits + random_part.join
end

def generate_random_name
  "Calabash Child #" + 11.times.map{ Random.rand(1..10) }.join
end

def generate_random_email
  "dev.calabashchild" + 11.times.map{ Random.rand(1..10) }.join + "@empregoligado.com.br"
end

def set_date_fallback(query_string, year, month, day)
  wait_for_element_exists(query_string)
  query(query_string, updateDate: [year, month-1, day])
end
