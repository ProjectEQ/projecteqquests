# items: 30055, 30032, 30056
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Outlander, hail. Share the fire. I have little but if you are in need then take what I have. If you need nothing then take nothing. Balix my name is. Shaman to the tribe of Snowfangs.");
  }
  if ($text=~/shaman/i) {
    quest::say("Yes, shaman. I listen to the land to tell my tribe what the winds and waters will bring. Good or bad. Little good and much bad these days. That is why I sit here listening.");
  }
  if ($text=~/listening/i) {
    quest::say("I am on spirit quest. No food do I take. All day I listen only. I wait until the land tells me how to help my tribe. Maybe nothing will happen but I cannot fail to try. Hard is this. Many dangerous creatures are near but none come close so far.");
  }
  if ($text=~/dangerous creatures/i) {
    quest::emote("growls under his breath.");
    quest::say("Most dangerous is the Garou. Evil spirit of the land. It was made from long dead wolf spirits when the tower spread its dark magics through the islands. It preys on the Snowfang. We have tried to hunt it but always it is too strong.");
  }
  if ($text=~/garou/i) {
    quest::say("If you want to try, you can hunt Garou. If you kill, spread its soul to the air for cleansing, then all is good. Its skin is powerful from the magics that made it. With a cougar's bone, fresh with the spirit of earth, I can make you powerful talisman in thanks for your service to Snowfangs.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30055 => 1, 30032 => 1)) {
    quest::emote("pulls its lips back as it scratches and cuts the skin, working it around the bloody puma bone.");
    quest::say("Good for hitting or for talisman. Powerful thing to hold. All Snowfang thank you. Now, all of us are safer.");
    quest::summonitem(30056); # Item: Garou Bone Club
    quest::faction(439, 10); # Faction: Snowfang Gnolls
    quest::exp(1000);
  }
}

# Quest by mystic414
