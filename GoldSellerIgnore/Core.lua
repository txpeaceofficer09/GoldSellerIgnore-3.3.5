local filterList = {
	"gold",
	"cheap",
	"wts",
	"safe",
	"usd",
	"mmotradinghub"
}

--[[
local function ContainsWord(str, word)
	local arr = string.split(str, " ")

	for _, val in pairs(arr) do
		if val:lower() == word:lower() then
			print(val:lower().." = "..word:lower())
			return true
		else
			print(val:lower().." ~= "..word:lower())
		end
	end

	return false
end
]]

local function FilterGoldSeller(self, event, msg, sender, ...)
	local score = 0

	for _, keyword in pairs(filterList) do
		--if msg:lower():match("%f[%a]"..keyword.."%f[%A]") ~= nil then
		--if msg:lower():match("[^%a]" .. keyword .. "[^%a]") or msg:lower():match("^" .. keyword .. "[^%a]") or  msg:lower():match("[^%a]" .. keyword .. "$") or msg:lower() == keyword then
		if msg:lower():find(keyword) then
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
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", FilterGoldSeller)
