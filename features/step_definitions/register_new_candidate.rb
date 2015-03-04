# encoding: utf-8
#!/usr/bin/env ruby


When(/^I press button Sou Novo$/) do
  touch("Button id:'btNewUser'") 
  5.times {perform_action('drag', 99, 1, 50, 50, 5)}
  touch("Button id:'btSignupWithTelephone'")
end

And(/^I fill out the registration initial fields$/) do
  @phone_number = Faker::Base.numerify('1199#######').to_s
  @senhapadrao  = 'inicial1234'
  enter_text("android.widget.EditText id:'etPhoneNumber'", @phone_number)
  touch("EditText id:'etPassword'")
  keyboard_enter_text('inicial1234', id: 'etPassword')
  touch("EditText id:'etConfirmPassword'")
  keyboard_enter_text('inicial1234', id: 'etConfirmPassword')
  hide_soft_keyboard
  touch("Button id:'btConfirm'")
end

And(/^I fill the additional fields$/) do
  @candidate_name = Faker::Name.name
  @date = Faker::Date.backward(14)
  @date.strftime("%m/%d/1986")
  enter_text("android.widget.EditText id:'etName'", @candidate_name)
  hide_soft_keyboard
  query("RadioButton id:'rbMale'",:setChecked=>true)
end

And(/^I continued fill the additional fields$/) do
  @candidate_email = Faker::Internet.email
  touch("EditText id:'etEmail'")
  keyboard_enter_text(@candidate_email, id: 'etEmail')
  hide_soft_keyboard
  touch("EditText id:'etCep'")
  keyboard_enter_text('05433-001', id: 'etEmail')
  hide_soft_keyboard
  touch("Button id:'btConfirm'")
end

And(/^I finish register$/) do
  touch("Button id:'btFinish'")
  puts 'O número de telefone do candidato é' + @phone_number
  sleep 10
end

Then(/^I close the app$/) do
  query %(OverflowMenuButton)
  touch("ActionMenuPresenter$OverflowMenuButton")
  tap_mark('Sair')
  sleep 05
end

