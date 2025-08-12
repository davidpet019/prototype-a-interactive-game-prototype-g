pragma solidity ^0.8.0;

contract InteractiveGamePrototypeGenerator {
    // Mapping of game IDs to their corresponding prototypes
    mapping (uint256 => GamePrototype) public gamePrototypes;

    // Event emitted when a new game prototype is generated
    event NewGamePrototype(uint256 gameId, string gameName, uint256[] mechanics, uint256[] assets);

    // Struct representing a game prototype
    struct GamePrototype {
        string name;
        uint256[] mechanics;
        uint256[] assets;
    }

    // Function to generate a new game prototype
    function generateGamePrototype(string memory _gameName, uint256[] memory _mechanics, uint256[] memory _assets) public {
        // Generate a unique game ID
        uint256 gameId = uint256(keccak256(abi.encodePacked(_gameName, block.timestamp)));

        // Create a new game prototype
        GamePrototype storage gamePrototype = gamePrototypes[gameId];
        gamePrototype.name = _gameName;
        gamePrototype.mechanics = _mechanics;
        gamePrototype.assets = _assets;

        // Emit event to notify of new game prototype
        emit NewGamePrototype(gameId, _gameName, _mechanics, _assets);
    }

    // Function to retrieve a game prototype by ID
    function getGamePrototype(uint256 _gameId) public view returns (string memory, uint256[] memory, uint256[] memory) {
        GamePrototype storage gamePrototype = gamePrototypes[_gameId];
        return (gamePrototype.name, gamePrototype.mechanics, gamePrototype.assets);
    }
}