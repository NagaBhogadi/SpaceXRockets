//
//  MockNetworkManger.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 6/9/26.
//

// mock singleton
final class MockNetworkManager: Sendable, NetworkProtocol {
    static let sharedInstance = MockNetworkManager()
    private init() {}
    
    func getDataFromServer(for url: String) -> [Rocket] {
    var rocketList: [Rocket] = []

        let rocket1 = Rocket(
            name: "Falcon 1",
            id: 1,
            firstFlight: "2006-03-24",
            cost: "$6,700,000",
            country: "Marshall Islands",
            successRate: "40%",
            description: "Falcon 1 was SpaceX's first orbital rocket. It became the first privately developed liquid-fueled rocket to successfully reach Earth orbit in 2008, paving the way for future SpaceX launch vehicles.",
            rocketImage: "falcon1",
            mass:"8987656 lb",
            detailImage: ["falcon1_1", "falcon1_2", "falcon1_3", "falcon1_4"]
        )

        let rocket2 = Rocket(
            name: "Falcon 9",
            id: 2,
            firstFlight: "2010-06-04",
            cost: "$50,000,000",
            country: "United States",
            successRate: "98%",
            description: "Falcon 9 is a reusable two-stage rocket designed and manufactured by SpaceX. It is used to transport satellites, cargo, and astronauts to orbit and has become one of the most reliable launch vehicles in the world.",
            rocketImage: "falcon9",
            mass:"8987945 lb",
            detailImage: ["falcon9_1", "falcon9_2", "falcon9_3", "falcon9_4"]
        )

        let rocket3 = Rocket(
            name: "Falcon Heavy",
            id: 3,
            firstFlight: "2018-02-06",
            cost: "$90,000,000",
            country: "United States",
            successRate: "100%",
            description: "Falcon Heavy is one of the world's most powerful operational rockets. It consists of three Falcon 9 boosters strapped together and is capable of carrying heavy payloads into Earth orbit, the Moon, and beyond.",
            rocketImage: "falconHeavy",
            mass:"8987856 lb",
            detailImage: ["falconHeavy_1", "falconHeavy_2", "falconHeavy_3", "falconHeavy_4"]
        )

        let rocket4 = Rocket(
            name: "Starship",
            id: 4,
            firstFlight: "2021-12-01",
            cost: "$7,000,000",
            country: "United States",
            successRate: "100%",
            description: "Starship is SpaceX's next-generation fully reusable spacecraft and rocket system. It is designed for missions to Earth orbit, the Moon, Mars, and deep space, with the goal of making humanity a multiplanetary species.",
            rocketImage: "spaceShip",
            mass:"8987756 lb",
            detailImage: ["spaceShip_1", "spaceShip_2", "spaceShip_3", "spaceShip_4"]
        )

        rocketList.append(rocket1)
        rocketList.append(rocket2)
        rocketList.append(rocket3)
        rocketList.append(rocket4)
        

        return rocketList

    }
}
