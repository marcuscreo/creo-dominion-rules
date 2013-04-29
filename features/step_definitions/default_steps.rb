Given /^there is a player named "(.*?)" with a speed of "(\d+)"$/ do |player,agility|
  set_player_agility(player,agility)
end

Given /^(.*?)" roles a "(\d+)"$/ do |player,role|
  set_player_timing(player,role)
end

When /^the players are sorted to take an action on a turn$/ do
  sort_players_by_timing
end

Then /^"(.*?)" is in position "(.*?)"$/ do |player, position|
  validate_player_position(player,position)
end

Given(/^"(.*?)" roles a "(.*?)" \#(\d+)\+(\d+)=(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"    \#(\d+)\+(\d+)=(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"      \#(\d+)\+(\d+)=(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # express the regexp above with the code you wish you had
end

Then(/^"(.*?)" is in position "(.*?)"      \#(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then(/^"(.*?)" is in position "(.*?)"         \#(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then(/^"(.*?)" is in position "(.*?)"       \#(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"   \#(\d+)\+(\d+)=(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"     \#(\d+)\+(\d+)=(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # express the regexp above with the code you wish you had
end

Given(/^a tie exists between "(.*?)" and "(.*?)"(\d+)"$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" rolls a "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"  \#(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"    \#last$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"     \#(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" roles a "(.*?)"       \#last$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^a tie exists between "(.*?)" and "(.*?)" for position "(.*?)"$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

