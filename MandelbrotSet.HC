// performance art
// RIP Terry A. Davis

// Terminal key functions used: Cls(), Plot(), Print(), GetKey(), Sleep()

U0 main()
{
    // Clear the screen.
    Cls();

    // Define dimensions of the display.
    I width = 640;
    I height = 480;

    // Maximum number of iterations for each pixel.
    I maxIter = 100;

    // Loop indices and iteration counter.
    I i, j, iter;

    // Variables for mapping and iterative computation.
    F64 cReal, cImag;  // The constant 'c' in the Mandelbrot formula.
    F64 zReal, zImag;  // Components of z = zReal + i*zImag.
    F64 temp;          // Temporary variable for computations.

    // Loop over every pixel coordinate.
    for (j = 0; j < height; j++)
    {
        for (i = 0; i < width; i++)
        {
            // Map pixel (i,j) to a point (cReal, cImag) in the complex plane.
            // Real axis: from -2.0 to +1.0
            // Imaginary axis: from -1.0 to +1.0
            cReal = i * (3.0 / width) - 2.0;
            cImag = j * (2.0 / height) - 1.0;

            // Initialize z = 0 + 0i.
            zReal = 0.0;
            zImag = 0.0;
            iter = 0;

            // Iterate the function z = z^2 + c until z diverges (|z| > 2)
            // or we reach the maximum iteration.
            while ((zReal * zReal + zImag * zImag <= 4.0) && (iter < maxIter))
            {
                // Compute z^2: new real part = zReal^2 - zImag^2, new imag part = 2*zReal*zImag.
                temp = zReal * zReal - zImag * zImag + cReal;
                zImag = 2.0 * zReal * zImag + cImag;
                zReal = temp;
                iter++;
            }

            // Determine a colour based on the number of iterations.
            // If we hit max iterations, assume the point is in the Mandelbrot set.
            I color;
            if (iter == maxIter)
                color = 0;        // Use black for points inside the set.
            else
                color = iter % 16;  // Cycle through available 16 colours for points outside.

            // Plot the pixel at (i,j) with the computed colour.
            Plot(i, j, color);
        }
    }

    // Inform the user and wait for a key press before exiting.
    Print("\nMandelbrot set drawn. Press any key to exit.\n");
    GetKey();
}
