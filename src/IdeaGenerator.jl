clear() = run(`cmd /c cls`)

#region Base Idea Datas
@enum IdeaCategories begin
    MainCharacter
    Place
    Action
    Obstacle
    Enemy
    Time
end

mutable struct Ideas
    category::IdeaCategories
    value::String  
  end
#endregion

dico = [
    # Main Character
    Ideas(MainCharacter, "Spider"),
    Ideas(MainCharacter, "Lion"),
    Ideas(MainCharacter, "Hockey Player"),

    # Place
    Ideas(Place, "Coffee Shop"),
    Ideas(Place, "High School"),
    Ideas(Place, "Home"),

    # Action
    Ideas(Action, "Searching for someone"),
    Ideas(Action, "Running from someone"),
    Ideas(Action, "Trying to take a coffee"),

    # Obstacle
    Ideas(Obstacle, "Too many people"),
    Ideas(Obstacle, "An earthquake"),
    Ideas(Obstacle, "A lost dog keeps on jumping on you"),

    # Enemy
    Ideas(Enemy, "Main Character's aunt"),
    Ideas(Enemy, "The company boss"),
    Ideas(Enemy, "The neighboring village"),

    # Time
    Ideas(Time, "Year 2020"),
    Ideas(Time, "Middle Age"),
    Ideas(Time, "Year 1492")
]

#region Main Functions
function chooseCategoriesToSearch()
    clear()
    println("Please choose the category you wish to get randomized: \n")

    for c in instances(IdeaCategories)
        println("$(Int(c)) - $(c)")
    end
    
    categoryChosen = parse(Int, readline())

    if (categoryChosen < length(instances(IdeaCategories)))
        generateIdea(categoryChosen)
    else
        chooseCategoriesToSearch()
    end
end

function generateIdea(index)
    clear()
    tempDico = []

    for v in dico
        if (Int(v.category) == index)
            push!(tempDico, v.value)
        end
    end

    randNumber = rand((1, length(tempDico)))
    ideaGenerated = tempDico[randNumber]

    println("Your idea is: $ideaGenerated")

    println("To generate again an idea in this category, please enter 0.")
    println("Enter anything else to go back to the category menu")

    command = readline()

    if (command == "0")
        generateIdea(index)
    else
        chooseCategoriesToSearch()
    end
end
#endregion

chooseCategoriesToSearch()
println("Called")