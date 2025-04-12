// performance art
// RIP Terry A. Davis


// This program maps the 640x480 screen to a segment of the complex plane,
// initializes each pixel’s starting z-value, and then iterates using the function:
//      z = z^2 + c
// where c is constant (here set to -0.8 + 0.156i).
// Each pixel is coloured based on the number of iterations it takes for |z| to exceed 2.
// Points that never diverge are coloured black.

U0 main()
{
    // Clear the screen.
    Cls();

    // Screen dimensions.
    I width = 640;
    I height = 480;

    // Maximum iteration count per pixel.
    I maxIter = 100;

    // Define the fixed complex constant for the Julia set.
    F64 cReal = -0.8;
    F64 cImag = 0.156;

    // Loop counters and iteration variable.
    I i, j, iter;
    F64 zReal, zImag, temp;

    // Variables for mapping pixel coordinate to complex plane.
    // We'll map:
    //   x-coordinate from -1.5 to +1.5,
    //   y-coordinate from -1.0 to +1.0.
    F64 scaleReal = 3.0 / width;    // (1.5 - (-1.5)) = 3.0
    F64 scaleImag = 2.0 / height;     // (1.0 - (-1.0)) = 2.0

    // Loop over every pixel.
    for (j = 0; j < height; j++)
    {
        for (i = 0; i < width; i++)
        {
            // Map pixel (i, j) to complex plane coordinate (zReal, zImag).
            zReal = i * scaleReal - 1.5;
            zImag = j * scaleImag - 1.0;

            // Reset iteration counter.
            iter = 0;

            // Iterate z = z^2 + c until divergence or max iterations reached.
            while ((zReal * zReal + zImag * zImag <= 4.0) && (iter < maxIter))
            {
                temp = zReal * zReal - zImag * zImag + cReal;
                zImag = 2.0 * zReal * zImag + cImag;
                zReal = temp;
                iter++;
            }

            // Choose a colour.
            I color;
            if (iter == maxIter)
                color = 0;       // Black for points that did not diverge.
            else
                color = iter % 16;  // Cycle through available colours.

            // Plot the pixel.
            Plot(i, j, color);
        }
    }

    // Display message and wait for key press before exiting.
    Print("\nJulia set drawn. Press any key to exit.\n");
    GetKey();
}
