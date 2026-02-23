# 🚀 Hexadecimal Multiplier in x86-64 Assembly

### 🧮 Multiplication Using Successive Addition 

---

## 🌟 Project Overview

This project is a **Linux x86-64 Assembly (NASM)** program that multiplies two **2-digit hexadecimal numbers** using the **Successive Addition Algorithm** (repeated addition).

Instead of using the processor’s `mul` instruction, the multiplication is performed manually — making this project perfect for:

* 🎓 Assembly Language Lab
* 🧠 Understanding low-level arithmetic
* ⚙️ Learning Linux system calls
* 🔍 Understanding ASCII ↔ Hex conversion

---

## 🎯 Features

✅ Accepts two 2-digit hexadecimal numbers
✅ Converts ASCII input to binary
✅ Performs multiplication using repeated addition
✅ Displays 16-bit hexadecimal result
✅ Uses Linux syscalls via a custom macro
✅ Clean modular subroutines

---

## 🛠 Tech Stack

* 💻 **Architecture:** x86-64
* 🧩 **Assembler:** NASM
* 🐧 **OS:** Linux
* 🔧 **Linker:** LD

---

## 📦 Project Structure

```
.
├── program.asm
└── README.md
```

### 🔹 Sections Used

| Section | Purpose                                |
| ------- | -------------------------------------- |
| `.data` | Stores prompts and messages            |
| `.bss`  | Reserves memory for inputs and results |
| `.text` | Contains program logic and subroutines |

---

## ⚙️ Build & Run

### 🔹 1. Assemble

```bash
nasm -f elf64 program.asm -o program.o
```

### 🔹 2. Link

```bash
ld program.o -o program
```

### 🔹 3. Execute

```bash
./program
```

---

## 🧠 How It Works

### 🔸 Step 1: Input

The user enters:

```
Enter X (2 hex digits):
Enter Y (2 hex digits):
```

### 🔸 Step 2: ASCII → Hex Conversion

Subroutine: `fetchInput`

* Reads 2 ASCII characters
* Converts:

  * `'0'–'9'`
  * `'A'–'F'`
* Produces a single byte value

---

### 🔸 Step 3: Multiplication (Core Logic)

Subroutine: `successiveAdd`

Algorithm:

```
result = 0
repeat num2 times:
    result += num1
```

✔ No `mul` instruction used
✔ Demonstrates manual arithmetic at register level

---

### 🔸 Step 4: Hex Output Formatting

Subroutine: `print`

* Converts 16-bit result into 4-digit hexadecimal ASCII
* Uses bitwise rotation (`ROL`)
* Prints using Linux syscall

---

## 🧪 Example Execution

```
Enter X (2 hex digits): 0A
Enter Y (2 hex digits): 05
Result: 0032
```

### 💡 Explanation

```
0A (10 decimal)
×
05 (5 decimal)
=
50 decimal
=
0032 hex
```

---

## 🔍 Core Components

### 🧩 IO Macro

```asm
%macro IO 4
    mov rax, %1
    mov rdi, %2
    mov rsi, %3
    mov rdx, %4
    syscall
%endmacro
```

Simplifies Linux syscalls:

| Syscall | Usage |
| ------- | ----- |
| 0       | Read  |
| 1       | Write |
| 60      | Exit  |

---

## 📚 Concepts Demonstrated

* 🧠 Low-level arithmetic implementation
* 🔄 Bitwise operations (`ROL`)
* 📥 Linux system calls
* 🧮 Manual multiplication algorithm
* 📦 Register management
* 🧩 Modular assembly programming

---

## ⚠️ Limitations

⚠ Accepts only uppercase hex (A–F)
⚠ No invalid input handling
⚠ Max result limited to 16-bit range

---

## 🎓 Ideal For

* Assembly Language Lab Practicals
* Viva Preparation
* Understanding Computer Architecture
* System Programming Basics

---

## 📄 License

This project is intended for **educational purposes only**.

---

---

If you want, I can also give you:

✨ A **super-stylish GitHub version with badges**
📊 A **flowchart diagram**
📝 A **lab manual format write-up**
🎥 A **step-by-step viva explanation script**
