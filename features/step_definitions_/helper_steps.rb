When(/^I swipe screen right$/) do
  perform_action('drag', 99, 1, 50, 50, 5)
end

Then(/^I press "(.*?)" list option debug$/) do |arg1|
  sleep 5
  element = query("android.widget.ListView index:0 TextView {text CONTAINS[c] '#{arg1}'}")
  raise element.inspect
end
