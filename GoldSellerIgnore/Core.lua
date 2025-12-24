local filterList = {
	"gold",
	"cheap",
	"wts",
}

local function FilterGoldSeller(self, event, msg, sender, ...)
	local score = 0

	--[[
	if msg:lower():match("cheap") and msg:lower():match("gold") and msg:lower():match("wts") then
		return true
	end
	]]

	foreach _, keyword in pairs(filterList) do
		if msg:lower():match(keyword) then
			score = score + 1
		end
	end

	if score >= 3 then
		return true
	end

	return false, msg, sender, ...
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", FilterGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", FilterGoldSeller)
