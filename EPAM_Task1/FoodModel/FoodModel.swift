import UIKit.UIImage

//Модель предназначена для генерации списка блюд или получения информации о них из сети
final class FoodModel {

    static func fetchFood() -> [Food] {
        
        let neopolitanPizza = Food(country: "🇮🇹Italy", title: "Neapolitan pizza", image: UIImage(named: "neapolitanPizza"), description: "Neapolitan pizza also known as Naples-style pizza, is a style of pizza made with tomatoes and mozzarella cheese. It must be made with either San Marzano tomatoes or Pomodorino del Piennolo del Vesuvio, which grow on the volcanic plains to the south of Mount Vesuvius, and Mozzarella di Bufala Campana, a protected designation of origin cheese made with the milk from water buffalo raised in the marshlands of Campania and Lazio in a semi-wild state, or Mozzarella STG, a cow's milk mozzarella.", price: nil, rating: 4.4)

        let philadelphiaRoll = Food(country: "🌎 International", title: "Philadelphia roll", image: UIImage(named: "philadelphiaRoll"), description: "A Philadelphia roll is a makizushi (also classified as a kawarizushi) type of sushi generally made with smoked salmon, cream cheese, and cucumber. It can also include other ingredients, such as other types of fish, avocado, scallions, and sesame seed.", price: 4.5232, rating: 0)

        let macAndCheese = Food(country: "🇺🇸 USA", title: "Mac & Cheese", image: UIImage(named: "macAndCheese"), description: "Macaroni and cheese—also called mac 'n' cheese in the United States, and macaroni cheese in the United Kingdom—is a dish of cooked macaroni pasta and a cheese sauce, most commonly cheddar. It can also incorporate other ingredients, such as breadcrumbs or meat. \n Traditional macaroni and cheese is a casserole baked in the oven; however, it may be prepared in a sauce pan on top of the stove or using a packaged mix. The cheese is often first incorporated into a Béchamel sauce to create a Mornay sauce, which is then added to the pasta. In the United States, it is considered a comfort food", price: 1.5, rating: 5)

        let pelmeni = Food(country: "🇷🇺 Russia", title: "Pelmeni", image: UIImage(named: "pelmeni"), description: "The filling can be minced meat (pork, lamb, beef, fish or any other kind of meat, venison being particularly traditional for colder regions) or mushrooms. The mixing together of different kinds of meat is also popular. The traditional Udmurt recipe requires a mixture of 45% beef, 35% mutton, and 20% pork. Various spices, such as black pepper and diced onions as well as garlic, are mixed into the filling. They are commonly topped with sour cream, mayonnaise, dill, red onions or vinegar, all of which are traditional to the region and can be produced in the Siberian climate.", price: 4.255, rating: 2.2)

        let mushroomSoup = Food(country: "🇺🇸 USA", title: "Cream of mushroom soup", image: UIImage(named: "mushroomSoup"), description: "Cream of mushroom soup is a simple type of soup where a basic roux is thinned with cream or milk and then mushrooms and/or mushroom broth are added. It is well known in North America as a common type of condensed canned soup. Cream of mushroom soup is often used as a base ingredient in casseroles and comfort foods. This use is similar to that of a mushroom-flavored gravy.", price: 3.25, rating: 4.8)

        let caesar = Food(country: "🇺🇸 USA", title: "Caesar salad", image: UIImage(named: "caesar"), description: "A Caesar salad (also spelled Cesar and Cesare) is a green salad of romaine lettuce and croutons dressed with lemon juice (or lime juice), olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper.", price: 2.3, rating: 4.3)



        return [neopolitanPizza, philadelphiaRoll, macAndCheese, pelmeni, mushroomSoup, caesar]
    }
}
