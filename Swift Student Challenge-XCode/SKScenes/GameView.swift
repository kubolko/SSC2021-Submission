//
//  GameView.swift
//  Swift Student Challenge-XCode
//
//  Created by Jakub Sumionka on 10/04/2021.
//

import SpriteKit
import CoreGraphics

class GameScene: SKScene {
    
    var scoreLevelLabel = SKLabelNode()
    var currentLevel = 0
    var score = 1
    var center : CGPoint?
    
    struct Level {
        var persons: [SKSpriteNode]
        var lines: [Line]
        var color: String
    }
    var levels = [Level]()
    
    override func sceneDidLoad() {
        self.size = CGSize(width: UIScreen.screenHeight, height: UIScreen.screenWidth)
        self.center = CGPoint(x: self.size.height / 2, y:  self.size.width / 2)
    }
    
    override func didMove(to view: SKView) {
        //        scoreLevelLabel = generateScoreLevelLabel(score: score, currentLevel: currentLevel)
        //        scoreLevelLabel.zPosition = 2
        //        addChild(scoreLevelLabel)
                levelUp()

    }
    
    func randomPersonPosition() -> CGPoint {
        let xPosition = CGFloat.random(in: 0...self.size.width-100)
        let yPosition = CGFloat.random(in: 0...self.size.height-100)
        print("Point: \(CGPoint(x: xPosition, y: yPosition))")
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    func levelClear() -> Bool {
        var allLines = [Line]()
        
        for level in levels{
            allLines.append(contentsOf: level.lines)
        }
            for line in allLines {
                for other in allLines {
                    if other.line.intersects(line.line) && line.start != other.end && line.end != other.start && line.line != other.line {
                        print("intersect")
                        return false
                    }
                }
            }
            return true
        }
    
    func paintLines() {
        var allLines = [Line]()
        
        for level in levels{
            allLines.append(contentsOf: level.lines)
        }
            for line in allLines {
                for other in allLines {
                    if other.line.intersects(line.line) && line.start != other.end && line.end != other.start && line.line != other.line {
                        print("intersect")
                        line.line.strokeColor = .red
                        line.line.fillColor = .red
                        other.line.strokeColor = .red
                        other.line.fillColor = .red
                    }
                }
            }
        }
    
    func levelUp() {
        
        if currentLevel % 2 == 1 && currentLevel != 1{
            //Menu
            let menu = DialogMenu()
            
            //Shadow
            let shadow = menu.addShadow(size: self.size)
            shadow.position = center!
            addChild(shadow)
            
            //Background
            let background = menu.addBackground()
            background.position = center ?? CGPoint.zero
            addChild(background)
            
            //Text
            let text = menu.addText()
            text.position = CGPoint(x: center!.x, y: center!.y+70)
            addChild(text)
            
            //Divider
            let divider = menu.rectangleInside()
            divider.position = (CGPoint(x: center!.x, y: center!.y-20))
            addChild(divider)
            
            //Left side image
            let leftSideImage = menu.leftSideImage()
            leftSideImage.position = CGPoint(x: center!.x-110, y: center!.y+15)
            addChild(leftSideImage)
            
            //Left side button overlap
            let leftSideButtonOverlap = menu.leftSideButtonOverlap()
            leftSideButtonOverlap.position = CGPoint(x: center!.x, y: center!.y-125)
            addChild(leftSideButtonOverlap)
            
            //Left side button label
            let leftSideButtonLabel = menu.leftSideButtonLabel()
            leftSideButtonLabel.position =  CGPoint(x: center!.x-110, y: center!.y-85)
            addChild(leftSideButtonLabel)
            
            //Right side image
            let rightSideImage = menu.rightSideImage()
            rightSideImage.position = CGPoint(x: center!.x, y: center!.y+15)
            addChild(rightSideImage)
            
            //Right side button overlap
            let rightSideButtonOverlap = menu.rightSideButtonOverlap()
            rightSideButtonOverlap.position = CGPoint(x: center!.x, y: center!.y-125)
            addChild(rightSideButtonOverlap)
            
            //Right side button Label
            let rightSideButtonLabel = menu.rightSideButtonLabel()
            rightSideButtonLabel.position = CGPoint(x: center!.x+110, y: center!.y-75)
            addChild(rightSideButtonLabel)
        }
        else{
            generateNewLevel(newIntrest: true)
        }
        self.removeAllChildren()
        for level in levels{
            for person in level.persons{
                addChild(person)
            }
        }
//        persons.removeAll()
//        for _ in 1...(currentLevel + 4) {
//            let person = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.5, color: "IT")
//            person.physicsBody = SKPhysicsBody(rectangleOf: person.size)
//            person.physicsBody?.affectedByGravity = false
//            person.position = randomPersonPosition()
//            person.name = "IT"
//            persons.append(person)
//            addChild(person)
//        }
//        repeat {
//            redrawLines()
//            for level in levels{
//                for person in level.persons{
//                person.position = randomPersonPosition()
//            }
//        }
//        }while levelClear()
        redrawLines()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for level in levels {
                for person in level.persons{
                    if touchedNode.contains(person) {
                    print("Touched")
                }
            }
        }
    }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //  print("touches moved")
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for node in levels {
                for person in node.persons{
                if touchedNode.contains(person) {
                    person.position = location
                    redrawLines()
                }
            }
        }
    }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.checkMove()
        self.paintLines()
        print("touch ended")
        scoreLevelLabel.text = "Score: \(score) \n Current level: \(currentLevel)"
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    func redrawLines(){
        
        var lines = [Line]()
        
        for i in 0 ..< levels.count{
            lines.removeAll()
            //Delete all the lines
//            if i == levels.count{
//                continue
//            }
                //else{
            for line in levels[i].lines{
                line.line.removeFromParent()
            }
            
            levels[i].lines.removeAll()
            //Clear the lines array
            
            //create new line
            for j in 0 ..< levels[i].persons.count {
                
                if j == levels[i].persons.count - 1 {
                    let line = Line(line: SpriteKitClass.main.drawLine(point1: CGPoint(x: levels[i].persons[j].position.x, y: levels[i].persons[j].position.y), point2: CGPoint(x: levels[i].persons[0].position.x, y: levels[i].persons[0].position.y), color: UIColor(named: levels[i].persons[j].name!)!), start: levels[i].persons[j].position, end: levels[i].persons[0].position)
                    lines.append(line)
                    addChild(line.line)
                } else {
                    let line = Line(line: SpriteKitClass.main.drawLine(point1: CGPoint(x: levels[i].persons[j].position.x+1, y: levels[i].persons[j].position.y+1), point2: CGPoint(x: levels[i].persons[j+1].position.x-1, y: levels[i].persons[j+1].position.y-1), color: UIColor(named: levels[i].persons[j].name!)!), start: levels[i].persons[j].position, end: levels[i].persons[j+1].position)
                    lines.append(line)
                    addChild(line.line)
                }
            }
            levels[i].lines = lines
        }
     //   }
    }
    func checkMove() {
        //TODO: Zrobić animiację
        if levelClear() {
            score += currentLevel * 2
            self.isUserInteractionEnabled = false
//            let fadeout = SKAction.fadeOut(withDuration: 0.5)
//            let fadein = SKAction.fadeIn(withDuration: 0.5)
//            let sequence = SKAction.sequence([fadeout,fadein])
//            for line in self.lines {
//                line.line.run(sequence)
//            }
//            for person in self.persons {
//                person.run(sequence)
//            }
            self.levelUp()
            self.isUserInteractionEnabled = true
        }
        else {
            score -= 1
        }
    }
    func generateScoreLevelLabel(score: Int, currentLevel: Int) -> SKLabelNode{
        let scoreLevelLabel = SKLabelNode()
        scoreLevelLabel.fontSize = 25
        scoreLevelLabel.text = "Score: \(score) \n Current level: \(currentLevel)"
        scoreLevelLabel.horizontalAlignmentMode = .center
        scoreLevelLabel.position = CGPoint(x: self.size.width/2, y: 25)
        return scoreLevelLabel
    }
    func generateNewLevel(newIntrest: Bool){
        
        var persons = [SKSpriteNode]()
        var level : Level
        var newColor: String
        var existingColors = [String]()
        
        for level in levels{
            existingColors.append(level.color)
        }
        
        if newIntrest{
            
            repeat{
                newColor = HobbiesString.randomElement()!
            }while existingColors.contains(newColor)
            
            for _ in 1...4 {
                let person = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.15, color: newColor)
                person.physicsBody = SKPhysicsBody(rectangleOf: person.size)
                person.physicsBody?.affectedByGravity = false
                person.position = randomPersonPosition()
                person.name = newColor
                persons.append(person)
                addChild(person)
            }
            level = Level(persons: persons, lines: [], color: newColor )
            levels.append(level)
        }
        else if newIntrest == false {
            levels.removeLast()
            for _ in 1...(currentLevel + 4) {
                let person = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.15, color: existingColors.last)
                person.physicsBody = SKPhysicsBody(rectangleOf: person.size)
                person.physicsBody?.affectedByGravity = false
                person.position = randomPersonPosition()
                person.name = existingColors.last
                persons.append(person)
                addChild(person)
            }
            level = Level(persons: persons, lines: [], color: existingColors.last ?? "IT")
            levels.append(level)
        }
        
    }
}

