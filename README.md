# Cybbxxj - Match-3 Puzzle Game

A Godot-based match-3 puzzle game with multiple levels, obstacles, achievements, and engaging gameplay mechanics.

## About

Cybbxxj is a match-3 puzzle game built with Godot Engine featuring:
- Grid-based puzzle gameplay with interactive pieces
- Multiple obstacle types (ice, locks, concrete, slime)
- Progressive level system with varied challenges
- Booster power-ups to aid gameplay
- Score tracking and high score system
- Collections/achievements system
- Dialogue and story elements with Dialogic integration
- Sound effects and music system

## Project Structure

- **Scenes/** - Game scenes (menus, levels, UI panels, game elements)
- **Scripts/** - GDScript code for game logic and mechanics
- **art/** - Visual assets including backgrounds, characters, obstacles, pieces, and UI elements
- **Animation/** - Animation resources and effects
- **Sounds/** - Audio files for music and sound effects
- **Fonts/** - Custom font resources
- **addons/** - Godot plugins (Dialogic, Dialogue Manager)
- **dialogic/** - Dialogic dialogue/story system files

## Key Features

### Gameplay Mechanics
- **Match-3 System** - Classic match-three elimination mechanics
- **Obstacles** - Multiple obstacle types that add strategic depth:
  - Ice blocks that require multiple matches to break
  - Locks that must be eliminated
  - Concrete barriers
  - Slime that damages adjacent pieces
- **Boosters** - Power-ups to help clear the board
- **Level Progression** - Increasing difficulty through progressive levels

### Game Systems
- **Score Management** - Points tracking and high score records
- **Level System** - Move/timer-based level objectives
- **Collections** - Achievement/collection tracking system
- **Dialogue System** - Story and character interactions via Dialogic

## Getting Started

### Requirements
- Godot Engine 3.x
- GDScript knowledge for modifications

### Installation

1. Clone the repository:
```bash
git clone git@github.com:DeruL0/cybbxxj.git
```

2. Open the project in Godot Engine:
- Launch Godot Engine
- Click "Open Project"
- Navigate to the `cybbxxj` folder
- Click "Select Folder"

3. Run the game:
- Press `F5` or click the Play button in the Godot editor

## Game Scenes

### Main Scenes
- **Game_Start.tscn** - Main game board and play area
- **Game Menu.tscn** - Main menu interface
- **LevelSelectScene.tscn** - Level selection screen
- **Game Over Panel.tscn** - Game over/win screen
- **Collections.tscn** - Collections/achievements view
- **SettingsPanel.tscn** - Game settings

### UI Elements
- **BaseMenuPanel.tscn** - Reusable menu panel base
- **bottom_ui.tscn** - Bottom UI elements
- **top_ui.tscn** - Top UI elements
- **Pause.tscn** - Pause menu

### Game Elements
- **Piece.tscn** - Individual puzzle pieces
- **Goal.tscn** - Level objectives
- **Hnt_Scene.tscn** - Hint system
- **Animated Explosion.tscn** - Particle effects

## Key Scripts

- **GameManager.gd** - Main game state management
- **grid.gd** - Core grid and match-3 logic
- **Piece.gd** - Individual piece behavior
- **BoosterManager.gd** - Power-up system
- **ConfigManager.gd** - Game configuration
- **GameDataManager.gd** - Game data persistence
- **SoundManager.tscn** - Audio management

## Development

### Adding New Levels
1. Create a new level scene in `Scenes/levels/`
2. Configure level parameters in the GameManager
3. Add level-specific obstacles using the grid system

### Customizing Obstacles
Obstacle types are defined through the grid's exported variables:
- `empty_spaces` - Empty space positions
- `ice_spaces` - Ice obstacle positions
- `lock_spaces` - Lock obstacle positions
- `concrete_spaces` - Concrete obstacle positions
- `slime_spaces` - Slime obstacle positions
- `swirl_spaces` - Swirl obstacle positions

### Story and Dialogue
Use the Dialogic system to create character interactions and story events. Dialogue files are stored in the `dialogic/` directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues for bugs and feature requests.

## Credits

- Built with [Godot Engine](https://godotengine.org/)
- Uses [Dialogic](https://github.com/coppolaemilio/dialogic) for dialogue system
- Dialogue Manager integration for narrative sequences
