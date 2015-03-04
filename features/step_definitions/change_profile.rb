# encoding: utf-8
#!/usr/bin/env ruby

When(/^I touch your job register$/) do
	tap_mark('Seu perfil')
	touch("* id:'btJob1'")
	sleep 05
end

And(/^I choose Area$/) do
	touch()  
end
