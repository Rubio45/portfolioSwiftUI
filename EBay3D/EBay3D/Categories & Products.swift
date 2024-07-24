//
//  Categories & Products.swift
//  EBay3D
//
//  Created by Alex Diaz on 23/7/24.
//

import Foundation

struct Category: Identifiable {
    var name: String
    var image: String
    var id = UUID()
}


struct Product: Identifiable, Hashable {
    var name: String
    var image: String
    var id = UUID()
    var price: Float
    var description: String
    var category: String
    var ownerName: String
    var ownerImage: String
    var ownerEmail: String
    var ownerPhone: String
}

#if DEBUG

let categories = [
    Category(name: "Electronics", image: "laptopcomputer"),
    Category(name: "Clothes", image: "tshirt"),
    Category(name: "Books", image: "book"),
    Category(name: "Furnitures", image: "sofa"),
    Category(name: "Shoes", image: "shoe"),
    Category(name: "Children", image: "teddybear"),
    Category(name: "Home", image: "house"),
    Category(name: "Beauty", image: "beach.umbrella"),
    Category(name: "Sports", image: "dumbbell"),
    Category(name: "Pets", image: "pawprint"),
    Category(name: "Vehicles", image: "car"),
    Category(name: "Technology", image: "ipad.and.iphone"),
    Category(name: "Video Games", image: "gamecontroller"),
    Category(name: "Collection", image: "star")
]

let products = [
    Product(
        name: "Smart TV",
        image: "tv",
        price: 599.99,
        description: "High-definition smart TV with built-in streaming apps.",
        category: "Electronics",
        ownerName: "John Doe",
        ownerImage: "john_doe",
        ownerEmail: "john.doe@example.com",
        ownerPhone: "555-1234"
    ),
    Product(
        name: "Sofa",
        image: "sofa",
        price: 299.99,
        description: "Comfortable modern sofa with high-quality fabric.",
        category: "Furniture",
        ownerName: "Jane Smith",
        ownerImage: "jane_smith",
        ownerEmail: "jane.smith@example.com",
        ownerPhone: "555-5678"
    ),
    Product(
        name: "Bicycle",
        image: "bicycle",
        price: 499.99,
        description: "Mountain bike with 21-speed gear system and durable frame.",
        category: "Vehicles",
        ownerName: "Bob Johnson",
        ownerImage: "bob_johnson",
        ownerEmail: "bob.johnson@example.com",
        ownerPhone: "555-8765"
    ),
    Product(
        name: "Luxury Car",
        image: "carro",
        price: 18300.22,
        description: "Elegant and powerful car with advanced features.",
        category: "Vehicles",
        ownerName: "Alice Williams",
        ownerImage: "alice_williams",
        ownerEmail: "alice.williams@example.com",
        ownerPhone: "555-4321"
    ),
    Product(
        name: "Laptop",
        image: "laptop",
        price: 1200.00,
        description: "High-performance laptop suitable for gaming and work.",
        category: "Electronics",
        ownerName: "Charlie Brown",
        ownerImage: "charlie_brown",
        ownerEmail: "charlie.brown@example.com",
        ownerPhone: "555-6789"
    ),
    Product(
        name: "Dining Table",
        image: "dining_table",
        price: 450.75,
        description: "Spacious dining table made of solid wood.",
        category: "Furniture",
        ownerName: "Diana Prince",
        ownerImage: "diana_prince",
        ownerEmail: "diana.prince@example.com",
        ownerPhone: "555-9876"
    ),
        Product(
            name: "Gaming Chair",
            image: "gaming_chair",
            price: 199.99,
            description: "Ergonomic chair with adjustable features and high comfort.",
            category: "Furniture",
            ownerName: "Clark Kent",
            ownerImage: "clark_kent",
            ownerEmail: "clark.kent@example.com",
            ownerPhone: "555-1235"
        ),
        Product(
            name: "Smartphone",
            image: "smartphone",
            price: 899.99,
            description: "Latest model smartphone with high-resolution camera.",
            category: "Electronics",
            ownerName: "Bruce Wayne",
            ownerImage: "bruce_wayne",
            ownerEmail: "bruce.wayne@example.com",
            ownerPhone: "555-5432"
        ),
        Product(
            name: "Electric Scooter",
            image: "electric_scooter",
            price: 799.99,
            description: "Eco-friendly electric scooter with a long battery life.",
            category: "Vehicles",
            ownerName: "Diana Prince",
            ownerImage: "diana_prince",
            ownerEmail: "diana.prince@example.com",
            ownerPhone: "555-9876"
        ),
        Product(
            name: "4K Projector",
            image: "projector",
            price: 599.99,
            description: "High-definition 4K projector with multiple input options.",
            category: "Electronics",
            ownerName: "Tony Stark",
            ownerImage: "tony_stark",
            ownerEmail: "tony.stark@example.com",
            ownerPhone: "555-8765"
        ),
        Product(
            name: "Mountain Bike",
            image: "mountain_bike",
            price: 550.00,
            description: "Durable mountain bike with shock absorption system.",
            category: "Vehicles",
            ownerName: "Natasha Romanoff",
            ownerImage: "natasha_romanoff",
            ownerEmail: "natasha.romanoff@example.com",
            ownerPhone: "555-1236"
        ),
        Product(
            name: "Soundbar",
            image: "soundbar",
            price: 299.99,
            description: "Wireless soundbar with deep bass and surround sound.",
            category: "Electronics",
            ownerName: "Steve Rogers",
            ownerImage: "steve_rogers",
            ownerEmail: "steve.rogers@example.com",
            ownerPhone: "555-9877"
        ),
        Product(
            name: "Convertible Sofa",
            image: "convertible_sofa",
            price: 650.00,
            description: "Modern convertible sofa that turns into a bed.",
            category: "Furniture",
            ownerName: "Peter Parker",
            ownerImage: "peter_parker",
            ownerEmail: "peter.parker@example.com",
            ownerPhone: "555-4322"
        ),
        Product(
            name: "Electric Car",
            image: "electric_car",
            price: 35000.00,
            description: "Electric car with advanced features and long range.",
            category: "Vehicles",
            ownerName: "Bruce Banner",
            ownerImage: "bruce_banner",
            ownerEmail: "bruce.banner@example.com",
            ownerPhone: "555-6789"
        ),
        Product(
            name: "Smart Watch",
            image: "smart_watch",
            price: 299.99,
            description: "Smart watch with health tracking and notifications.",
            category: "Electronics",
            ownerName: "Wanda Maximoff",
            ownerImage: "wanda_maximoff",
            ownerEmail: "wanda.maximoff@example.com",
            ownerPhone: "555-5433"
        ),
        Product(
            name: "Coffee Table",
            image: "coffee_table",
            price: 150.00,
            description: "Stylish coffee table made of tempered glass.",
            category: "Furniture",
            ownerName: "Clint Barton",
            ownerImage: "clint_barton",
            ownerEmail: "clint.barton@example.com",
            ownerPhone: "555-8766"
        ),
        Product(
            name: "Motorcycle",
            image: "motorcycle",
            price: 12000.00,
            description: "High-speed motorcycle with advanced safety features.",
            category: "Vehicles",
            ownerName: "Thor Odinson",
            ownerImage: "thor_odinson",
            ownerEmail: "thor.odinson@example.com",
            ownerPhone: "555-6788"
        ),
        Product(
            name: "Wireless Earbuds",
            image: "wireless_earbuds",
            price: 149.99,
            description: "Noise-cancelling wireless earbuds with long battery life.",
            category: "Electronics",
            ownerName: "Scott Lang",
            ownerImage: "scott_lang",
            ownerEmail: "scott.lang@example.com",
            ownerPhone: "555-5434"
        ),
        Product(
            name: "Dining Set",
            image: "dining_set",
            price: 750.00,
            description: "Elegant dining set with six chairs and a large table.",
            category: "Furniture",
            ownerName: "Hope Van Dyne",
            ownerImage: "hope_van_dyne",
            ownerEmail: "hope.vandyne@example.com",
            ownerPhone: "555-1237"
        ),
        Product(
            name: "Electric Bicycle",
            image: "electric_bicycle",
            price: 1200.00,
            description: "Electric bicycle with pedal assist and long range.",
            category: "Vehicles",
            ownerName: "Sam Wilson",
            ownerImage: "sam_wilson",
            ownerEmail: "sam.wilson@example.com",
            ownerPhone: "555-4323"
        ),
        Product(
            name: "Laptop Stand",
            image: "laptop_stand",
            price: 49.99,
            description: "Adjustable laptop stand for better ergonomics.",
            category: "Electronics",
            ownerName: "Bucky Barnes",
            ownerImage: "bucky_barnes",
            ownerEmail: "bucky.barnes@example.com",
            ownerPhone: "555-9878"
        ),
        Product(
            name: "Recliner Chair",
            image: "recliner_chair",
            price: 400.00,
            description: "Comfortable recliner chair with adjustable features.",
            category: "Furniture",
            ownerName: "Carol Danvers",
            ownerImage: "carol_danvers",
            ownerEmail: "carol.danvers@example.com",
            ownerPhone: "555-8767"
        ),
        Product(
            name: "Hybrid Car",
            image: "hybrid_car",
            price: 25000.00,
            description: "Fuel-efficient hybrid car with advanced safety features.",
            category: "Vehicles",
            ownerName: "Nick Fury",
            ownerImage: "nick_fury",
            ownerEmail: "nick.fury@example.com",
            ownerPhone: "555-6787"
        ),
        Product(
            name: "Tablet",
            image: "tablet",
            price: 499.99,
            description: "High-resolution tablet with pen support.",
            category: "Electronics",
            ownerName: "T'Challa",
            ownerImage: "tchalla",
            ownerEmail: "tchalla@example.com",
            ownerPhone: "555-5435"
        ),
        Product(
            name: "Bookshelf",
            image: "bookshelf",
            price: 200.00,
            description: "Spacious bookshelf made of high-quality wood.",
            category: "Furniture",
            ownerName: "Stephen Strange",
            ownerImage: "stephen_strange",
            ownerEmail: "stephen.strange@example.com",
            ownerPhone: "555-4324"
        ),
        Product(
            name: "Sports Car",
            image: "sports_car",
            price: 50000.00,
            description: "High-performance sports car with luxurious features.",
            category: "Vehicles",
            ownerName: "Wade Wilson",
            ownerImage: "wade_wilson",
            ownerEmail: "wade.wilson@example.com",
            ownerPhone: "555-9879"
        ),
        Product(
            name: "Smart Light Bulb",
            image: "smart_light_bulb",
            price: 29.99,
            description: "Smart light bulb with customizable color settings.",
            category: "Electronics",
            ownerName: "Groot",
            ownerImage: "groot",
            ownerEmail: "groot@example.com",
            ownerPhone: "555-1238"
        ),
        Product(
            name: "Office Desk",
            image: "office_desk",
            price: 350.00,
            description: "Modern office desk with ample storage space.",
            category: "Furniture",
            ownerName: "Peter Quill",
            ownerImage: "peter_quill",
            ownerEmail: "peter.quill@example.com",
            ownerPhone: "555-8768"
        ),
]


#endif
