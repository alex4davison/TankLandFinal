import Foundation

class TankWorld {
    var grid: [GameObject?] = []
    var turn : Int = 0
    
    init () {
        var emptyGrid: [GameObject?] = []
        var a = 1
        while a <= 225 {
            emptyGrid.append(nil)
            a += 1
        }
        grid = emptyGrid
    }
    
    func placeGO (go: GameObject) {
        grid[GameObject.locationInGrid(location: go.location)] = go
    }
    func removeGO (go: GameObject) {
        grid[GameObject.locationInGrid(location: go.location)] = nil
    }
    
    func occupiedElement (element: GameObject) -> (rowEnergy: String, rowID: String, rowLocation: String) {
        let rEnergy = fit(s: String(element.energy), size: 8, left: false)
        let rID = fit(s: element.identity, size: 7, left: true)
        let rLocation = fit(s: element.location.coordinates, size: 7, left: true)
        return(rowEnergy: "|\(rEnergy)", rowID: "| \(rID)", rowLocation: "| \(rLocation)")
    }
    
    func printGrid() -> String {
        var gridBuild = "_"
        var a = 0
        while a <= 134 {
            gridBuild.append("_")
            a += 1
        }
        gridBuild.append("\n")
        for c in 0...59 {
            for d in 0...14 {
                let currentElement = grid[(c / 4) * 15 + d]
                if currentElement == nil {
                    switch c % 4 {
                    case 0...2:
                        gridBuild.append("|        ")
                    default:
                        gridBuild.append("|________")
                    }
                } else {
                    switch c % 4 {
                    case 0:
                        gridBuild.append(occupiedElement(element: currentElement!).rowEnergy)
                    case 1:
                        gridBuild.append(occupiedElement(element: currentElement!).rowID)
                    case 2:
                        gridBuild.append(occupiedElement(element: currentElement!).rowLocation)
                    default:
                        gridBuild.append("|________")
                    }
                }
            }
            gridBuild.append("|\n")
        }
        return(gridBuild)
    }
    //func newPosition(position: Position, direction: Direction, magnitude: Int) -> NSPositionalSpecifier
    
    //func isGoodIndex(row: Int, col: Int) -> Bool
    
    //func isValidPosition(_position: Position) -> Bool
    
    func isPositionEmpty(_ position: Position) -> Bool {
        if grid[GameObject.locationInGrid(location: position)] == nil {
            return true
        } else {return false}
    }
    
    func isDead(_ gameObject: GameObject) -> Bool {
        if gameObject.energy <= 0 {
            return true
        } else { return false}
    }
    
    //func randomizeGameObject<T: GameObject>(gameObjects: [T]) -> [T]
    
    //func findGameObjectsWithinRange(_ position: Position, range: Int) -> [Position]
    
    func findAllGameObjects() -> [GameObject] {
        var gameObjects: [GameObject] = []
        for x in 0...14 {
            for y in 0...14 {
                if isPositionEmpty(Position(x: x, y: y)) == false{
                    gameObjects.append(grid[GameObject.locationInGrid(location: Position(x:x, y:y))]!)
                }
            }
        }
        return(gameObjects)
    }
    
    func findAllTanks() -> [Tank] {
        var allTanks = [Tank]()
        for a in findAllGameObjects() {
            if a.type == .tank {
                allTanks.append(a as! Tank)
            }
        }
        return(allTanks)
    }
    //func findAllRovers() -> [Mine]
    
    //func findFreeAdjacent(_ position: Position) -> Position?
    
    //func makeOffsetPosition(position: Position, offsetRow: Int, offsetCol: Int) -> Position?
    
    //func getLegalSurroundingPositions(_ position: Position) -> [Position]
    
    func getRandomDirection() -> Direction {
        let rand = Int(arc4random_uniform(8))
        switch rand {
        case 0:
            return .north
        case 1:
            return .ne
        case 2:
            return .east
        case 3:
            return .se
        case 4:
            return .south
        case 5:
            return .sw
        case 6:
            return .west
        case 7:
            return .nw
        default:
            return .east
        }
    }
    
    func isEnergyAvailable(_ gameObject: GameObject, amount: Int) -> Bool {
        if gameObject.energy < amount {
            return false
        } else { return true}
    }
    
    //func findWinner() -> Tank?
    
    func distance(_ p1: Position, _ p2: Position) -> Int {
        var distance = 0.0
        let xDist = (p1.x - p2.x)
        let yDist = (p1.y - p2.y)
        let addEmUp = xDist*xDist + yDist*yDist
        distance = sqrt(Double(addEmUp))
        return Int(distance)
    }
    
    func doTurn () {
        var allObjects: [GameObject] {
            var allBuild: [GameObject] = []
            for g in grid {
                if let h = g {
                    allBuild.append(h)
                }
            }
            return(allBuild)
        }
        for g in findAllTanks() {
            g.shields = 0
        }
        turn += 1
    }
    
    func runOneTurn () {
        doTurn()
        print(printGrid())
    }
    
}
