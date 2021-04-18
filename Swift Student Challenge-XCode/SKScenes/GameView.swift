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
    var menuElements = [SKNode]()
    
    //Immediately after leveTimerValue variable is set, update label's text
    let timer = SKLabelNode(text: "The game starts right on!")
    var counter = 20 {
        didSet {
            self.timer.text = "Time left: \(self.counter) ⏳"
            if currentLevel >= 3{
                self.timer.text = "You are getting realy good at it 😉 \n Time: \(self.counter)"
            }
            if currentLevel >= 5{
                self.timer.text = "Omg you seem to be smarter than Siri \n Time: \(self.counter)"
                self.timer.fontSize = 24
            }
        }
    }
    
    override func sceneDidLoad() {
        self.size = CGSize(width: UIScreen.screenHeight, height: UIScreen.screenWidth)
        self.center = CGPoint(x: self.size.height / 2, y:  self.size.width / 2)
        timer.fontSize = 24
        timer.zPosition = 2
        timer.position = CGPoint(x: center!.x, y: center!.y + 150)
        addChild(timer)
        // 1 wait action
        let wait2Seconds = SKAction.wait(forDuration: 1)
        // 2 increment action
        let incrementCounter = SKAction.run { [weak self] in
            self!.counter -= 1
        }
        // 3. wait + increment
        let sequence = SKAction.sequence([wait2Seconds, incrementCounter])
        // 4. (wait + increment) forever
        let repeatForever = SKAction.repeatForever(sequence)
        
        // run it!
        run(repeatForever)
    }
    
    override func didMove(to view: SKView) {
        scoreLevelLabel = generateScoreLevelLabel(score: score, currentLevel: currentLevel)
        scoreLevelLabel.zPosition = 2
        addChild(scoreLevelLabel)
        levelUp()
        
    }
    
    func randomPersonPosition() -> CGPoint {
        let xPosition = CGFloat.random(in: 0...self.size.width-100)
        let yPosition = CGFloat.random(in: 0...self.size.height-100)
        print("Point: \(CGPoint(x: xPosition, y: yPosition))")
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    func linesCross(start1: CGPoint, end1: CGPoint, start2: CGPoint, end2: CGPoint) -> CGPoint? {
    // calculate the differences between the start and end X/Y positions for each of our points
    let delta1x = end1.x - start1.x
    let delta1y = end1.y - start1.y
    let delta2x = end2.x - start2.x
    let delta2y = end2.y - start2.y

    // create a 2D matrix from our vectors and calculate the determinant
    let determinant = delta1x * delta2y - delta2x * delta1y

    if abs(determinant) < 0.0001 {
        // if the determinant is effectively zero then the lines are parallel/colinear
        return nil
    }

    // if the coefficients both lie between 0 and 1 then we have an intersection
    let ab = ((start1.y - start2.y) * delta2x - (start1.x - start2.x) * delta2y) / determinant

    if ab > 0 && ab < 1 {
        let cd = ((start1.y - start2.y) * delta1x - (start1.x - start2.x) * delta1y) / determinant

        if cd > 0 && cd < 1 {
            // lines cross – figure out exactly where and return it
            let intersectX = start1.x + ab * delta1x
            let intersectY = start1.y + ab * delta1y
            return CGPoint(x: intersectX, y: intersectY)
        }
    }

    // lines don't cross
    return nil
    }
    func levelClear() -> Bool {
        var allLines = [Line]()
        
        for level in levels{
            allLines.append(contentsOf: level.lines)
        }
        for line in allLines {
            for other in allLines {
                if linesCross(start1: line.start, end1: line.end, start2: other.start, end2: other.end) != nil{
                    print(linesCross(start1: line.start, end1: line.end, start2: other.start, end2: other.end) as Any)
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
        currentLevel += 1
        self.isPaused = true
        for level in levels{
            for line in level.lines{
                line.line.removeFromParent()
            }
            for person in level.persons{
                person.removeFromParent()
            }
        }
        if currentLevel == 1{
            generateNewLevel(newIntrest: true)
            counter = 20
        }
        else if currentLevel % 2 == 1 && currentLevel != 1{
            //Menu
            let menu = DialogMenu()
            
            //Shadow
            let shadow = menu.addShadow(size: self.size)
            shadow.position = center!
            menuElements.append(shadow)
            addChild(shadow)
            
            //Background
            let background = menu.addBackground()
            background.position = center ?? CGPoint.zero
            menuElements.append(background)
            addChild(background)
            
            //Text
            let text = menu.addText()
            text.position = CGPoint(x: center!.x, y: center!.y+70)
            menuElements.append(text)
            addChild(text)
            
            //Divider
            let divider = menu.rectangleInside()
            divider.position = (CGPoint(x: center!.x, y: center!.y-20))
            menuElements.append(divider)
            addChild(divider)
            
            //Left side image
            let leftSideImage = menu.leftSideImage()
            leftSideImage.position = CGPoint(x: center!.x-110, y: center!.y+15)
            menuElements.append(leftSideImage)
            addChild(leftSideImage)
            
            //Left side button overlap
            let leftSideButtonOverlap = menu.leftSideButtonOverlap()
            leftSideButtonOverlap.position = CGPoint(x: center!.x, y: center!.y-125)
            menuElements.append(leftSideButtonOverlap)
            addChild(leftSideButtonOverlap)
            
            //Left side button label
            let leftSideButtonLabel = menu.leftSideButtonLabel()
            leftSideButtonLabel.position =  CGPoint(x: center!.x-110, y: center!.y-85)
            menuElements.append(leftSideButtonLabel)
            addChild(leftSideButtonLabel)
            
            //Right side image
            let rightSideImage = menu.rightSideImage()
            rightSideImage.position = CGPoint(x: center!.x, y: center!.y+15)
            menuElements.append(rightSideImage)
            addChild(rightSideImage)
            
            //Right side button overlap
            let rightSideButtonOverlap = menu.rightSideButtonOverlap()
            rightSideButtonOverlap.position = CGPoint(x: center!.x, y: center!.y-125)
            menuElements.append(rightSideButtonOverlap)
            addChild(rightSideButtonOverlap)
            
            //Right side button Label
            let rightSideButtonLabel = menu.rightSideButtonLabel()
            rightSideButtonLabel.position = CGPoint(x: center!.x+110, y: center!.y-75)
            menuElements.append(rightSideButtonLabel)
            addChild(rightSideButtonLabel)
        }
        else{
            generateNewLevel(newIntrest: false)
            counter = 20
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            for button in touchedNode{
                if button.name == "LeftButton"{
                    //left button action
                    generateNewLevel(newIntrest: false)
                    counter = 20
                    
                }
                else if button.name == "RightButton"{
                    //roght button action
                    generateNewLevel(newIntrest: true)
                    counter = 20
                }
            }
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
        redrawLines()
        self.checkMove()
        self.paintLines()
        print("touch ended")
        scoreLevelLabel.text = "Score: \(score) \n Current level: \(currentLevel)"
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if counter < 0 {
            self.isPaused = true
            self.timer.text = "You lost 😔"
        }
    }
    func redrawLines(){
        
        var lines = [Line]()
        
        for i in 0 ..< levels.count{
            lines.removeAll()
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
    }
    func checkMove() {
        //TODO: Zrobić animiację
        if levelClear() {
            score = currentLevel * counter
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
            }
            level = Level(persons: persons, lines: [], color: newColor )
            levels.append(level)
        }
        else if newIntrest == false {
            levels.removeLast()
            for _ in 1...(currentLevel + 4) {
                let person = SpriteKitClass.main.generateperson(toView: SKView(), location: randomPersonPosition(), scale: 0.15, color: existingColors.last!)
                person.physicsBody = SKPhysicsBody(rectangleOf: person.size)
                person.physicsBody?.affectedByGravity = false
                person.position = randomPersonPosition()
                person.name = existingColors.last
                persons.append(person)
            }
            level = Level(persons: persons, lines: [], color: existingColors.last ?? "IT")
            levels.append(level)
        }
        
        for element in menuElements{
            element.removeFromParent()
        }
        menuElements.removeAll()
        redrawLines()
        self.isPaused = false
        respawnPersons()
    }
    func respawnPersons(){
        for level in levels{
            for person in level.persons{
                removeFromParent()
                addChild(person)
            }
        }
    }
}

