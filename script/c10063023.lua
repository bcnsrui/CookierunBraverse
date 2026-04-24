if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,2,2)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #ag==0 then return end
	local tc=ag:GetFirst()
	local opts={}
	local canatk=tc:IsAttackPos()
	local canhp=tc:GetOverlayCount()>=1
	if canatk then table.insert(opts,aux.Stringid(id,0)) end
	if canhp then table.insert(opts,aux.Stringid(id,1)) end
	if #opts==0 then return end
	local sel=Duel.SelectOption(tp,table.unpack(opts))
	if sel==0 and canatk then
		Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,tc,1)
	elseif sel==(#opts==2 and 1 or 0) and canhp then
		Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,tc,1)
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	end
end