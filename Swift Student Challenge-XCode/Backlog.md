#Backlog


TODO:
-Naprawić nawigację
-naprawić guziki
-Dodać parametr kolor do generuj postać

Gra:
-Zrobić scrollowanie po mapce
-Zrobić randomowe generowanie postaci


https://stackoverflow.com/questions/38865788/moving-camera-in-spritekit-swift

func linesCross(start1: CGPoint, end1: CGPoint, start2: CGPoint, end2: CGPoint) -> (x: CGFloat, y: CGFloat)? {
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
        return (intersectX, intersectY)
    }
}

// lines don't cross
return nil
}

