Given(/^a combat round is starting$/) do
  start_combat_round
end

Given(/^"(.*?)" joins the combat round with a "(.*?)" attribute of "(.*?)"$/) do |name, attribute, value|
  add_player_to_combat_round(name)
  set_attribute_for_player(name,attribute,value)
end


When(/^"(.*?)" rolls a "(.*?)" and receives a "(.*?)"$/) do |name, dice_size, roll|
  set_dice_roll_value(name,roll)
end

When(/^the timing order is calculated$/) do
  do_timing_order
end

Then(/^"(.*?)" is in position "(.*?)"$/) do |name, position|
  validate_player_position(name,position)
end