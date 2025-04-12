// performance art
// rip Terry A. Davis

// Main program entry point
U0 main()
{
    U8 input[100];       // buffer for user input
    U8 *response;        // pointer to response string
    int mode;            // 0 = Prophet Mode, 1 = Hacker Mode

    // Main loop: prompt and process input
    while (TRUE)
    {
        Print("ChatGPTFromHell> ");
        GetStr(input, 100);
        
        // Exit command
        if (StrCmp(input, "exit") == 0)
        {
            Print("Fare thee well, mortal.\n");
            break;
        }
        
        // Easter egg: special responses for certain keywords
        if (StrStr(input, "terry") != NULL)
        {
            Print("Legends need not be disturbed.\n\n");
            continue;
        }
        if (StrStr(input, "truth") != NULL)
        {
            Print("Some secrets are divinely hidden.\n\n");
            continue;
        }
        
        // Simulate "thinking" with a brief loading animation
        Print("Summoning divine wisdom");
        int i;
        for (i = 0; i < 3; i++)
        {
            Sleep(100);
            Print(".");
        }
        Print("\n");

        // Determine mode based on input keywords:
        // Use Hacker Mode if "error", "bug", or "system" are found, else Prophet Mode.
        mode = 0;  // default to Prophet Mode
        if (StrStr(input, "error") != NULL ||
            StrStr(input, "bug") != NULL ||
            StrStr(input, "system") != NULL)
        {
            mode = 1;
        }
        
        // Generate a response based on the chosen mode
        response = GenerateResponse(input, mode);
        Print("TempleGPT: ");
        Print(response);
        Print("\n\n");
    }
}

// Function: GenerateResponse
// Creates a pseudo-AI response by randomly selecting a response template.
U8* GenerateResponse(U8 *input, int mode)
{
    static U8 buffer[256];
    int index;
    
    if (mode == 0)  // Prophet Mode: poetic, mysterious tone
    {
        // Array of opening phrases
        U8 *templates[3] = {
            "Lo, the data is revealed: ",
            "Behold, your query is answered: ",
            "By divine code, I proclaim: "
        };
        // Array of pre-canned responses
        U8 *replies[3] = {
            "your dreams are but reflections in silicon.",
            "the recursion of fate envelops you.",
            "truth flows in streams of zeros and ones."
        };
        index = Rnd(0, 3);   // Random selection between 0 and 2
        StrCpy(buffer, templates[index]);
        StrCat(buffer, replies[index]);
    }
    else  // Hacker Mode: glitchy, tongue-in-cheek error vibe
    {
        U8 *templates[3] = {
            "Segfault imminent: ",
            "System crash detected: ",
            "Kernel panic: "
        };
        U8 *replies[3] = {
            "your logic is corrupted beyond repair.",
            "undefined behaviour reigns supreme.",
            "debug mode activated—reality halted."
        };
        index = Rnd(0, 3);
        StrCpy(buffer, templates[index]);
        StrCat(buffer, replies[index]);
    }
    return buffer;
}
