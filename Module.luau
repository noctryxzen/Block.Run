local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = (cloneref and clonefunction(cloneref) or function(x) return x end)(clonefunction(game.GetService)(game, n))
		return s[n]
	end
})

Block = {}
--// Check if Player is Blocked
function Block.IsBlocked(Player)
	GetService.VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
	task.wait(.5)
	for i, v in next, GetService.CoreGui.RobloxGui.SettingsClippingShield:GetDescendants() do
		if v.Name == "PlayerLabel" .. Player.Name then
			return not v:FindFirstChild("FriendStatus", true)
		end
	end
	return true
end

--// Block Player(s)
function Block.Run(Player)
	if Player then
		if Player == GetService.Players.LocalPlayer then return end
		if Block.IsBlocked(Player) == false then
			GetService.StarterGui:SetCore("PromptBlockPlayer", Player)
			task.wait(.2)
			local ___ = GetService.CoreGui:FindFirstChild("BlockingModalScreen")
			if ___ then
				___ = ___:FindFirstChild("3", true)
				if ___ then
					GetService.VirtualInputManager:SendMouseButtonEvent(___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42, 0, true, game, 0)
					GetService.VirtualInputManager:SendMouseButtonEvent(___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42, 0, false, game, 0)
					local ____ = 0
					repeat task.wait(.1) ____ += .1 until not GetService.CoreGui:FindFirstChild("BlockingModalScreen") or ____ >= 2
				end
			end
		end
	else
		local _ = GetService.Players:GetPlayers()
		if #_ == 1 and _[1] == GetService.Players.LocalPlayer then return end
		local Lock = Instance.new("ScreenGui")
		Lock.DisplayOrder = 2147483647
		Lock.IgnoreGuiInset = true
		Lock.Parent = gethui and gethui() or GetService.CoreGui.RobloxGui
		for i, v in next, _ do
			if v ~= GetService.Players.LocalPlayer then
				Block.Run(v)
			end
		end
		Lock:Destroy()
	end
end
return Block
