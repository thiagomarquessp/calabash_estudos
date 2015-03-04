# encoding: utf-8
#!/usr/bin/env ruby

When(/^I press button Ja sou cadastrado$/) do
  touch("Button id:'btRegisteredUser'")
end

And(/^I fill the login fields and press Entrar$/) do
  enter_text("android.widget.EditText id:'etPhoneNumber'", '11999303010')
  hide_soft_keyboard
  touch("EditText id:'etPassword'")
  enter_text("android.widget.EditText id:'etPassword'", 'inicial1234')
  hide_soft_keyboard
  touch("Button id:'btLoginWithPhone'")
  sleep 20
end