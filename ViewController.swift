//
//  ViewController.swift
//  Planet
//
//  Created by Owner on 7/14/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {
   
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let sun = SCNNode(geometry: SCNSphere(radius: 1))
        let earthParent = SCNNode()
        let venusParent = SCNNode()
        let moonParent = SCNNode()
        let mercuryParent = SCNNode()
        let marsParent = SCNNode()
        let jupitarParent = SCNNode()
        let saturnParent = SCNNode()
        let uranusParent = SCNNode()
        let neptuneParent = SCNNode()
        
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sun.position = SCNVector3(0,0,-1)
        earthParent.position = SCNVector3(0,0,-1)
        venusParent.position = SCNVector3(0,0,-1)
        moonParent.position = SCNVector3(3 ,0 ,0)
        mercuryParent.position = SCNVector3(0,0,-1)
        marsParent.position = SCNVector3(0,0,-1)
        jupitarParent.position = SCNVector3(0,0,-1)
        saturnParent.position = SCNVector3(0,0,-1)
        uranusParent.position = SCNVector3(0,0,-1)
        neptuneParent.position = SCNVector3(0,0,-1)
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupitarParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)
        
        
        let earth = planet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth specular"), emission: #imageLiteral(resourceName: "Earth emission"), normal: #imageLiteral(resourceName: "Earth normal"), position: SCNVector3(3 ,0 ,0))
        let venus = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Venus surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus atmosphere"), normal: nil, position: SCNVector3(2, 0 ,0))
        let moon = planet(geometry: SCNSphere(radius: 0.04), diffuse: #imageLiteral(resourceName: "moon Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -0.6))
        let mercury = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Mercury surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.5, 0 ,0))
        let mars = planet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Mars surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.5, 0 ,0))
        let jupitar = planet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Jupitar surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(5, 0 ,0))
        let saturn = planet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Saturn surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(6, 0 ,0))
        let uranus = planet(geometry: SCNSphere(radius: 0.4), diffuse: #imageLiteral(resourceName: "Uranus"), specular: nil, emission: nil, normal: nil, position: SCNVector3(7, 0 ,0))
        let neptune = planet(geometry: SCNSphere(radius: 0.4), diffuse: #imageLiteral(resourceName: "Neptune"), specular: nil, emission: nil, normal: nil, position: SCNVector3(8, 0 ,0))
        
        
        
        
        let sunAction = Rotation(time: 8)
        let neptuneParentRotation = Rotation(time: 25)
        let uranusParentRotation = Rotation(time: 24)
        let saturnParentRotation = Rotation(time: 22)
        let jupitarParentRotation = Rotation(time: 20)
        let marsParentRotation = Rotation(time: 18)
        let earthParentRotation = Rotation(time: 14)
        let venusParentRotation = Rotation(time: 10)
        let mercuryParentRotation = Rotation(time: 6)
        let mercuryRotation = Rotation(time: 8)
        let earthRotation = Rotation(time: 8)
        let moonRotation = Rotation(time: 6)
        let venusRotation = Rotation(time: 8)
        let marsRotation = Rotation(time: 8)
        let jupitarRotation = Rotation(time: 8)
        let saturnRotation = Rotation(time: 8)
        let uranusRotation = Rotation(time: 8)
        let neptuneRotation = Rotation(time: 8)
        
        
        neptune.runAction(neptuneRotation)
        neptuneParent.runAction(neptuneParentRotation)
        uranus.runAction(uranusRotation)
        uranusParent.runAction(uranusParentRotation)
        saturn.runAction(saturnRotation)
        saturnParent.runAction(saturnParentRotation)
        jupitar.runAction(jupitarRotation)
        jupitarParent.runAction(jupitarParentRotation)
        mars.runAction(marsRotation)
        marsParent.runAction(marsParentRotation)
        mercury.runAction(mercuryRotation)
        mercuryParent.runAction(mercuryParentRotation)
        venus.runAction(venusRotation)
        venusParent.runAction(venusParentRotation)
        earth.runAction(earthRotation)
        earthParent.runAction(earthParentRotation)
        moonParent.runAction(moonRotation)
        
        
        sun.runAction(sunAction)
        neptuneParent.addChildNode(neptune)
        uranusParent.addChildNode(uranus)
        saturnParent.addChildNode(saturn)
        jupitarParent.addChildNode(jupitar)
        marsParent.addChildNode(mars)
        mercuryParent.addChildNode(mercury)
        earthParent.addChildNode(earth)
        earthParent.addChildNode(moonParent)
        venusParent.addChildNode(venus)
        earth.addChildNode(moon)
        moonParent.addChildNode(moon)
        
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }
        
    func Rotation(time: TimeInterval) -> SCNAction {
        let Rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadius), z:0, duration: time)
        let foreverRotation = SCNAction.repeatForever(Rotation)
        return foreverRotation
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Int {
    
    var degreesToRadius: Double { return Double(self) * .pi/180}
}

