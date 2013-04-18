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



