//
//  ContentView.swift
//  Collective Nouns Practice
//
//  Created by Kenna Blackburn on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    
    let collectiveNouns = [
        "antelope": ["herd"],
        "flamingos": ["stand", "flamboyance"],
        "owls": ["parliament"],
        "ants": ["colony", "army"],
        "flies": ["swarm", "hatch", "business"],
        "oxen": ["team", "yoke"],
        "apes": ["shrewdness"],
        "foxes": ["skulk", "leash"],
        "oysters": ["bed"],
        "baboons": ["troop"],
        "frogs": ["army", "colony"],
        "parrots": ["pandemonium", "company"],
        "badgers": ["cete"],
        "geese": ["gaggle", "flock", "skein"],
        "partridges": ["covey"],
        "bass": ["shoal"],
        "giraffes": ["tower"],
        "peacocks": ["muster", "ostentation"],
        "bats": ["colony", "cloud", "cauldron"],
        "gnats": ["cloud", "horde"],
        "penguins": ["colony"],
        "bears": ["litter"],
        "goats": ["herd", "tribe", "trip"],
        "pheasants": ["nest", "nide", "bouquet"],
        "beavers": ["colony"],
        "goldfinches": ["charm"],
        "pigeons": ["flock", "flights"],
        "bees": ["swarm"],
        "goldfish": ["troubling"],
        "pigs": ["drift", "drove", "sounder", "litter", "team"],
        "boars": ["sounder"],
        "gorillas": ["band"],
        "ponies": ["string"],
        "buffaloes": ["gang", "obstinacy"],
        "grasshoppers": ["cloud"],
        "porcupines": ["prickle"],
        "camels": ["caravan"],
        "greyhounds": ["leach"],
        "rabbits": ["colony", "warren"],
        "caterpillars": ["army"],
        "hares": ["down", "husk"],
        "raccoons": ["gaze"],
        "cats": ["destruction"],
        "hawks": ["cast", "kettle"],
        "rats": ["colony", "pack", "swarm"],
        "cattle": ["herd", "drove"],
        "hippopotami": ["bloat", "thunder"],
        "rattlesnakes": ["rhumba"],
        "cheetahs": ["coalition"],
        "hogs": ["drift", "parcel"],
        "ravens": ["unkindness"],
        "chickens": ["clutch", "chattering"],
        "horses": ["team", "harras"],
        "rhinoceroses": ["crash"],
        "clams": ["bed"],
        "hounds": ["pack", "mute", "cry"],
        "sharks": ["shiver"],
        "cobras": ["quiver"],
        "hyenas": ["cackle"],
        "sheep": ["drove", "flock"],
        "colts": ["rag"],
        "jaguars": ["shadow"],
        "skunks": ["stench"],
        "cows": ["kine", "drove", "herd", "fold", "flink"],
        "jellyfish": ["smack", "brood"],
        "snakes": ["nest", "knot"],
        "coyotes": ["band"],
        "kangaroos": ["troop", "mob"],
        "sparrows": ["host"],
        "cranes": ["sedge"],
        "larks": ["ascension", "exaltation"],
        "squirrels": ["dray", "scurry"],
        "crocodiles": ["float", "bask"],
        "lemurs": ["conspiracy"],
        "starlings": ["murmuration"],
        "crows": ["murder"],
        "leopards": ["leap"],
        "stingrays": ["fever"],
        "deer": ["herd"],
        "lice": ["flock"],
        "storks": ["mustering"],
        "dogs": ["litter"],
        "lions": ["pride"],
        "swans": ["bevy", "lamentation", "wedge"],
        "dolphins": ["pod"],
        "locusts": ["plague", "cloud"],
        "tigers": ["ambush", "streak"],
        "donkeys": ["drove"],
        "magpies": ["tiding", "tittering"],
        "toads": ["knot", "knab"],
        "doves": ["dule"],
        "mallards": ["sord"],
        "trouts": ["hover"],
        "ducks": ["brace", "paddling", "team"],
        "manatees": ["aggregation"],
        "turkeys": ["gang", "posse", "rafter"],
        "eagles": ["convocation"],
        "mares": ["stud"],
        "turtles": ["bale", "nest"],
        "elephants": ["herd", "parade"],
        "martens": ["richness"],
        "vultures": ["venue"],
        "elk": ["gang", "herd"],
        "minnows": ["steam"],
        "wasps": ["pledge"],
        "emus": ["mob"],
        "moles": ["labour"],
        "weasels": ["colony", "gang", "pack"],
        "falcons": ["cast"],
        "monkeys": ["barrel", "cartload", "troop"],
        "whales": ["pod", "school", "gam"],
        "ferrets": ["business", "fesnyng"],
        "mules": ["pack", "barren", "span"],
        "wolves": ["pack", "route"],
        "finches": ["charm"],
        "nightingales": ["watch"],
        "wombats": ["wisdom"],
        "fish": ["school", " shoal", "run", "haul", "catch"],
        "otters": ["family", "romp", "raft"],
        "woodpeckers": ["descent"],
        "zebras": ["zeal"]
    ]
    
    @State var currentAnimal = "fish"
    @State var guess = ""
    @State var submittedGuess = ""
    @State var lastAnswer = ""
    @State var correctAnswers = 0
    @State var incorrectAnswers = 0
    
    var body: some View {
        VStack {
            HStack {
                Text(currentAnimal.capitalized)
                    .font(.largeTitle)
                    .bold()
                if submittedGuess != "" {
                    Button(action: {
                        submittedGuess = ""
                        currentAnimal = collectiveNouns.keys.randomElement()!
                    }, label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .imageScale(.large)
                    })
                }
            }
            if submittedGuess == "" {
                TextField("Collective Noun", text: $guess)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .onSubmit() {
                        if guess != "" {
                            submittedGuess = guess
                            guess = ""
                            if collectiveNouns[currentAnimal]!.contains(submittedGuess.lowercased()) {
                                lastAnswer = "correct"
                                correctAnswers += 1
                            } else {
                                lastAnswer = "incorrect"
                                incorrectAnswers += 1
                            }
                        }
                    }
            }
            Divider()
                .padding()
            HStack {
                Label(
                    title: { Text("\(correctAnswers)") },
                    icon: { Image(systemName: "hand.thumbsup.fill")
                            .foregroundStyle(.green)
                            .imageScale(.large)
                            .shadow(color: .green, radius: lastAnswer == "correct" ? 10 : 0)
                    }
                )
                Divider()
                    .padding(.horizontal)
                    .frame(height: 50)
                Label(
                    title: { Text("\(incorrectAnswers)") },
                    icon: { Image(systemName: "hand.thumbsdown.fill")
                            .foregroundStyle(.red)
                            .imageScale(.large)
                            .shadow(color: .red, radius: lastAnswer == "incorrect" ? 10 : 0)
                    }
                )
            }
            Divider()
                .padding()
            Text("Acceptable Answers")
                .font(.title2)
            LazyVStack {
                ForEach(collectiveNouns[currentAnimal]!, id: \.self) { answer in
                    if submittedGuess == "" {
                        Text(answer.capitalized)
                            .redacted(reason: .placeholder)
                    } else {
                        Text(answer.capitalized)
                    }
                }
            }
        }.padding()
    }
}
