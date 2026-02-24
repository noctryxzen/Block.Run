# Block

Blocks players in Roblox games using the built-in block UI. Supports blocking a specific player or all players in the server.

## Installation

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Block.Run/refs/heads/main/Module.luau"))()
```

---

## Function Options

| Function | Parameter | Description |
|----------|-----------|-------------|
| Block.Run | nil | Blocks all players in the server |
| Block.Run | Player | Blocks a specific player |
| Block.IsBlocked | Player | Checks if a player is already blocked |

---

## Example: Block All Players

```lua
Block.Run()
```

---

## Example: Block Specific Player

```lua
local Target = game:GetService("Players"):FindFirstChild("PlayerName")
Block.Run(Target)
```

---

## Example: Check if Player is Blocked

```lua
local Target = game:GetService("Players"):FindFirstChild("PlayerName")
print(Block.IsBlocked(Target)) -- true = already blocked, false = not blocked
```

---

## Example: Block on Player Added

```lua
game:GetService("Players").PlayerAdded:Connect(function(Player)
	Block.Run(Player)
end)
```
