loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Getter/refs/heads/main/GetFS.luau"))()
getgenv().Block = {}
function Block.IsBlocked(Player)
	for i, v in next, GetService.StarterGui:GetCore("GetBlockedUserIds") do
		if v == Player.UserId then return true end
	end
	return false
end
function Block.Run(Player)
	if Player then
		if Player == GetService.Players.LocalPlayer then return end
		if not Block.IsBlocked(Player) then
			GetService.StarterGui:SetCore("PromptBlockPlayer", Player)
			task.wait(.3)
			Screen = GetService.CoreGui:WaitForChild("BlockingModalScreen")
			if Screen then
				Screen = Screen:WaitForChild("3", true)
				if Screen then
					GetService.VirtualInputManager:SendTouchEvent(0, 0, Screen.AbsolutePosition.X + Screen.AbsoluteSize.X / 2, Screen.AbsolutePosition.Y + Screen.AbsoluteSize.Y / 2 + 42)
					task.wait(.1)
					GetService.VirtualInputManager:SendTouchEvent(0, 2, Screen.AbsolutePosition.X + Screen.AbsoluteSize.X / 2, Screen.AbsolutePosition.Y + Screen.AbsoluteSize.Y / 2 + 42)
					Elapsed = 0
					repeat task.wait(.1) Elapsed += .1 until not GetService.CoreGui:FindFirstChild("BlockingModalScreen") or Elapsed >= 2
				end
			end
		end
	else
		for i, v in next, GetService.Players:GetPlayers() do
			if v ~= GetService.Players.LocalPlayer then
				Block.Run(v)
			end
		end
	end
end
return Block
