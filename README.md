# Fruitbowl Hats v2

A datapack for Minecraft 1.21.11 (Fabric) that renders 3D custom models on helmets when they have a CustomModelData value set.

## How It Works

Uses an **armor stand shuttle** technique to modify item components in-place:

1. When a player wears a helmet with a non-zero `custom_model_data`, the datapack spawns an invisible armor stand
2. Copies the helmet to the armor stand's hand
3. Strips the `asset_id` from the `equippable` component — this makes the game render the **3D item model** (from the CMD dispatch) instead of the flat armor texture layer
4. Tags the item with `custom_data:{fruitbowl_hat:true}` so it only processes once
5. Copies the modified helmet back and kills the armor stand

The helmet **stays a helmet** — durability, enchantments, and armor stats all work normally. When the CMD is removed or set to 0, the datapack reverts the helmet to vanilla rendering.

## Requirements

- **Fruitbowl resource pack** with CMD dispatch entries on helmet item types (synced from `stone_button` via `sync_helmets()` in fruitbowl-tool)
- **Custom Roleplay Data** datapack (for `/trigger CustomModelData` support)

## Commands

### Hat System (automatic)
No commands needed — just equip a helmet and set its CMD with `/trigger CustomModelData set <value>`. The 3D model appears automatically.

To revert, set CMD back to 0: `/trigger CustomModelData set 0`

### Glint Toggle
Remove or restore the enchantment glint on any held item:

- `/trigger glint set 1` — **Disable** enchantment glint on held item
- `/trigger glint set 2` — **Enable** (restore) enchantment glint on held item

## File Structure

```
fruitbowl_hats/
├── pack.mcmeta
├── README.md
└── data/fruitbowl_hats/
    ├── function/
    │   ├── tick.mcfunction        # Main tick loop
    │   ├── load.mcfunction        # Init scoreboard objectives
    │   ├── check.mcfunction       # Per-player helmet state check
    │   ├── apply.mcfunction       # Armor stand shuttle: strip asset_id, tag item
    │   ├── revert.mcfunction      # Armor stand shuttle: restore vanilla equippable
    │   ├── glint_off.mcfunction   # Remove glint from held item
    │   └── glint_on.mcfunction    # Restore glint on held item
    └── tags/item/
        └── helmets.json           # All vanilla helmet types
```

## Technical Notes

- **3D models on head slot only**: This is a Minecraft limitation. Only the head equipment slot renders 3D item models — chest/legs/feet only support flat equipment textures.
- **Armor stand shuttle**: Required because you can't directly modify item components on a player's inventory. The armor stand exists for a single tick.
- **CMD dispatch sync**: The `sync_helmets()` function in fruitbowl-tool copies the `stone_button` dispatch file to all helmet types, so any hat model added to stone_button automatically works on all helmets.
- **One-time processing**: The `fruitbowl_hat:true` custom_data tag prevents the shuttle from running every tick. It only fires once when a helmet with CMD is first equipped.
- **Vanilla revert**: When CMD is removed or set to 0, the datapack restores the original `asset_id` for the helmet type so the normal armor texture renders again.

## Compatibility

- Minecraft 1.21.11
- Fabric (tested with loader 0.18.2)
- Works alongside Custom Roleplay Data datapack
- Inspired by [ModelApplier](https://modrinth.com/datapack/modelapplier) by Ewan Howell
