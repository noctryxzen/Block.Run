local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = (cloneref and clonefunction(cloneref) or function(x) return x end)(clonefunction(game.GetService)(game, n))
		return s[n]
	end
})

Block = {}
function Block.Run()
	local Players = GetService.Players:GetPlayers()
	if #Players == 1 and Players[1] == GetService.Players.LocalPlayer then return end
	for i, v in Players do
		if v ~= GetService.Players.LocalPlayer then
			GetService.StarterGui:SetCore("PromptBlockPlayer", v)
			task.wait(.5)
			if not GetService.CoreGui:FindFirstChild("BlockingModalScreen") then return end
			GetService.VirtualInputManager:SendMouseButtonEvent(GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsolutePosition.X + GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsoluteSize.X / 2, GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsolutePosition.Y + GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsoluteSize.Y / 2 + 42, 0, true, game, 0)
			GetService.VirtualInputManager:SendMouseButtonEvent(GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsolutePosition.X + GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsoluteSize.X / 2, GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsolutePosition.Y + GetService.CoreGui.BlockingModalScreen.BlockingModalContainer.BlockingModalContainerWrapper.BlockingModal.AlertModal.AlertContents.Footer.Buttons["3"].AbsoluteSize.Y / 2 + 42, 0, false, game, 0)
			task.wait(.5)
			break
		end
	end
end
return Block
