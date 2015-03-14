sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, young $race. It would seem you have found your way to your new and true home. I'm sure by now you've all but forgotten your past awnd even how you arrived here in Crescent Reach - the diamond in the mountains. As our newest family member, I urge you to familiarize yourself with your city. You should visit your guildmaster at the bottom of this path. Then, speak to Initiate Dakkan and Innkeeper Fathus for work. Dakkan has lots of work and Fathus will help you gain a goodly reputation with the Six -- our dragons -- so they will accept you as a true-blood drakkin. May Veeshan guide you always!");
    quest::taskselector(204);
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}