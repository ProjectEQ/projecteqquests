sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::emote("gasps for air upon hearing your voice. 'Oh, you scared me! Try not to sneak up on people anymore ok?");
		}
	if($text=~/sister is worried/i)
		{
		quest::say("You talked to her? Surely she didn't come right out and say that though, that would get her removed from the Hand, and most definately the city. I am glad you were smart enough to read her emotions to see that she thought of me. It really makes my heart warm and gives me hope. It is difficult living here, we are under constant attack, and have no way to get food. I wish I had some [good news] for her.");
		}
	if($text=~/good news/i)
		{
		quest::say("Yeah, it looks grim to anyone in this aweful place. I wrote her this letter when i found out that I was being exiled, but did not get a chance to give it to her. If you want to risk it, you can take it to her. Make no mention it is from me. She is loyal to the city and would not want to be cast out because of me.");
		quest::summonitem(6269);
		}
}