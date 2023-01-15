function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, e.self:GetCleanName() .. " looks to you with eternal eyes. 'I am most impressed with your skill and courage. This pass has not been for the weak-willed for quite some time. My kin and I have hope that perhaps you and your party can hold fast and bring forth some sort of justice to those that have done this to us. Go forth with our blessing. The top of the pass is heavily guarded, but there is a key. I trust that you shall find it. Make haste!'")
  end
end
