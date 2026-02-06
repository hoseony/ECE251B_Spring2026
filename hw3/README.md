### 1: The Multiplier (Arithmetic & Logic)

**Task:** Write a program that takes two integers from the user, multiplies the first by 8 using a **shift instruction** (not `mul`), adds the second integer to that result, and stores the final sum in a memory location labeled `final_val`.

* **Goal:** Practice `sll` for powers of 2 and `sw` for memory storage.
* **Validation:** Use `print final_val` in SPIM to verify the math.

### 2: The Negative Counter (Control Flow)

**Task:** Given an array of signed integers, write a loop that counts how many numbers in the array are **negative** (less than 0). Store the final count in register `$s0`.

* **Array to use:** `array: .word 5, -2, 18, -1, -30`
* **Goal:** Use `slt` to check if a number is less than `$zero`.
* **Validation:** Step through the loop and watch `$s0` increment only when a negative number is loaded.

### 3: The Leaf Procedure (Basic Functions)

**Task:** Write a function `calc_perimeter` that takes two arguments (**length** and **width** in `$a0` and `$a1$`) and returns the perimeter of a rectangle (2 x (**length** + **width**)).

* **Focus:** Using registers without calling other functions.
* **Challenge:** Ensure no `$s` registers are modified without being saved and restored.

### 4: The Power Function (Procedures & Stack)

**Task:** Create a procedure called `square_plus_one`. It should take one argument (n), calculate n^2 + 1, and return the result.

* **Requirement:** The procedure must save at least one register on the **stack** during execution.
* **Goal:** Master `jal`, `jr`, and stack pointer ($sp) manipulation.
* **Validation:** Call the function with  in `main`. Verify that `$v0` contains `17` after the function returns.

### 5: The Nested Procedure (Functions calling Functions)

**Task:** Write a procedure `average_of_squares`.

1. It takes two arguments (a, b).
2. It calls a second procedure, `square`, for each argument.
3. It calculates the average of those two squares: (a^2 + b^2)/2.

* **Focus:** Saving the `$ra` (Return Address) on the stack. If they don't save `$ra`, the program will enter an infinite loop when it tries to return to `main`.

### 6: The Recursive Procedure (Self-Calling)

**Task:** Implement the **Factorial** function (n!).

* **Base Case:** If n < 1, return 1.
* **Recursive Step:** Return n x factorial(n-1).
* **Focus:** Managing the stack for multiple instances of the same function. Each call must have its own "frame" for n and the return address.

## Checklist: "The Debugging Lab"

Use this checklist when you get "stuck" on the exercises:

1. **Infinite Loop?** Check if you forgot to increment your iterator (e.g., `addi $t0, $t0, 1`).
2. **Wrong Memory Value?** Did you remember that each `.word` is **4 bytes**? (Your offset must be `i * 4` because MIPS is byte-addressable).
3. **Register Overwrite?** If your `main` values change after calling a function, check if you saved your `$s` registers on the stack.
4. **Crash on `jr $ra`?** Ensure you restored `$ra` from the stack if your procedure called another procedure (nested calls).
