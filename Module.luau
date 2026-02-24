local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = (cloneref and clonefunction(cloneref) or function(x) return x end)(clonefunction(game.GetService)(game, n))
		return s[n]
	end
})

getgenv().Block = {}
local IsMobile = GetService.UserInputService.TouchEnabled and not GetService.UserInputService.KeyboardEnabled

--// Check if Player is Blocked
function Block.IsBlocked(Player)
	if IsMobile then
		local MenuButton = GetService.CoreGui.RobloxGui:FindFirstChild("MenuButton", true)
		if MenuButton then
			GetService.VirtualInputManager:SendTouchEvent(0, 0, MenuButton.AbsolutePosition.X + MenuButton.AbsoluteSize.X / 2, MenuButton.AbsolutePosition.Y + MenuButton.AbsoluteSize.Y / 2)
			task.wait(.05)
			GetService.VirtualInputManager:SendTouchEvent(0, 1, MenuButton.AbsolutePosition.X + MenuButton.AbsoluteSize.X / 2, MenuButton.AbsolutePosition.Y + MenuButton.AbsoluteSize.Y / 2)
		end
	else
		GetService.VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
	end
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
					if IsMobile then
						GetService.VirtualInputManager:SendTouchEvent(0, 0, ___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42)
						task.wait(.05)
						GetService.VirtualInputManager:SendTouchEvent(0, 1, ___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42)
					else
						GetService.VirtualInputManager:SendMouseButtonEvent(___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42, 0, true, game, 0)
						GetService.VirtualInputManager:SendMouseButtonEvent(___.AbsolutePosition.X + ___.AbsoluteSize.X / 2, ___.AbsolutePosition.Y + ___.AbsoluteSize.Y / 2 + 42, 0, false, game, 0)
					end
					local ____ = 0
					repeat task.wait(.1) ____ += .1 until not GetService.CoreGui:FindFirstChild("BlockingModalScreen") or ____ >= 2
				end
			end
		end
	else
		local _ = GetService.Players:GetPlayers()
		if #_ == 1 and _[1] == GetService.Players.LocalPlayer then return end
		for i, v in next, _ do
			if v ~= GetService.Players.LocalPlayer then
				Block.Run(v)
			end
		end
	end
end
return Block
