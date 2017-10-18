function event_say(e)
  if (e.other:Class() == "Ranger") then
    local qglobals = eq.get_qglobals(e.other);
    if ( qglobals["ranger_epic15_pre"] == "9" ) then
      if (e.message:findi("hail")) then
        e.self:Say("Hello traveler. I hate to bother you while you are shopping, but have you seen a [" .. eq.say_link("young researcher") .. "]? She would be a wood elf, like me. She's younger than me, but she would look a lot like me. Have you seen her?");
      elseif (e.message:findi("young researcher")) then
        e.self:Say("Well, she's my little sister, Mera. She is a student here at the guild. She isn't a singer, she just doesn't have the voice for it, poor dear. She studies sound. She has some interesting ideas about how to make music sound better. She had just received a device from a gnome that he claimed could capture sound. It was some crazy jar with a gear on the top or something. Well, Mera left here in a rush after receiving the jar from a courier and hasn't been heard from since. I have nothing to offer you as payment, but you look like a kind person and an adventurer. If you see her, please send her home.");
      end
    end
  end
end
