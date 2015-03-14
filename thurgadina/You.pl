# flavor dialogue during the seventh prayer shawl quest
# 
# this is the npc on live servers that responds to the player reciting prayer to brell.
# quest needed to be changed slightly since an untargetted npc will not respond
# to dialogue on the emu

sub EVENT_SIGNAL {
  if ($signal == 33) {
    quest::emote("can feel a strong presence beginning to take shape in the chapel. Perhaps you should recite the prayer again.");
  }
  elsif ($signal == 66) {
    quest::emote("sense a being of great power focusing its attention on you.");
  }
  elsif ($signal == 99) {
    quest::emote("have been inspired! Brell has heard your prayers and granted your request.");
  }
}

# EOF zone: thurgadina ID: 115230 NPC: You

