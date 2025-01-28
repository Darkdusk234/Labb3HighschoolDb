using Labb3HighschoolDb.Models;
using Microsoft.Extensions.Options;

namespace Labb3HighschoolDb
{
    internal class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                PrintMenuChoices("Välkommen till Highschool högskolas databas." +
                        "\nSkriv siffran av det alternativ ni vill göra." +
                        "\n1. Hämta alla elever." +
                        "\n2. Hämta alla elever i en viss klass." +
                        "\n3. Lägg till ny personal." +
                        "\n4. Avsluta");

                int choice = UserMenuChoiceInputReader("Välkommen till Highschool högskolas databas." +
                        "\nSkriv siffran av det alternativ ni vill göra." +
                        "\n1. Hämta alla elever." +
                        "\n2. Hämta alla elever i en viss klass." +
                        "\n3. Lägg till ny personal." +
                        "\n4. Avsluta");

                if (choice == 1)
                {
                    Console.Clear();
                    ReadAllStudents();
                }
                else if (choice == 2)
                {
                    Console.Clear();
                    ReadAllStudentsInClass();
                }
                else if (choice == 3)
                {
                    Console.Clear();
                    AddNewEmployee();
                }
                else if (choice == 4)
                {
                    break;
                }
                else
                {
                    Console.WriteLine("Ogiltigt val. Se till att bara skriva siffror som finns som val.");
                    Console.ReadKey();
                    Console.Clear();
                }
            }
        }

        public static int UserMenuChoiceInputReader(string message)
        {
            int choice = 0;
            while (!int.TryParse(Console.ReadLine(), out choice))
            {
                Console.WriteLine("Det är inte ett giltigt alternativ." +
                    "Se till att bara skriva siffror som finns som alternativ");
                Console.ReadKey();
                Console.Clear();
                PrintMenuChoices(message);
            }
            return choice;
        }

        public static void PrintMenuChoices(string message)
        {
            Console.WriteLine(message);
        }

        public static void ReadAllStudents()
        {
            while (true)
            {
                PrintMenuChoices("Hur vill du att de ska vara sorterade?" +
                    "\n1. Förnamn efter stigande ordning" +
                    "\n2. Förnamn efter fallande ordning" +
                    "\n3. Efternamn efter stigande ordning" +
                    "\n4. Efternamn efter fallande ordning" +
                    "\n5. Avsluta");

                int choice = UserMenuChoiceInputReader("Hur vill du att de ska vara sorterade?" +
                    "\n1. Förnamn efter stigande ordning" +
                    "\n2. Förnamn efter fallande ordning" +
                    "\n3. Efternamn efter stigande ordning" +
                    "\n4. Efternamn efter fallande ordning" +
                    "\n5. Avsluta");

                if (choice == 1)
                {
                    Console.Clear();
                    using (var context = new HighschoolContext())
                    {
                        var students = context.Students
                            .OrderBy(s => s.FirstName)
                            .ToList();

                        if (students != null)
                        {
                            PrintStudents(students);
                        }
                        else
                        {
                            Console.WriteLine("Ingen data hittades i tabellen");
                        }
                    }
                }
                else if (choice == 2)
                {
                    Console.Clear();
                    using (var context = new HighschoolContext())
                    {
                        var students = context.Students
                            .OrderByDescending(s => s.FirstName)
                            .ToList();

                        if (students != null)
                        {
                            PrintStudents(students);
                        }
                        else
                        {
                            Console.WriteLine("Ingen data hittades i tabellen");
                        }
                    }
                }
                else if (choice == 3)
                {
                    Console.Clear();
                    using (var context = new HighschoolContext())
                    {
                        var students = context.Students
                            .OrderBy(s => s.LastName)
                            .ToList();
                        if (students != null)
                        {
                            PrintStudents(students);
                        }
                        else
                        {
                            Console.WriteLine("Ingen data hittades i tabellen");
                        }
                    }
                }
                else if (choice == 4)
                {
                    Console.Clear();
                    using (var context = new HighschoolContext())
                    {
                        var students = context.Students
                            .OrderByDescending(s => s.LastName)
                            .ToList();
                        if (students != null)
                        {
                            PrintStudents(students);
                        }
                        else
                        {
                            Console.WriteLine("Ingen data hittades i tabellen");
                        }
                    }
                }
                else if (choice == 5)
                {
                    Console.Clear();
                    break;
                }
                else
                {
                    Console.WriteLine("Ogiltigt val. Se till att bara skriva siffror som finns som val.");
                }

                Console.ReadKey();
                Console.Clear();
            }
        }

        public static void PrintStudents(List<Student> students)
        {
            foreach (var s in students)
            {
                Console.WriteLine($"{s.FirstName} {s.LastName}: Pers.nr {s.SocialSecurity}");
            }
        }

        public static void ReadAllStudentsInClass()
        {
            using (var context = new HighschoolContext())
            {
                while (true)
                {
                    var classes = context.Classes;
                    int choiceNumber = 0;
                    string classMenuChoiceList = "";
                    int classChoice;
                    int sortChoice;
                    int classId = 0;

                    if (classes != null)
                    {
                        foreach (var c in classes)
                        {
                            choiceNumber++;
                            if (choiceNumber == 1)
                            {
                                classMenuChoiceList = classMenuChoiceList + $"{choiceNumber}. {c.ClassName}";
                            }
                            else
                            {
                                classMenuChoiceList = classMenuChoiceList + $"\n{choiceNumber}. {c.ClassName}";
                            }
                        }
                    }
                    else
                    {
                        Console.WriteLine("Ingen Data Hittades i tabellen");
                    }

                    if (classMenuChoiceList != "")
                    {
                        PrintMenuChoices("Vilken klass vill du hämta eleverna från?" +
                            $"\n{classMenuChoiceList}" +
                            $"\n{choiceNumber + 1}. Avsluta");

                        classChoice = UserMenuChoiceInputReader("Vilken klass vill du hämta eleverna från?" +
                            $"\n{classMenuChoiceList}" +
                            $"\n{choiceNumber + 1}. Avsluta");

                        if (classChoice > 0 && classChoice <= choiceNumber)
                        {
                            classId = classes.ElementAt((classChoice - 1)).ClassId;
                        }
                        else if (classChoice == (choiceNumber + 1))
                        {
                            Console.Clear();
                            break;
                        }
                        else
                        {
                            Console.WriteLine("Ogiltigt val. Se till att bara skriva siffror som finns som val.");
                            Console.ReadKey();
                            Console.Clear();
                            continue;
                        }

                        Console.Clear();
                        PrintMenuChoices("Hur vill du att de ska vara sorterade?" +
                            "\n1. Förnamn efter stigande ordning" +
                            "\n2. Förnamn efter fallande ordning" +
                            "\n3. Efternamn efter stigande ordning" +
                            "\n4. Efternamn efter fallande ordning" +
                            "\n5. Avsluta");

                        int choice = UserMenuChoiceInputReader("Hur vill du att de ska vara sorterade?" +
                            "\n1. Förnamn efter stigande ordning" +
                            "\n2. Förnamn efter fallande ordning" +
                            "\n3. Efternamn efter stigande ordning" +
                            "\n4. Efternamn efter fallande ordning" +
                            "\n5. Avsluta");

                        if (choice == 1)
                        {
                            Console.Clear();
                            var students = context.Students
                                .Where(s => s.ClassId == classId)
                                .OrderBy(s => s.FirstName)
                                .ToList();

                            if (students != null)
                            {
                                PrintStudents(students);
                            }
                            else
                            {
                                Console.WriteLine("Ingen data hittades i tabellen");
                            }
                        }
                        else if (choice == 2)
                        {
                            Console.Clear();
                            var students = context.Students
                                .Where(s => s.ClassId == classId)
                                .OrderByDescending(s => s.FirstName)
                                .ToList();

                            if (students != null)
                            {
                                PrintStudents(students);
                            }
                            else
                            {
                                Console.WriteLine("Ingen data hittades i tabellen");
                            }
                        }
                        else if (choice == 3)
                        {
                            Console.Clear();
                            var students = context.Students
                                .Where(s => s.ClassId == classId)
                                .OrderBy(s => s.LastName)
                                .ToList();

                            if (students != null)
                            {
                                PrintStudents(students);
                            }
                            else
                            {
                                Console.WriteLine("Ingen data hittades i tabellen");
                            }
                        }
                        else if (choice == 4)
                        {
                            Console.Clear();
                            var students = context.Students
                                .Where(s => s.ClassId == classId)
                                .OrderByDescending(s => s.LastName)
                                .ToList();

                            if (students != null)
                            {
                                PrintStudents(students);
                            }
                            else
                            {
                                Console.WriteLine("Ingen data hittades i tabellen");
                            }
                        }
                        else if (choice == 5)
                        {
                            Console.Clear();
                            break;
                        }
                        else
                        {
                            Console.WriteLine("Ogiltigt val. Se till att bara skriva siffror som finns som val.");
                            Console.ReadKey();
                            Console.Clear();
                            continue;
                        }

                        Console.ReadKey();
                        Console.Clear();
                    }
                    else
                    {
                        Console.WriteLine("Inga klasser kunde hittas i Class tabellen.");
                    }

                }
            }

        }

        public static void AddNewEmployee()
        {
            using (var context = new HighschoolContext())
            {
                while(true)
                {
                    int choiceNumber = 0;
                    int roleChoice;
                    int roleId = 0;
                    string firstName = "";
                    string lastName = "";
                    string roleMenuChoiceList = "";
                    bool innerLoopQuit = false;
                    var roles = context.EmployeeRoles;

                    if (roles != null)
                    {
                        foreach (var role in roles)
                        {
                            choiceNumber++;
                            if (roleMenuChoiceList == "")
                            {
                                roleMenuChoiceList = roleMenuChoiceList + $"{choiceNumber}. {role.RoleName}";
                            }
                            else
                            {
                                roleMenuChoiceList = roleMenuChoiceList + $"\n{choiceNumber}. {role.RoleName}";
                            }
                        }
                    }
                    else
                    {
                        Console.WriteLine("Ingen Data Hittades i tabellen");
                    }

                    if (roleMenuChoiceList != "")
                    {
                        PrintMenuChoices("Vilken roll har den nya anställda?" +
                            $"\n{roleMenuChoiceList}" +
                            $"\n{choiceNumber + 1}. Avsluta");

                        roleChoice = UserMenuChoiceInputReader("Vilken roll har den nya anställda?" +
                            $"\n{roleMenuChoiceList}" +
                            $"\n{choiceNumber + 1}. Avsluta");

                        if (roleChoice > 0 && roleChoice <= choiceNumber)
                        {
                            roleId = roles.ElementAt((choiceNumber - 1)).RoleId;
                        }
                        else if (roleChoice == (choiceNumber + 1))
                        {
                            Console.Clear();
                            break;
                        }
                        else
                        {
                            Console.WriteLine("Ogiltigt val. Se till att bara skriva siffror som finns som val.");
                            Console.ReadKey();
                            Console.Clear();
                            continue;
                        }

                        Console.WriteLine($"Du valde {roles.ElementAt((choiceNumber - 1)).RoleName}. Tryck enter för att gå vidare.");
                        Console.ReadKey();
                        Console.Clear();

                        while(true)
                        { 
                            Console.WriteLine("Vad är den nya anställdas förnamn? Skriv QUIT om du vill avsluta.");
                            firstName = Console.ReadLine();

                            if (firstName == "")
                            {
                                Console.WriteLine("Du måste skriva något. Tryck enter för att gå tillbaka och försök igen.");
                                Console.ReadKey();
                                Console.Clear();
                                continue;
                            }
                            else if (firstName.ToUpper().Equals("QUIT"))
                            {
                                Console.Clear();
                                innerLoopQuit = true;
                                break;
                            }
                            else
                            {
                                Console.Clear();
                                Console.WriteLine($"Är {firstName} det namn du ville skriva in? Skriva Y för ja och N för nej");
                                string correctInputFirstName = Console.ReadLine();

                                if (correctInputFirstName.ToUpper().Equals("Y"))
                                {
                                    Console.Clear();
                                    break;
                                }
                                else if (correctInputFirstName.ToUpper().Equals("N"))
                                {
                                    Console.Clear();
                                    continue;
                                }
                                else
                                {
                                    Console.WriteLine("Ogiltig input, se till att bara antingen skriva Y eller N. " +
                                        "Tryck Enter för att skriva in namnet igen.");
                                    Console.ReadKey();
                                    Console.Clear();
                                    continue;
                                }
                            }
                        }

                        if (innerLoopQuit)
                        {
                            continue;
                        }

                        while (true)
                        {
                            Console.WriteLine("Vad är den nya anställdas efternamn? Skriv QUIT om du vill avsluta.");
                            lastName = Console.ReadLine();

                            if (firstName == "")
                            {
                                Console.WriteLine("Du måste skriva något. Tryck enter för att gå tillbaka och försök igen.");
                                Console.ReadKey();
                                Console.Clear();
                                continue;
                            }
                            else if (firstName.ToUpper().Equals("QUIT"))
                            {
                                Console.Clear();
                                innerLoopQuit = true;
                                break;
                            }
                            else
                            {
                                Console.Clear();
                                Console.WriteLine($"Är {lastName} det namn du ville skriva in? Skriva Y för ja och N för nej");
                                string correctInputLastName = Console.ReadLine();

                                if (correctInputLastName.ToUpper().Equals("Y"))
                                {
                                    Console.Clear();
                                    break;
                                }
                                else if (correctInputLastName.ToUpper().Equals("N"))
                                {
                                    Console.Clear();
                                    continue;
                                }
                                else
                                {
                                    Console.WriteLine("Ogiltig input, se till att bara antingen skriva Y eller N. " +
                                        "Tryck Enter för att skriva in namnet igen.");
                                    Console.ReadKey();
                                    Console.Clear();
                                    continue;
                                }
                            }
                        }

                        if (innerLoopQuit)
                        {
                            continue;
                        }

                        Console.WriteLine($"Den nya anställda heter {firstName} {lastName} och jobbar som {roles.ElementAt((choiceNumber - 1)).RoleName}, stämmer detta? Skriv N om det inte stämmer annars tryck bara enter.");
                        string correctInput = Console.ReadLine();

                        if (correctInput.ToUpper().Equals("N"))
                        {
                            Console.Clear();
                            continue;
                        }
                        else
                        {
                            Console.Clear();
                            Employee employee = new Employee
                            {
                                RoleId = roleId,
                                FirstName = firstName,
                                LastName = lastName
                            };

                            context.Employees.Add(employee);
                            context.SaveChanges();
                            Console.WriteLine("Den anställda är nu inlagd i databasen. Tryck enter för att gå tillbaka till början av inmatningarna.");
                            Console.ReadKey();
                            Console.Clear();
                        }


                    }
                    else
                    {
                        Console.WriteLine("Inga roller kunde hittas i EmployeeRoles tabellen.");
                    }
                }
            }
        }


    }
}
