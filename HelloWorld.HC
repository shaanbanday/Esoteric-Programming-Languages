// performance art
// RIP Terry A. Davis

//---------------------------------------------------------------------
// Function: InitializeSystem
// Description: Displays the program header and performs basic init.
U0 InitializeSystem()
{
    Print("******************************\n");
    Print("*        WHERE AM I?         *\n");
    Sleep(500);
    Print("*        WHO AM I?           *\n");
    Sleep(500);
    Print("*        WHY AM I?           *\n");
    Sleep(500);
    Print("*****************************\n");
    Sleep(500);
}

//---------------------------------------------------------------------
// Function: LoadModules
// Description: Simulates loading various system modules.
U0 LoadModules()
{
    Print("Loading core modules...\n");
    Sleep(200);
    
    Print("Module A: Display Interface ... OK\n");
    Sleep(100);
    
    Print("Module B: System Utilities   ... OK\n");
    Sleep(100);
    
    Print("Module C: Randomisation Engine ... OK\n");
    Sleep(100);
    
    Print("All modules loaded successfully.\n\n");
    Sleep(500);
}

//---------------------------------------------------------------------
// Function: ConfigureDisplay
// Description: Simulates display configuration steps.
U0 ConfigureDisplay()
{
    Print("Configuring display settings...\n");
    Sleep(300);
    
    Print("Display configured: Resolution set to 640x480, Colour depth: 16 colours.\n\n");
    Sleep(200);
}

//---------------------------------------------------------------------
// Function: GenerateHelloMessage
// Description: Builds and returns the "Hello, World!" message with flair.
U8* GenerateHelloMessage()
{
    static U8 message[256];
    StrCpy(message, "Hello, World!");
    StrCat(message, " ~ From the depths of HolyC");
    return message;
}

//---------------------------------------------------------------------
// Function: PrintBorderedMessage
// Description: Prints the provided message inside a decorative border.
U0 PrintBorderedMessage(U8 *msg)
{
    int len = StrLen(msg);
    int i;
    
    // Top border
    Print("+");
    for(i = 0; i < len + 4; i++)
        Print("-");
    Print("+\n");
    
    // Message row with side borders
    Print("|  ");
    Print(msg);
    Print("  |\n");
    
    // Bottom border
    Print("+");
    for(i = 0; i < len + 4; i++)
        Print("-");
    Print("+\n");
}

//---------------------------------------------------------------------
// Function: MainLoop
// Description: Provides an interactive loop to display the greeting again,
// or exit the program when requested.
U0 MainLoop()
{
    U8 input[50];
    Print("Type 'exit' to end the program, or press Enter to display the greeting again.\n");
    
    while(TRUE)
    {
        Print("\nCommand > ");
        GetStr(input, 50);
        if (StrCmp(input, "exit") == 0)
        {
            Print("Exiting interactive loop...\n");
            break;
        }
        else
        {
            U8 *msg = GenerateHelloMessage();
            PrintBorderedMessage(msg);
        }
    }
}

//---------------------------------------------------------------------
// Function: ShutdownSystem
// Description: Simulates shutdown procedures and final cleanup.
U0 ShutdownSystem()
{
    Print("\nPerforming system shutdown sequence...\n");
    Sleep(300);
    
    Print("Finalising logs...\n");
    Sleep(200);
    
    Print("Goodbye from the Complex HelloWorld Program.\n");
    Sleep(200);
}

//---------------------------------------------------------------------
// Main: Program Entry Point
// Combines all initialization, display, interactive, and shutdown routines.
U0 main()
{
    InitializeSystem();
    LoadModules();
    ConfigureDisplay();
    
    U8 *msg = GenerateHelloMessage();
    PrintBorderedMessage(msg);
    
    MainLoop();
    
    ShutdownSystem();
}
